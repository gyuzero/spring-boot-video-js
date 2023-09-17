package com.gyuzero.springbootvideojs.video.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VideoDto {

    private int fileId; // 파일ID

    private String fileStorePath; // 파일저장경로

    private String fileExtsn; // 파일확장자

    private String originFileNm; // 원본파일명

    private String storeFileNm; // 저장파일명

}