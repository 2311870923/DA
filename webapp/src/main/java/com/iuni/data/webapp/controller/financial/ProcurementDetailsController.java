package com.iuni.data.webapp.controller.financial;

import com.iuni.data.persist.model.financial.ProcurementDetailsQueryDto;
import com.iuni.data.persist.model.financial.ProcurementDetailsTableDto;
import com.iuni.data.utils.ExcelUtils;
import com.iuni.data.utils.JsonUtils;
import com.iuni.data.utils.StringUtils;
import com.iuni.data.webapp.common.PageName;
import com.iuni.data.webapp.service.financial.StockService;
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
 * @author Nicholas
 *         Email:   nicholas.chen@iuni.com
 */
@Controller("procurementDetailsControllerOfFinancial")
@RequestMapping("/financial/procurementDetails")
public class ProcurementDetailsController {

    private static final Logger logger = LoggerFactory.getLogger(ProcurementDetailsController.class);

    @Autowired
    private StockService stockService;

    @RequestMapping
    public ModelAndView queryTable() {
        ProcurementDetailsQueryDto queryParam= new ProcurementDetailsQueryDto();
        queryParam.setDateRangeString(StringUtils.getLastSevenDaysRangeString());
        return queryTable(queryParam);
    }

    @RequestMapping("query")
    public ModelAndView queryTable(@ModelAttribute("queryParam") ProcurementDetailsQueryDto queryParam) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(PageName.financial_procurement_details.getPath());
        queryParam.parseDateRangeString();
        List<ProcurementDetailsTableDto> resultList = stockService.selectProcurementDetails(queryParam);
        modelAndView.addObject("resultList", resultList);
        modelAndView.addObject("queryParam", queryParam);
        return modelAndView;
    }

    @RequestMapping("exportExcel")
    public String exportExcel(String queryParamStr, HttpServletResponse response) {
        ProcurementDetailsQueryDto queryParam = JsonUtils.fromJson(queryParamStr, ProcurementDetailsQueryDto.class);
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        try {
            String fileName = new String(("入库明细报表(" + queryParam.getDateRangeString() + ")").getBytes(), "ISO8859-1");
            response.setHeader("Content-disposition", "attachment; filename=\"" + fileName + ".xlsx\"");

            queryParam.parseDateRangeString();
            List<ProcurementDetailsTableDto> resultList = stockService.selectProcurementDetails(queryParam);

            List<ExcelUtils.SheetData> sheetDataList = new ArrayList<>();
            sheetDataList.add(new ExcelUtils.SheetData("入库明细", ProcurementDetailsTableDto.generateTableHeader(), ProcurementDetailsTableDto.generateTableData(resultList)));
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
