package com.cga102g3.core.pojo;


/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-15 下午 06:41
 */
public class ErrMsg {
    private Boolean err = true;
    private String msg;

    public Boolean etErr() {
        return err;
    }

    public void setErr(Boolean err) {
        this.err = err;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
