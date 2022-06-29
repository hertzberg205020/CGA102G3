package com.cga102g3.web.bid_activ.web_socket;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-26 下午 03:23
 */
public class ServletAwareConfig extends ServerEndpointConfig.Configurator{
    @Override
    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
        HttpSession httpSession = (HttpSession) request.getHttpSession();
        config.getUserProperties().put("httpSession", httpSession);
    }
}
