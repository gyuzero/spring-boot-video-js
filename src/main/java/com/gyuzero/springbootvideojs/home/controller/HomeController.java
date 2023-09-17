package com.gyuzero.springbootvideojs.home.controller;

import com.gyuzero.springbootvideojs.video.dto.VideoDto;
import com.gyuzero.springbootvideojs.video.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    private final VideoService videoService;

    public HomeController(VideoService videoService) {
        this.videoService = videoService;
    }

    @GetMapping("/")
    public String home(Model model) {
        List<VideoDto> videos = videoService.loadAll();
        model.addAttribute("videos", videos);
        return "index";
    }
}
