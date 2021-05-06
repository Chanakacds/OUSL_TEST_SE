package com.openuniversity.springjwt.payload.request;

public class BookMaterialRequest {

    long materialTypeId;

    long materialId;

    long userId;

    public long getMaterialTypeId() {
        return materialTypeId;
    }

    public void setMaterialTypeId(long materialTypeId) {
        this.materialTypeId = materialTypeId;
    }

    public long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(long materialId) {
        this.materialId = materialId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }
}
