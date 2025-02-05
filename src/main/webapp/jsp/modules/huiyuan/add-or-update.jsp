<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑会员信息</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">会员信息管理</li>
                        <li class="breadcrumb-item active">编辑会员信息</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">会员信息信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>姓名</label>
                                        <input id="huiyuanName" name="huiyuanName" class="form-control"
                                               placeholder="姓名">
                                    </div>
                                <div class="form-group col-md-6">
                                    <label>手机号</label>
                                    <input id="huiyuanPhone" name="huiyuanPhone" class="form-control"
                                           onchange="huiyuanPhoneChickValue(this)"  placeholder="手机号">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>身份证号</label>
                                    <input id="huiyuanIdNumber" name="huiyuanIdNumber" class="form-control"
                                           onchange="huiyuanIdNumberChickValue(this)"  placeholder="身份证号">
                                </div>
                                   <div class="form-group col-md-6">
                                       <label>性别</label>
                                       <select id="sexTypesSelect" name="sexTypes" class="form-control">
                                       </select>
                                   </div>
                                   <div class="form-group col-md-6">
                                       <label>照片</label>
                                       <img id="huiyuanPhotoImg" src="" width="100" height="100">
                                       <input name="file" type="file" id="huiyuanPhotoupload"
                                              class="form-control-file">
                                       <input name="huiyuanPhoto" id="huiyuanPhoto-input" type="hidden">
                                   </div>
                                    <div class="form-group col-md-6">
                                        <label>民族</label>
                                        <input id="nation" name="nation" class="form-control"
                                               placeholder="民族">
                                    </div>
                                   <div class="form-group col-md-6">
                                       <label>政治面貌</label>
                                       <select id="politicsTypesSelect" name="politicsTypes" class="form-control">
                                       </select>
                                   </div>
                                    <div class="form-group col-md-6">
                                        <label>籍贯</label>
                                        <input id="birthplace" name="birthplace" class="form-control"
                                               placeholder="籍贯">
                                    </div>
                                <div class="form-group col-md-6">
                                    <label>积分</label>
                                    <input id="jifen" name="jifen" class="form-control"
                                           onchange="jifenChickValue(this)"  placeholder="积分">
                                </div>

                                   <div class="form-group col-md-6">
                                       <label>积分等级</label>
                                       <select id="jifenTypesSelect" name="jifenTypes" class="form-control">
                                       </select>
                                   </div>
                                   <div class="form-group col-md-6">
                                       <label>会员状态</label>
                                       <select id="huiyuanTypesSelect" name="huiyuanTypes" class="form-control">
                                       </select>
                                   </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
</script><script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "huiyuan";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var sexTypesOptions = [];
    var politicsTypesOptions = [];
    var jifenTypesOptions = [];
    var huiyuanTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#huiyuanPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('huiyuanPhotoImg').setAttribute('src',photoUrl);
                document.getElementById('huiyuanPhoto-input').setAttribute('value',photoUrl);
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
           if($("#huiyuanIdNumber") !=null){
               var huiyuanIdNumber = $("#huiyuanIdNumber").val();
               if(huiyuanIdNumber == null || huiyuanIdNumber =='' || huiyuanIdNumber == 'null'){
                   alert("身份证号  Search111 不能为空");
                   return;
               }
           }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                successMes = '添加成功';
            }
            httpJson("huiyuan/" + urlParam, "POST", data, (res) => {
                if(res.code == 0)
                {
                    window.sessionStorage.removeItem('addhuiyuan');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function sexTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
                if(res.code == 0){
                    sexTypesOptions = res.data.list;
                }
            });
        }
        function politicsTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=politics_types", "GET", {}, (res) => {
                if(res.code == 0){
                    politicsTypesOptions = res.data.list;
                }
            });
        }
        function jifenTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=jifen_types", "GET", {}, (res) => {
                if(res.code == 0){
                    jifenTypesOptions = res.data.list;
                }
            });
        }
        function huiyuanTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=huiyuan_types", "GET", {}, (res) => {
                if(res.code == 0){
                    huiyuanTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationSextypesSelect(){
            var sexTypesSelect = document.getElementById('sexTypesSelect');
            if(sexTypesSelect != null && sexTypesOptions != null  && sexTypesOptions.length > 0 ){
                for (var i = 0; i < sexTypesOptions.length; i++) {
                    sexTypesSelect.add(new Option(sexTypesOptions[i].indexName,sexTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationPoliticstypesSelect(){
            var politicsTypesSelect = document.getElementById('politicsTypesSelect');
            if(politicsTypesSelect != null && politicsTypesOptions != null  && politicsTypesOptions.length > 0 ){
                for (var i = 0; i < politicsTypesOptions.length; i++) {
                    politicsTypesSelect.add(new Option(politicsTypesOptions[i].indexName,politicsTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationJifentypesSelect(){
            var jifenTypesSelect = document.getElementById('jifenTypesSelect');
            if(jifenTypesSelect != null && jifenTypesOptions != null  && jifenTypesOptions.length > 0 ){
                for (var i = 0; i < jifenTypesOptions.length; i++) {
                    jifenTypesSelect.add(new Option(jifenTypesOptions[i].indexName,jifenTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationHuiyuantypesSelect(){
            var huiyuanTypesSelect = document.getElementById('huiyuanTypesSelect');
            if(huiyuanTypesSelect != null && huiyuanTypesOptions != null  && huiyuanTypesOptions.length > 0 ){
                for (var i = 0; i < huiyuanTypesOptions.length; i++) {
                    huiyuanTypesSelect.add(new Option(huiyuanTypesOptions[i].indexName,huiyuanTypesOptions[i].codeIndex));
                }
            }
        }

    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->


    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var sexTypesSelect = document.getElementById("sexTypesSelect");
        if(sexTypesSelect != null && sexTypesOptions != null  && sexTypesOptions.length > 0 ) {
            for (var i = 0; i < sexTypesOptions.length; i++) {
                if (sexTypesOptions[i].codeIndex == ruleForm.sexTypes) {//下拉框value对比,如果一致就赋值汉字
                        sexTypesSelect.options[i].selected = true;
                }
            }
        }

        var politicsTypesSelect = document.getElementById("politicsTypesSelect");
        if(politicsTypesSelect != null && politicsTypesOptions != null  && politicsTypesOptions.length > 0 ) {
            for (var i = 0; i < politicsTypesOptions.length; i++) {
                if (politicsTypesOptions[i].codeIndex == ruleForm.politicsTypes) {//下拉框value对比,如果一致就赋值汉字
                        politicsTypesSelect.options[i].selected = true;
                }
            }
        }

        var jifenTypesSelect = document.getElementById("jifenTypesSelect");
        if(jifenTypesSelect != null && jifenTypesOptions != null  && jifenTypesOptions.length > 0 ) {
            for (var i = 0; i < jifenTypesOptions.length; i++) {
                if (jifenTypesOptions[i].codeIndex == ruleForm.jifenTypes) {//下拉框value对比,如果一致就赋值汉字
                        jifenTypesSelect.options[i].selected = true;
                }
            }
        }

        var huiyuanTypesSelect = document.getElementById("huiyuanTypesSelect");
        if(huiyuanTypesSelect != null && huiyuanTypesOptions != null  && huiyuanTypesOptions.length > 0 ) {
            for (var i = 0; i < huiyuanTypesOptions.length; i++) {
                if (huiyuanTypesOptions[i].codeIndex == ruleForm.huiyuanTypes) {//下拉框value对比,如果一致就赋值汉字
                        huiyuanTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function huiyuanPhoneChickValue(e){
            var this_val = e.value || 0;
            var reg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("手机号不正确");
                return false;
            }
        }
        function jifenChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addhuiyuan');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                huiyuanName: "required",
                huiyuanPhone: "required",
                huiyuanIdNumber: "required",
                sexTypes: "required",
                huiyuanPhoto: "required",
                nation: "required",
                politicsTypes: "required",
                birthplace: "required",
                jifen: "required",
                jifenTypes: "required",
                huiyuanTypes: "required",
            },
            messages: {
                huiyuanName: "姓名不能为空",
                huiyuanPhone: "手机号不能为空",
                huiyuanIdNumber: "身份证号不能为空",
                sexTypes: "性别不能为空",
                huiyuanPhoto: "照片不能为空",
                nation: "民族不能为空",
                politicsTypes: "政治面貌不能为空",
                birthplace: "籍贯不能为空",
                jifen: "积分不能为空",
                jifenTypes: "积分等级不能为空",
                huiyuanTypes: "会员状态不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addhuiyuan = window.sessionStorage.getItem("addhuiyuan");
        if (addhuiyuan != null && addhuiyuan != "" && addhuiyuan != "null") {
            window.sessionStorage.removeItem('addhuiyuan');
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("huiyuan/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#huiyuanName").val(ruleForm.huiyuanName);
        $("#huiyuanPhone").val(ruleForm.huiyuanPhone);
        $("#huiyuanIdNumber").val(ruleForm.huiyuanIdNumber);
        $("#nation").val(ruleForm.nation);
        $("#birthplace").val(ruleForm.birthplace);
        $("#jifen").val(ruleForm.jifen);

    }
    <!--  级联表的数据回显  -->

    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#huiyuanPhotoImg").attr("src",ruleForm.huiyuanPhoto);

        <!--  级联表的图片  -->
    }


    <!--  级联表的图片  -->


    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            sexTypesSelect();
            politicsTypesSelect();
            jifenTypesSelect();
            huiyuanTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationSextypesSelect();
            initializationPoliticstypesSelect();
            initializationJifentypesSelect();
            initializationHuiyuantypesSelect();
            <!--  初始化级联表的下拉框  -->

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            $('#jifen').attr('readonly', 'readonly');
            //$('#money').attr('readonly', 'readonly');
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>