package com.iuni.data.webapp.controller.config;

import com.iuni.data.persist.domain.ConfigConstants;
import com.iuni.data.persist.domain.config.Channel;
import com.iuni.data.persist.domain.config.ChannelType;
import com.iuni.data.utils.ExcelUtils;
import com.iuni.data.utils.GenerateShortUrlUtils;
import com.iuni.data.webapp.common.PageName;
import com.iuni.data.webapp.service.config.ChannelTypeService;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Nicholas
 *         Email:   nicholas.chen@iuni.com
 */
@Controller
@RequestMapping("/config/channelType")
public class ChannelTypeConfigController {

    private static final Logger logger = LoggerFactory.getLogger(ChannelTypeConfigController.class);

    @Autowired
    private ChannelTypeService channelTypeService;

    /**
     * 渠道类型配置
     *
     * @return
     */
    @RequestMapping
    public ModelAndView listChannelType() {
        List<ChannelType> channelTypeList;
        ChannelType channelType = new ChannelType();
        channelType.setCancelFlag(ConfigConstants.LOGICAL_CANCEL_FLAG_NOT_CANCEL);
        channelType.setStatus(ConfigConstants.STATUS_FLAG_EFFECTIVE);
        channelTypeList = channelTypeService.listChannelType(channelType);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(PageName.config_channel_type.getPath());
        modelAndView.addObject("channelTypeList", channelTypeList);
        return modelAndView;
    }

    /**
     * 添加渠道类型
     *
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView addChannelType() {
        return addOrEditChannelType(new ChannelType());
    }

    /**
     * 编辑渠道类型
     *
     * @param id
     * @return
     */
    @RequestMapping("/edit")
    public ModelAndView editChannelType(@RequestParam(value = "id", required = true) Long id) {
        return addOrEditChannelType(channelTypeService.getById(id));
    }

    private ModelAndView addOrEditChannelType(ChannelType channelType){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(PageName.config_channel_type_edit.getPath());
        modelAndView.addObject("channelType", channelType);
        return modelAndView;
    }

    /**
     * 保存渠道类型
     *
     * @return
     */
    @RequestMapping("/save")
    public String saveChannel(@ModelAttribute("channelType") ChannelType channelType) {
        logger.info("save channelType: {}", channelType.toString());
        channelType.setStatus(ConfigConstants.STATUS_FLAG_EFFECTIVE);
        if (channelType.getId() == 0)
            channelTypeService.addChannelType(channelType);
        else
            channelTypeService.updateChannelType(channelType);
        return "redirect:/config/channelType";
    }

    /**
     * 逻辑删除
     *
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    public String deleteChannel(@RequestParam(value = "ids", required = true) String ids) {
        logger.info("delete channelType. ids: {}", ids);
        channelTypeService.deleteChannelType(ids);
        return "redirect:/config/channelType";
    }

    /* ================= */
    /* getter and setter */
    /* ================= */

}
