package com.iuni.data.persist.mapper.activity;

import com.iuni.data.persist.model.activity.ActivityChannelTableDto;
import com.iuni.data.persist.model.activity.ActivityChannelQueryDto;
import com.iuni.data.persist.model.activity.ActivityChannelChartDto;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Nicholas
 *         Email:   nicholas.chen@iuni.com
 */
public interface ActivityChannelMapper {

    List<ActivityChannelTableDto> selectActivityChannel(ActivityChannelQueryDto queryDto);

    List<ActivityChannelChartDto> selectOrderByActivityChannel(ActivityChannelQueryDto queryDto);

    List<ActivityChannelChartDto> selectPaidOrderByActivityChannel(ActivityChannelQueryDto queryDto);

    List<ActivityChannelChartDto> selectPVByActivityChannel(ActivityChannelQueryDto queryDto);

    List<ActivityChannelChartDto> selectUVByActivityChannel(ActivityChannelQueryDto queryDto);

    List<ActivityChannelChartDto> selectVVByActivityChannel(ActivityChannelQueryDto queryDto);

}
