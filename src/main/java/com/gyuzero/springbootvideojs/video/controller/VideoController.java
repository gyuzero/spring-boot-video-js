package com.gyuzero.springbootvideojs.video.controller;

import com.gyuzero.springbootvideojs.video.dto.VideoDto;
import com.gyuzero.springbootvideojs.video.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class VideoController {

    private final VideoService videoService;

    public VideoController(VideoService videoService) {
        this.videoService = videoService;
    }

    @GetMapping("/video/list")
    public String videoListView(Model model) {
        List<VideoDto> videos = videoService.loadAll();
        model.addAttribute("videos", videos);
        return "video/list";
    }

    @GetMapping("/video/upload")
    public String videoUploadView() {
        return "video/upload";
    }

    @PostMapping("/video/upload")
    public String videoUpload(@RequestParam("file") MultipartFile file) {
        videoService.store(file);
        return "redirect:/video/list";
    }

    @GetMapping("/video/preview/{fileId}")
    public String videoPreview(@PathVariable("fileId") int fileId, Model model) {
        VideoDto videoDto = videoService.load(fileId);
        model.addAttribute("video", videoDto);
        return "video/preview";
    }
}
