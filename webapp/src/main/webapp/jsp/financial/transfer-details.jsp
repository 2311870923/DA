<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>数据分析平台 | 调拔明细统计报表</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- FontAwesome 4.3.0 -->
    <link href="/resources/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="/resources/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/css/skins/_all-skins.css" rel="stylesheet" type="text/css"/>

    <link href="/resources/css/components.css" rel="stylesheet" type="text/css"/>

    <link href="/resources/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet"
          type="text/css"/>

    <link href="/resources/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css"/>

    <link href="/resources/plugins/echarts/css/carousel.css" rel="stylesheet" type="text/css">
    <link href="/resources/plugins/echarts/css/echartsHome.css" rel="stylesheet" type="text/css">
</head>
<body class="skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../common/header.jsp" flush="true"/>
    <jsp:include page="../common/menu.jsp" flush="true"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa fa-dashboard"></i> Home > 运营分析 > 财务报表 >
                <small>调拔明细统计报表</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="portlet box grey">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-bookmark"></i> 查询条件
                    </div>
                </div>
                <div class="portlet-body form">
                    <form:form id="form_financial_transfer_details" class="form-horizontal"
                               action="/financial/transferDetails/query"
                               method="post"
                               modelAttribute="queryParam">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">统计日期:</label>

                                        <div class="col-md-7">
                                            <form:input type="text" class="form-control" id="daterangepicker"
                                                        value="${queryParam.dateRangeString}" path="dateRangeString"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-0 pull-right">
                                    <button id="query-button" type="submit" class="btn green">查询</button>
                                    <button id="financial-transfer-details-table-export" class="btn green">
                                        导出 <i class="fa fa-file"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
            <!-- /.form group -->

            <!-- Custom tabs (Charts with tabs)-->
            <div class="nav-tabs-custom portlet box grey">

                <!-- Tabs within a box -->
                <ul class="nav nav-tabs pull-right" id="financial-transfer-details-tab">
                    <li class="pull-left header"><i class="fa fa-inbox"></i> 调拔明细</li>
                </ul>
                <div class="tab-content no-padding">
                    <div class="portlet-body tab-pane active" id="financial-transfer-details-table-tab"
                         style="position: relative;">
                        <table id="financial-transfer-details-table"
                               class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>发货时间</th>
                                <th>调拨批次号</th>
                                <th>发货仓</th>
                                <th>收货人</th>
                                <th>收货地址</th>
                                <th>联系电话</th>
                                <th>SKU名称</th>
                                <th>数量</th>
                                <th>单位</th>
                                <th>物流单号</th>
                                <th>调货状态</th>
                                <th>目的地</th>
                                <th>已退货数量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${resultList}" var="result">
                                <tr class="odd gradeX">
                                    <td><fmt:formatDate value="${result.shippingTime}" pattern="yyyy/MM/dd"/></td>
                                    <td>${result.transferId}</td>
                                    <td>${result.warehouse}</td>
                                    <td>${result.consignee}</td>
                                    <td>${result.transferTo}</td>
                                    <td>${result.contact}</td>
                                    <td>${result.skuName}</td>
                                    <td>${result.quantity}</td>
                                    <td>${result.measureUnit}</td>
                                    <td>${result.logisticNo}</td>
                                    <td>${result.status}</td>
                                    <td>${result.transferSend}</td>
                                    <td>${result.returnNum}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <!-- /.nav-tabs-custom -->

        </section>

    </div>

    <jsp:include page="../common/footer.jsp" flush="true"/>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.1.4 -->
<%--<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>--%>
<script src="/resources/scripts/common/jquery.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/plugins/bootstrap/scripts/bootstrap.js" type="text/javascript"></script>
<!-- FastClick -->
<script src="/resources/plugins/fastclick/fastclick.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/resources/scripts/app.js" type="text/javascript"></script>

<!-- data range picker -->
<script src="/resources/plugins/daterangepicker/moment.js" type="text/javascript"></script>
<script src="/resources/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

<!-- dataTable -->
<script src="/resources/plugins/select2/select2.js" type="text/javascript"></script>
<script src="/resources/plugins/datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="/resources/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js" type="text/javascript"></script>

<script src="/resources/scripts/common/common.js" type="text/javascript"></script>
<script src="/resources/scripts/financial/transfer-details.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        TransferDetailsOfFinancial.init();
    });
</script>
</body>
</html>
