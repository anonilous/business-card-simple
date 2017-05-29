<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <SharePoint:ScriptLink Name="clienttemplates.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink Name="clientforms.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink Name="clientpeoplepicker.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink Name="autofill.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink Name="sp.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink Name="sp.runtime.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink Name="sp.core.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <!-- Bootstrap Core CSS -->
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/dataTables.material.min.css" rel="stylesheet" />
    <link href="../Content/jquery.edittable.min.css" rel="stylesheet" />
    <!-- Add your CSS styles to the following file -->
    <link href="../Content/App.css" rel="stylesheet" />
    <link href="../Content/sweetalert.min.css" rel="stylesheet" />

    <!-- jQuery Core JavaScript -->
    <script src="../Scripts/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../Scripts/jQuery/jquery.dataTables.min.js"></script>
    <script src="../Scripts/jQuery/dataTables.material.min.js"></script>
    <script src="../Scripts/jQuery/jquery.edittable.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../Scripts/bootstrap.min.js"></script>
    <!-- Rogers Custom JavaScript -->
    <script src="../Scripts/Global/RestHandler.js"></script>
    <script src="../Scripts/Global/RogersCommon.js"></script>
    <!-- Add your JavaScript to the following file -->
    <script src="../Scripts/App.js"></script>
    <script src="../Scripts/View/RequestView.js"></script>
    <script src="../Scripts/Controller/RequestController.js"></script>
    <script src="../Scripts/Controller/SettingController.js"></script>
    <script src="../Scripts/sweetalert.min.js"></script>
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <nav id="header" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div>
                <a href="https://rogerscorp-3fcbedb4df761c.sharepoint.com/sites/RogersAppPortal/AdminReservation/Pages/Default.aspx" class="app-home">Home</a>
                <a href="Index.aspx" class="app-title">Business Card Request</a>
            </div>
        </div>
    </nav>
    <!-- /#header navbar -->
    <div class="bc-sidebar">
        <div id="side-nav">
            <ul class="side-nav-list">
                <li class="nav-header">Applicant</li>
                <li>
                    <a class="nav-list new-request" id="new-request" onclick="changeRequestView('new-request')">My New Request</a>
                </li>
                <li>
                    <a class="nav-list pending-requests" id="pending-requests" onclick="changeRequestView('pending-requests')">My Pending Requests</a>
                </li>
                <li>
                    <a class="nav-list completed-requests" id="completed-requests" onclick="changeRequestView('completed-requests')">My Completed Requests</a>
                </li>
                <li style="display: none" class="nav-header" id="admin-header">Admin</li>
                <li>
                    <a style="display: none" class="nav-list admin-pending-requests" id="admin-pending-requests" onclick="changeRequestView('admin-pending-requests')">All Pending Requests</a>
                </li>
                <li>
                    <a style="display: none" class="nav-list admin-completed-requests" id="admin-completed-requests" onclick="changeRequestView('admin-completed-requests')">All Completed Requests</a>
                </li>
                <li>
                    <a style="display: none" class="nav-list admin-settings" id="admin-settings" onclick="changeRequestView('admin-settings')">Admin Settings</a>
                </li>
            </ul>
        </div>
        <!-- /#side-nav -->
    </div>
    <!-- /.bc-sidebar -->
    <div id="container" class="bc-container">
        <div class="row">
            <div id="content" class="bc-content">
                <div id="panel-request" class="panel panel-primary panel-card">
                    <div class="panel-heading">
                        <h3 class="panel-title">Request Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <!-- Chinese name and English name -->
                            <div class="form-group">
                                <label class="label-control" for="nameCN">
                                    中文姓名
										<br />
                                    Name in Chinese
                                </label>
                                <div class="field-control">
                                    <input type="text" class="form-control" id="nameCN" />
                                </div>
                                <label class="label-control" for="nameEN">
                                    英文姓名
										<br />
                                    Name in English
                                </label>
                                <div class="field-control">
                                    <input type="text" class="form-control" id="nameEN" />
                                </div>
                            </div>

                            <!-- Chinese title and English title -->
                            <div class="form-group">
                                <label class="label-control" for="titleCN">
                                    中文职位
										<br />
                                    Title in Chinese
                                </label>
                                <div class="field-control">
                                    <input type="text" class="form-control" id="titleCN" />
                                </div>
                                <label class="label-control" for="titleEN">
                                    英文职位
										<br />
                                    Title in English
                                </label>
                                <div class="field-control">
                                    <input type="text" class="form-control" id="titleEN" />
                                </div>
                            </div>

                            <!-- Chinese dept and English dept -->
                            <div class="form-group">
                                <label class="label-control" for="deptCN">
                                    中文部门
										<br />
                                    BU/Function in Chinese
                                </label>
                                <div class="field-control">
                                    <select class="form-control" id="deptCN">
                                    </select>
                                </div>
                                <label class="label-control" for="deptEN">
                                    英文部门
										<br />
                                    BU/Function in English
                                </label>
                                <div class="field-control">
                                    <select class="form-control" id="deptEN">
                                    </select>
                                </div>
                            </div>

                            <!-- DL and Fax -->
                            <div class="form-group">
                                <label class="label-control" for="directLine">
                                    直线
										<br />
                                    Direct Line
                                </label>
                                <div class="field-control">
                                    <input type="text" class="form-control" id="directLine" />
                                </div>
                                <label class="label-control" for="faxNumber">
                                    传真
										<br />
                                    Fax Number
                                </label>
                                <div class="field-control">
                                    <div class="fax-phone-radio reveal-margin-left">
                                        <label for="noFax">No</label>
                                        <input type="radio" name="show-fax" id="noFax" checked>
                                        <label for="yesFax">Yes</label>
                                        <input type="radio" name="show-fax" id="yesFax">
                                    </div>
                                    <input type="text" class="form-control fax-phone-input hide-fax-phone-input" id="faxNumber" />
                                </div>
                            </div>
                            <!-- Email and Cellphone -->
                            <div class="form-group">
                                <label class="label-control" for="emailAddress">
                                    邮箱地址
										<br />
                                    Email Address
                                </label>
                                <div class="input-group field-control">
                                    <input type="text" class="form-control" id="emailAddress" aria-describedby="basic-addon2">
                                    <span class="input-group-addon" id="basic-addon2">@rogerscorp.com</span>
                                </div>
                                <label class="label-control" for="cellPhone">
                                    手机
										<br />
                                    Cellphone
                                </label>
                                <div class="field-control">
                                    <div class="fax-phone-radio reveal-margin-left">
                                        <label for="noPhone">No</label>
                                        <input type="radio" name="show-phone" id="noPhone" checked>
                                        <label for="yesPhone">Yes</label>
                                        <input type="radio" name="show-phone" id="yesPhone">
                                    </div>
                                    <input type="text" class="form-control fax-phone-input hide-fax-phone-input" id="cellPhone" />
                                </div>
                            </div>

                            <!-- Company Address and Remark -->
                            <div class="form-group">
                                <label class="label-control" for="companyAddress">
                                    公司地址
										<br />
                                    Company Address
                                </label>
                                <div class="field-control">
                                    <div class="address">
                                        苏州市工业园区西沈浒路
                                        <select class="address-control" id="companyAddressCN">
                                            <option value="18">18</option>
                                            <option value="28">28</option>
                                        </select>号
                                        <br />
                                        No.
                                        <select class="address-control" id="companyAddressEN">
                                            <option value="18">18</option>
                                            <option value="28">28</option>
                                        </select>
                                        West Shenhu Road Suzhou Industrial Park, Suzhou
                                    </div>
                                </div>
                                <label class="col-xs-2 col-sm-2 label-control" for="remark">
                                    备注
										<br />
                                    Remark
                                </label>
                                <div class="field-control">
                                    <textarea rows="4" class="form-control " id="remark"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.form-horizontal -->
                </div>
                <!-- /panel-request -->
                <div id="panel-reply" class="panel panel-danger panel-card" style="display: none">
                    <div class="panel-heading">
                        <h3 class="panel-title">Admin Reply</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <!-- Admin Reply -->
                            <div class="form-group">
                                <div class="admin-reply">
                                    <select class="form-control" id="adminReply">
                                        <option value="Pending">1. Your business card is sent to supplier, please wait for reply within 2 weeks. 您的名片已交供应商印制，两周内请等待通知。</option>
                                        <option value="Modified">2. Your modified business card is sent to supplier, please wait for reply within 2 weeks. 您修改的名片已交供应商印制，两周内请等待通知。</option>
                                        <option value="Completed">3. Your business card has been printed, please get it at E Building. 您的名片已印好，请来E幢前台领取。</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- /.form-horizontal -->
                    </div>
                </div>
                <!-- /panel-reply -->
                <div class="button-group">
                    <button type="button" id="btnSubmitRequest" class="btn btn-success" style="display: none">Submit</button>
                    <button type="button" id="btnReplyRequest" class="btn btn-danger" style="display: none">Reply</button>
                    <button type="button" id="btnCompleteRequest" class="btn btn-danger" style="display: none">Complete</button>
                    <button type="button" id="btnModifyRequest" class="btn btn-info" style="display: none">Modify</button>
                    <button type="button" id="btnCancelRequest" class="btn btn-default" style="display: none">Cancel</button>
                </div>
                <!-- /.button-group -->
            </div>
            <!-- /.bc-content -->
            <div id="panel-setting" class="panel panel-info panel-card" style="display: none">
                <div class="panel-heading">
                    <h3 class="panel-title">Admin Settings</h3>
                </div>
                <div class="panel-body">
                    <div role="tabpanel" class="tab-pane" id="settings">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs form-central" role="tablist" id="setting-tabs">
                            <li role="presentation" class="active"><a href="#adminList" aria-controls="adminList" role="tab" data-toggle="tab">Admin List</a></li>
                            <li role="presentation"><a href="#deptList" aria-controls="deptList" role="tab" data-toggle="tab">Dept List</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="adminList">
                                <div class="form-horizontal form-central" id="adminListForm">
                                    <div class="form-group textarea-control">
                                        <textarea id="adminEmail" class="form-control" rows="3" placeholder="请输入邮箱，如有多个，请以英文分号(;)分隔"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="button" class="btn btn-info pull-right" id="btnSaveAdminListSetting">Save</button>
                                    </div>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="deptList">
                                <div class="form-horizontal form-central" id="deptListForm">
                                    <div id="deptTable"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /panel-setting -->

            <div class="bc-widget">
                <div id="hiddenInfo">
                    <input type="hidden" id="currentUserNameHidden" />
                    <input type="hidden" id="currentUserEmailHidden" />
                    <input type="hidden" id="currentUserKeyHidden" />
                    <input type="hidden" id="requestorNameHidden" />
                    <input type="hidden" id="requestorEmailHidden" />

                    <input type="hidden" id="createdDateHidden" />
                    <input type="hidden" id="modifiedDateHidden" />
                    <input type="hidden" id="currentDateHidden" />

                    <input type="hidden" id="adminEmailHidden" />
                    <input type="hidden" id="deptIdSelectedHidden" />
                    <input type="hidden" id="settingIdHidden" />
                    <input type="hidden" id="requestIdHidden" />
                    <input type="hidden" id="requestStatusHidden" />
                </div>
                <!-- /hiddenInfo -->
            </div>
            <!-- /.bc-widget -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.bc-container -->
</asp:Content>