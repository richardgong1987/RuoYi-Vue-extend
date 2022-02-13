<template>
  <div class="app-container">
    <el-dropdown-item @click.native="handleUploadFileBtnClick(2)"
    >上传文件夹</el-dropdown-item
    >
  </div>
</template>


<script>
import { addFileDrive, delFileDrive, getFileDrive, listFileDrive, updateFileDrive } from '@/api/material/fileDrive'
import { addMapping, delMapping, listMapping } from '@/api/file/mapping'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { getToken } from '@/utils/auth'
import { getUserProfile } from '@/api/system/user'

export default {
  name: 'FileDrive',
  dicts: ['sys_show_hide', 'sys_normal_disable'],
  data() {
    return {
      files: [],
      postAction: process.env.VUE_APP_BASE_API + '/upload', // 上传的图片服务器地址

      userId: 1,
      userName: '',
      headers: { Authorization: 'Bearer ' + getToken() },
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
          { required: true, message: '文件名称不能为空', trigger: 'blur' }
        ],
        orderNum: [
          { required: true, message: '文件顺序不能为空', trigger: 'blur' }
        ],
        path: [
          { required: true, message: '路由地址不能为空', trigger: 'blur' }
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
    },
  },
  methods: {
    handleUploadFileBtnClick(uploadWay) {
      this.$uploadFile({
        params: this.uploadFileParams,
        uploadWay
      }).then((res) => {
        if (res) {
          this.$emit('getTableDataByType')
          this.$store.dispatch('showStorage')
        }
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
    getList: async function() {
      this.loading = true

      var userId = this.$route.params && this.$route.params.teacherId
      var userName = this.$route.params && this.$route.params.teachName
      console.log(userName)
      if (!userName) {
        var { data: { userId, userName } } = await getUserProfile()
      }
      console.log(userName)
      this.userId = userId
      this.userName = userName
      this.queryParams.createBy = userName
      listFileDrive(this.queryParams).then(response => {
        this.menuList = this.handleTree(response.data, 'menuId')
        this.loading = false
      })
    },
    /** 转换文件数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children
      }
      return {
        id: node.menuId,
        label: node.menuName,
        children: node.children
      }
    },
    /** 查询文件下拉树结构 */
    getTreeselect() {
      listFileDrive().then(response => {
        this.menuOptions = []
        const menu = { menuId: 0, menuName: '主类目', children: [] }
        menu.children = this.handleTree(response.data, 'menuId')
        this.menuOptions.push(menu)
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
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
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    /** 新增目录按钮操作 */
    handleAdd(row) {
      this.reset()
      this.getTreeselect()
      if (row != null && row.menuId) {
        this.form.parentId = row.menuId
      } else {
        this.form.parentId = 0
      }
      this.open = true
      this.title = '添加文件'
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false
      this.isExpandAll = !this.isExpandAll
      this.$nextTick(() => {
        this.refreshTable = true
      })
    },
    handleSuccess: async function({ data }, fileList) {
      var params = { userId: this.userId, createBy: this.userName, menuId: this.form.menuId, ...data }
      await addMapping(params)
      this.getMapplist()
    },

    handleRemove({ id }, fileList) {
      if (id) {
        delMapping(id)
      }
    },
    getMapplist() {
      listMapping({ userId: this.userId, menuId: this.form.menuId, createBy: this.userName }).then(response => {
        this.fileList = response.data
      })
    },
    /** 上传文件按钮操作 */
    handleUpdate: async function(row) {
      this.reset()
      this.getTreeselect()
      getFileDrive(row.menuId).then(response => {
        this.form = response.data
        this.getMapplist()
        this.open = true
        this.title = '上传文件文件'
      })
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.menuId != undefined) {
            this.submitUpload()
            updateFileDrive(this.form).then(response => {
              this.$modal.msgSuccess('上传文件成功')
              this.open = false
              this.getList()
            })
          } else {
            addFileDrive(this.form).then(response => {
              this.$modal.msgSuccess('新增目录成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$modal.confirm('是否确认删除名称为"' + row.menuName + '"的数据项？').then(function() {
        return delFileDrive(row.menuId)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    }
  }
}
</script>
