package glory.util;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;

/**
 * Created by Monster on 2017/11/18.
 */
public class ResponseJson {

    private int code;

    private Object data;

    private String msg;

    public int getCode() {
        return code;
    }

    public ResponseJson(int code, Object data, String msg) {
        this.code = code;

        this.msg = msg;

        ObjectMapper mapper = new ObjectMapper();
        try {
            this.data= mapper.writeValueAsString(data);
        } catch (IOException e) {
            this.data="Json转换失败";
            e.printStackTrace();
        }
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getData() {

        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
