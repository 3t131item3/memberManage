package com.accp.entity;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Errors {
    private  String result;

    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }
}
