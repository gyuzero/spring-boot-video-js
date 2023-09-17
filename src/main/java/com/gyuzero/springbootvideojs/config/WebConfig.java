package com.gyuzero.springbootvideojs.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final Environment env;

    public WebConfig(Environment env) {
        this.env = env;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String fileStorePath = env.getProperty("file.store.path");
        registry
                .addResourceHandler(fileStorePath + "/**")
                .addResourceLocations("file://" + fileStorePath + File.separator);
    }
}
