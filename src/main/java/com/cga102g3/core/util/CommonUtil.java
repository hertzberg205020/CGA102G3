package com.cga102g3.core.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;

import static com.cga102g3.core.util.Constants.GSON;
import static com.cga102g3.core.util.Constants.JSON_MIME_TYPE;


/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-14 下午 10:21
 */
public class CommonUtil {

    public static <P> P json2Pojo(HttpServletRequest request, Class<P> classOfPojo) {
        try (BufferedReader br = request.getReader()) {
            return GSON.fromJson(br, classOfPojo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <P> void writePojo2Json(HttpServletResponse response, P pojo) {
        response.setContentType(JSON_MIME_TYPE);
        try (PrintWriter pw = response.getWriter()) {
            pw.print(GSON.toJson(pojo));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
