package com.zl.bean;

import org.springframework.web.multipart.MultipartFile;

public class Information {

    private int informationId;
    private String informationTitle;
    private String informationIntroduction;

    private MultipartFile uploadFile;

    public Information() {
    }

    public MultipartFile getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
    }

    public int getInformationId() {
        return informationId;
    }

    public void setInformationId(int informationId) {
        this.informationId = informationId;
    }

    public String getInformationTitle() {
        return informationTitle;
    }

    public void setInformationTitle(String informationTitle) {
        this.informationTitle = informationTitle;
    }

    public String getInformationIntroduction() {
        return informationIntroduction;
    }

    public void setInformationIntroduction(String informationIntroduction) {
        this.informationIntroduction = informationIntroduction;
    }

    @Override
    public String toString() {
        return "Information{" +
                "informationId=" + informationId +
                ", informationTitle='" + informationTitle + '\'' +
                ", informationIntroduction='" + informationIntroduction + '\'' +
                '}';
    }
}
