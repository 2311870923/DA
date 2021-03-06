package com.iuni.data.webapp.controller.operation;

import com.iuni.data.persist.model.operation.ConvertRateOfOrderQueryDto;
import com.iuni.data.persist.model.operation.ConvertRateOfOrderTableDto;
import com.iuni.data.persist.model.system.OrderSourceDto;
import com.iuni.data.utils.ExcelUtils;
import com.iuni.data.utils.JsonUtils;
import com.iuni.data.utils.StringUtils;
import com.iuni.data.webapp.common.PageName;
import com.iuni.data.webapp.service.operation.SalesService;
import com.iuni.data.webapp.service.system.SystemConstantsService;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单转化率统计报表
 *
 * @author zowie
 *         Email:   nicholas.chen@iuni.com
 */
@Controller("convertRateOfOrderOfOperation")
@RequestMapping("/operation/convertRateOfOrder")
public class ConvertRateOfOrderController {

    private static final Logger logger = LoggerFactory.getLogger(MallSalesController.class);

    @Autowired
    private SalesService salesService;
    @Autowired
    private SystemConstantsService systemConstantsService;

    /**
     * 表格数据,默认参数
     *
     * @return
     */
    @RequestMapping
    public ModelAndView queryTable() {
        ConvertRateOfOrderQueryDto queryParam = new ConvertRateOfOrderQueryDto();
        queryParam.setDateRangeString(StringUtils.getLastSevenDaysRangeString());
//        queryParam.setOrderSourceStr("IUNI");
        return queryTable(queryParam);
    }

    /**
     * 表格数据,传入参数
     *
     * @param queryParam
     * @return
     */
    @RequestMapping("query")
    public ModelAndView queryTable(@ModelAttribute("queryParam") ConvertRateOfOrderQueryDto queryParam) {
        ModelAndView modelAndView = new ModelAndView();
        // 页面路径
        modelAndView.setViewName(PageName.operation_convert_rate_of_order.getPath());
        // 解析参数
        queryParam.parseDateRangeString();
        // 查询结果
        List<ConvertRateOfOrderTableDto> resultList = salesService.selectConvertRateOfOrder(queryParam);
        modelAndView.addObject("resultList", resultList);
        // 查询订单来源
        List<OrderSourceDto> orderSources = systemConstantsService.selectAllOMOrderSource();
        modelAndView.addObject("orderSources", orderSources);
        // 返回查询参数
        modelAndView.addObject("queryParam", queryParam);
        return modelAndView;
    }

    @RequestMapping("exportExcel")
    public String exportExcel(String queryParamStr, HttpServletResponse response) {
        // 获取参数
        ConvertRateOfOrderQueryDto queryParam = JsonUtils.fromJson(queryParamStr, ConvertRateOfOrderQueryDto.class);
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        try {
            // 导出excel文件名
            String fileName = new String(("订单转化率统计报表(" + queryParam.getDateRangeString() + ")").getBytes(), "ISO8859-1");
            // 文件名可包含空格
            response.setHeader("Content-disposition", "attachment; filename=\"" + fileName + ".xlsx\"");
            // 解析参数
            queryParam.parseDateRangeString();
            // 查询结果
            List<ConvertRateOfOrderTableDto> resultList = salesService.selectConvertRateOfOrder(queryParam);
            // 导出结果
            List<ExcelUtils.SheetData> sheetDataList = new ArrayList<>();
            sheetDataList.add(new ExcelUtils.SheetData("订单转化率", ConvertRateOfOrderTableDto.generateTableHeader(), ConvertRateOfOrderTableDto.generateTableData(resultList)));
            SXSSFWorkbook wb = ExcelUtils.generateExcelWorkBook(sheetDataList);
            wb.write(response.getOutputStream());

            response.getOutputStream().flush();
            response.getOutputStream().close();
        } catch (IOException e) {
            logger.error("export to excel error. {}", e.getMessage(), e);
        } finally {
            try {
                response.getOutputStream().close();
            } catch (IOException e) {
                logger.error("export to excel error. {}", e.getMessage(), e);
            }
        }
        return null;
    }

}
