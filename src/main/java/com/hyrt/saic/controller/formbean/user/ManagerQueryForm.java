package com.hyrt.saic.controller.formbean.user;

public class ManagerQueryForm {
    String formUserId;
    String formUsername;
    Integer formRoleId;
    String formStatus;

    public ManagerQueryForm(String formUserId, String formUsername, Integer formRoleId, String formStatus) {
        this.formUserId = formUserId;
        this.formUsername = formUsername;
        this.formRoleId = formRoleId;
        this.formStatus = formStatus;
    }

    public String getFormStatus() {
        return formStatus;
    }

    public void setFormStatus(String formStatus) {
        this.formStatus = formStatus;
    }

    public String getFormUserId() {
        return formUserId;
    }

    public void setFormUserId(String formUserId) {
        this.formUserId = formUserId;
    }

    public String getFormUsername() {
        return formUsername;
    }

    public void setFormUsername(String formUsername) {
        this.formUsername = formUsername;
    }

    public Integer getFormRoleId() {
        return formRoleId;
    }

    public void setFormRoleId(Integer formRoleId) {
        this.formRoleId = formRoleId;
    }
}
