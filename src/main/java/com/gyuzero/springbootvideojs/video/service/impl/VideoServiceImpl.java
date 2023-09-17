package com.gyuzero.springbootvideojs.video.service.impl;

import com.gyuzero.springbootvideojs.video.dto.VideoDto;
import com.gyuzero.springbootvideojs.video.mapper.VideoMapper;
import com.gyuzero.springbootvideojs.video.service.VideoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
public class VideoServiceImpl implements VideoService {

    private final Environment env;

    private final VideoMapper videoMapper;

    public VideoServiceImpl(VideoMapper videoMapper, Environment env) {
        this.videoMapper = videoMapper;
        this.env = env;
    }

    @Override
    public void store(MultipartFile file) {
        try {

            if (file.isEmpty()) {
                throw new RuntimeException("Failed to store empty file.");
            }

            // 원본 파일명
            String originFileNm = file.getOriginalFilename();

            String fileExtsn = originFileNm.substring(originFileNm.lastIndexOf("."));

            String storeFileNm = UUID.randomUUID() + fileExtsn;

            String fileStorePath = env.getProperty("file.store.path") + File.separator + storeFileNm;

            Path destinationFile = Paths.get(fileStorePath);

            try (InputStream inputStream = file.getInputStream()) {
                Files.copy(inputStream, destinationFile,
                        StandardCopyOption.REPLACE_EXISTING);
            }

            VideoDto videoDto = new VideoDto();
            videoDto.setOriginFileNm(originFileNm);
            videoDto.setFileExtsn(fileExtsn);
            videoDto.setStoreFileNm(storeFileNm);
            videoDto.setFileStorePath(fileStorePath);

            videoMapper.store(videoDto);

        } catch (IOException e) {
            throw new RuntimeException("Failed to store file.", e);
        }
    }

    @Override
    public List<VideoDto> loadAll() {
        return videoMapper.loadAll();
    }

    @Override
    public VideoDto load(int fileId) {
        return videoMapper.load(fileId);
    }
}
