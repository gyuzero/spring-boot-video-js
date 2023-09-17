package com.gyuzero.springbootvideojs.video.service;

import com.gyuzero.springbootvideojs.video.dto.VideoDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface VideoService {
    void store(MultipartFile file);

    List<VideoDto> loadAll();

    VideoDto load(int fileId);
}
