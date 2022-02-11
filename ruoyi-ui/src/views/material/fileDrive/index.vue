<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch">
      <el-form-item label="文件名称" prop="menuName">
        <el-input
          v-model="queryParams.menuName"
          placeholder="请输入文件名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="文件状态" clearable size="small">
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:menu:add']"
        >新增目录
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="menuList"
      row-key="menuId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column prop="menuName" label="文件名称" :show-overflow-tooltip="true" width="160"></el-table-column>
      <el-table-column prop="orderNum" label="排序" width="60"></el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:menu:edit']"
          >上传文件
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['system:menu:add']"
          >新增目录
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:menu:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或上传文件文件对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="680px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="上级文件">
              <treeselect
                v-model="form.parentId"
                :options="menuOptions"
                :normalizer="normalizer"
                :show-count="true"
                placeholder="选择上级文件"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="目录名称" prop="menuName">
              <el-input v-model="form.menuName" placeholder="请输入目前名称"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="显示排序" prop="orderNum">
              <el-input-number v-model="form.orderNum" controls-position="right" :min="0"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-upload v-if="this.form.menuId"
                   name="file"
                   multiple="multiple"
                   :headers="headers"
                   class="upload-demo"
                   ref="upload"
                   :action="uploadUrl"
                   :on-preview="handlePreview"
                   :on-success="handleSuccess"
                   :on-remove="handleRemove"
                   :file-list="fileList"
                   :auto-upload="false">
          <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
          <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
          <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
        </el-upload>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>


<script>
import {addFileDrive, delFileDrive, getFileDrive, listFileDrive, updateFileDrive} from "@/api/material/fileDrive";
import {addMapping, delMapping, listMapping} from "@/api/file/mapping";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import IconSelect from "@/components/IconSelect";
import {getToken} from "@/utils/auth";
import {getUserProfile} from "@/api/system/user";

export default {
  name: "FileDrive",
  dicts: ['sys_show_hide', 'sys_normal_disable'],
  components: {Treeselect, IconSelect},
  data() {

    return {
      userId: 1,
      headers: {Authorization: "Bearer " + getToken()},
      uploadUrl: `${location.protocol}//${location.hostname}:8080/upload`,
      fileList: [],
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 文件表格树数据
      menuList: [],
      // 文件树选项
      menuOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部折叠
      isExpandAll: false,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        menuName: undefined,
        visible: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        menuName: [
          {required: true, message: "文件名称不能为空", trigger: "blur"}
        ],
        orderNum: [
          {required: true, message: "文件顺序不能为空", trigger: "blur"}
        ],
        path: [
          {required: true, message: "路由地址不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    submitUpload() {
      this.$refs.upload.submit();
    },

    handlePreview(file) {
      console.log(file);
    },
    // 选择图标
    selected(name) {
      this.form.icon = name;
    },
    /** 查询文件列表 */
    getList: async function () {
      this.loading = true;
      let {data: {userId, userName}} = await getUserProfile();
      this.userId = userId;
      this.userName = userName;
      this.queryParams.createBy = userName;
      listFileDrive(this.queryParams).then(response => {
        this.menuList = this.handleTree(response.data, "menuId");
        this.loading = false;
      });
    },
    /** 转换文件数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.menuId,
        label: node.menuName,
        children: node.children
      };
    },
    /** 查询文件下拉树结构 */
    getTreeselect() {
      listFileDrive().then(response => {
        this.menuOptions = [];
        const menu = {menuId: 0, menuName: '主类目', children: []};
        menu.children = this.handleTree(response.data, "menuId");
        this.menuOptions.push(menu);
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        menuId: undefined,
        parentId: 0,
        menuName: undefined,
        icon: undefined,
        createBy: this.userName,
        menuType: "M",
        orderNum: 0,
        isFrame: "1",
        isCache: "0",
        visible: "0",
        status: "0"
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增目录按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != null && row.menuId) {
        this.form.parentId = row.menuId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "添加文件";
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    handleSuccess({data}, fileList) {
      var params = {userId: this.userId, menuId: this.form.menuId, ...data};
      addMapping(params);
    },

    handleRemove({id}, fileList) {
      delMapping(id);
    },
    /** 上传文件按钮操作 */
    handleUpdate: async function (row) {
      this.reset();
      this.getTreeselect();
      listMapping({userId: this.userId, menuId: row.menuId}).then(response => {
        this.fileList = response.data;
      });
      getFileDrive(row.menuId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "上传文件文件";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.menuId != undefined) {
            this.submitUpload();
            updateFileDrive(this.form).then(response => {
              this.$modal.msgSuccess("上传文件成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFileDrive(this.form).then(response => {
              this.$modal.msgSuccess("新增目录成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$modal.confirm('是否确认删除名称为"' + row.menuName + '"的数据项？').then(function () {
        return delFileDrive(row.menuId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    }
  }
};
</script>
