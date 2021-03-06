var RefundDetailsOfFinancial = function () {

    var initTable = function () {

        var table = $('#financial-refund-details-table');

        // begin table
        table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "无数据",
                "info": "显示 _START_ 到 _END_ 条记录，共 _TOTAL_ 条记录",
                "infoEmpty": "未找到相应记录",
                "infoFiltered": "(从 _MAX_ 条记录中过滤)",
                "lengthMenu": "每页显示： _MENU_ ",
                "search": "查找：",
                "zeroRecords": "无匹配的记录",
                "paginate": {
                    "last": "末页",
                    "first": "首页",
                    "previous": "上页",
                    "next": "下页",
                }
            },

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

            "lengthMenu": [
                [5, 10, 20, -1],
                [5, 10, 20, "全部"] // change per page values here
            ],
            // set the initial value
            "pageLength": 10,
            "pagingType": "bootstrap_full_number",
            "order": [
                [0, 'asc']
            ],
        });

        var tableWrapper = jQuery('#financial-refund-details-table_wrapper');

        tableWrapper.find('.dataTables_length select').addClass("form-control input-xsmall input-inline");

        $('#daterangepicker').daterangepicker({
            dateLimit: {days: 30},
            opens: 'right',
            autoApply: true,
            locale: {
                format: 'YYYY/MM/DD',
                separator: ' - ',
                applyLabel: '确定',
                cancelLabel: '取消',
                customRangeLabel: '自定义',
                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月'],
            }
        }, function (start, end, label) {//格式化日期显示框
            $('#daterangepicker span').html(start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));
        });

        $('#financial-refund-details-table-export').click(function (e) {
            e.preventDefault();
            var dateRangeString = $("#daterangepicker").val();
            var queryParams = {
                "dateRangeString": dateRangeString,
            }
            location.href = "/financial/refundDetails/exportExcel?queryParamStr=" + JSON.stringify(queryParams);
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            activeMenu('/financial/refundDetails');
            initTable();
        }

    };

}();

