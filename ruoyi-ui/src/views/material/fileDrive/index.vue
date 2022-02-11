<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="菜单名称" prop="menuName">
        <el-input
          v-model="queryParams.menuName"
          placeholder="请输入菜单名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="父菜单ID" prop="parentId">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入父菜单ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="显示顺序" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入显示顺序"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="路由地址" prop="path">
        <el-input
          v-model="queryParams.path"
          placeholder="请输入路由地址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组件路径" prop="component">
        <el-input
          v-model="queryParams.component"
          placeholder="请输入组件路径"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="路由参数" prop="query">
        <el-input
          v-model="queryParams.query"
          placeholder="请输入路由参数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否为外链" prop="isFrame">
        <el-input
          v-model="queryParams.isFrame"
          placeholder="请输入是否为外链"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否缓存" prop="isCache">
        <el-input
          v-model="queryParams.isCache"
          placeholder="请输入是否缓存"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="菜单状态" prop="visible">
        <el-input
          v-model="queryParams.visible"
          placeholder="请输入菜单状态"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="权限标识" prop="perms">
        <el-input
          v-model="queryParams.perms"
          placeholder="请输入权限标识"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="菜单图标" prop="icon">
        <el-input
          v-model="queryParams.icon"
          placeholder="请输入菜单图标"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['material:fileDrive:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['material:fileDrive:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['material:fileDrive:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['material:fileDrive:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="fileDriveList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="菜单ID" align="center" prop="menuId" />
      <el-table-column label="菜单名称" align="center" prop="menuName" />
      <el-table-column label="父菜单ID" align="center" prop="parentId" />
      <el-table-column label="显示顺序" align="center" prop="orderNum" />
      <el-table-column label="路由地址" align="center" prop="path" />
      <el-table-column label="组件路径" align="center" prop="component" />
      <el-table-column label="路由参数" align="center" prop="query" />
      <el-table-column label="是否为外链" align="center" prop="isFrame" />
      <el-table-column label="是否缓存" align="center" prop="isCache" />
      <el-table-column label="菜单类型" align="center" prop="menuType" />
      <el-table-column label="菜单状态" align="center" prop="visible" />
      <el-table-column label="菜单状态" align="center" prop="status" />
      <el-table-column label="权限标识" align="center" prop="perms" />
      <el-table-column label="菜单图标" align="center" prop="icon" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['material:fileDrive:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['material:fileDrive:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改菜单权限对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="菜单名称" prop="menuName">
          <el-input v-model="form.menuName" placeholder="请输入菜单名称" />
        </el-form-item>
        <el-form-item label="父菜单ID" prop="parentId">
          <el-input v-model="form.parentId" placeholder="请输入父菜单ID" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />
        </el-form-item>
        <el-form-item label="路由地址" prop="path">
          <el-input v-model="form.path" placeholder="请输入路由地址" />
        </el-form-item>
        <el-form-item label="组件路径" prop="component">
          <el-input v-model="form.component" placeholder="请输入组件路径" />
        </el-form-item>
        <el-form-item label="路由参数" prop="query">
          <el-input v-model="form.query" placeholder="请输入路由参数" />
        </el-form-item>
        <el-form-item label="是否为外链" prop="isFrame">
          <el-input v-model="form.isFrame" placeholder="请输入是否为外链" />
        </el-form-item>
        <el-form-item label="是否缓存" prop="isCache">
          <el-input v-model="form.isCache" placeholder="请输入是否缓存" />
        </el-form-item>
        <el-form-item label="菜单状态" prop="visible">
          <el-input v-model="form.visible" placeholder="请输入菜单状态" />
        </el-form-item>
        <el-form-item label="权限标识" prop="perms">
          <el-input v-model="form.perms" placeholder="请输入权限标识" />
        </el-form-item>
        <el-form-item label="菜单图标" prop="icon">
          <el-input v-model="form.icon" placeholder="请输入菜单图标" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFileDrive, getFileDrive, delFileDrive, addFileDrive, updateFileDrive } from "@/api/material/fileDrive";

export default {
  name: "FileDrive",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 菜单权限表格数据
      fileDriveList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        menuName: null,
        parentId: null,
        orderNum: null,
        path: null,
        component: null,
        query: null,
        isFrame: null,
        isCache: null,
        menuType: null,
        visible: null,
        status: null,
        perms: null,
        icon: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        menuName: [
          { required: true, message: "菜单名称不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询菜单权限列表 */
    getList() {
      this.loading = true;
      listFileDrive(this.queryParams).then(response => {
        this.fileDriveList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        menuId: null,
        menuName: null,
        parentId: null,
        orderNum: null,
        path: null,
        component: null,
        query: null,
        isFrame: null,
        isCache: null,
        menuType: null,
        visible: null,
        status: "0",
        perms: null,
        icon: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.menuId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加菜单权限";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const menuId = row.menuId || this.ids
      getFileDrive(menuId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改菜单权限";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.menuId != null) {
            updateFileDrive(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFileDrive(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const menuIds = row.menuId || this.ids;
      this.$modal.confirm('是否确认删除菜单权限编号为"' + menuIds + '"的数据项？').then(function() {
        return delFileDrive(menuIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('material/fileDrive/export', {
        ...this.queryParams
      }, `fileDrive_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
