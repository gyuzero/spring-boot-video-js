package com.gyuzero.springbootvideojs.video.mapper;

import com.gyuzero.springbootvideojs.video.dto.VideoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VideoMapper {
    void store(VideoDto videoDto);

    List<VideoDto> loadAll();

    VideoDto load(int fileId);
}
