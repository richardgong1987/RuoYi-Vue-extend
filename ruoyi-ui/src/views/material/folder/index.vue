<template>
  <div class="app-container">
    <el-button type="primary" @click.native="handleUploadFileBtnClick(2)"
    >上传文件夹
    </el-button
    >

    <div>
      <div style="padding: 15px;">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item v-for="v in filePathHistory">
            <span @click="goHistoryDir(v)"> {{ v }}</span>
          </el-breadcrumb-item>
        </el-breadcrumb>
      </div>
      <el-table
        :data="fileList"
        style="width: 100%">
        <el-table-column
          label="文件名称">
          <template v-slot="scope">
            <div @click="moreObject(scope.row.objectName)" v-if="scope.row.isDir"><i
              style="font-weight: bold;font-size: 25px;" class="el-icon-folder"> </i>
              {{ getObjectNormalName(scope.row.objectName, true) }}
            </div>
            <div v-else>{{ getObjectNormalName(scope.row.objectName, false) }}</div>
          </template>
        </el-table-column>

      </el-table>

    </div>

  </div>
</template>


<script>
import {listObjects} from '@/api/file/mapping'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import {getToken} from '@/utils/auth'
import {getUserProfile} from '@/api/system/user'

export default {
  name: 'FileDrive',
  dicts: ['sys_show_hide', 'sys_normal_disable'],
  data() {
    return {
      filePathHistory: [],
      files: [],
      postAction: process.env.VUE_APP_BASE_API + '/upload', // 上传的图片服务器地址

      userId: 1,
      userName: '',
      headers: {Authorization: 'Bearer ' + getToken()},
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
      title: '',
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
          {required: true, message: '文件名称不能为空', trigger: 'blur'}
        ],
        orderNum: [
          {required: true, message: '文件顺序不能为空', trigger: 'blur'}
        ],
        path: [
          {required: true, message: '路由地址不能为空', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    this.getList()

  },
  computed: {
    // 上传文件组件参数
    uploadFileParams: {
      get() {
        let res = {
          filePath: this.filePath,
          isDir: 0
        }
        return res
      },
      set() {
        return {
          filePath: '/',
          isDir: 0
        }
      }
    }
  },
  methods: {
    goHistoryDir(dir) {
      let relativePath = this.queryParams.relativePath;
      relativePath.search(dir);
      this.queryParams.relativePath = relativePath.slice(0, relativePath.search(dir));
      this.getListObject();
    },
    getObjectNormalName(objectName, isDir) {
      if (isDir) {
        var split = objectName.split('/');
        split.pop();
        return split.pop();
      }
      return objectName.split('/').pop();
    },
    moreObject: function (objectName) {
      this.queryParams.relativePath = objectName;
      this.getListObject();
    },
    getListObject() {
      this.filePathHistory = this.queryParams.relativePath.split('/').filter(v => v);
      listObjects(this.queryParams).then(response => {
        let data = response.data;
        for (let datum of data) {
          datum.objectName = datum.objectName.replace(/^\d+?\//g, "/");
        }
        this.fileList = data;
        this.loading = false
      });
    },
    handleUploadFileBtnClick(uploadWay) {
      this.$uploadFile({
        params: this.uploadFileParams,
        uploadWay
      }).then((res) => {

      })
    },

    handlePreview(file) {
      console.log(file)
    },
    // 选择图标
    selected(name) {
      this.form.icon = name
    },
    /** 查询文件列表 */
    getList: async function () {
      this.loading = true

      var userId = this.$route.params && this.$route.params.teacherId
      var userName = this.$route.params && this.$route.params.teachName
      if (!userName) {
        var {data: {userId, userName}} = await getUserProfile()
      }
      this.userId = userId
      this.userName = userName
      this.queryParams.createBy = userName
      this.queryParams.userId = userId
      this.queryParams.relativePath = ""
      this.getListObject();

    },
    // 表单重置
    reset() {
      this.form = {
        menuId: undefined,
        parentId: 0,
        menuName: undefined,
        icon: undefined,
        createBy: this.userName,
        menuType: 'M',
        orderNum: 0,
        isFrame: '1',
        isCache: '0',
        visible: '0',
        status: '0'
      }
      this.resetForm('form')
    },
  }
}
</script>
