package com.mini.common.constant;

/**
 * @author zhl
 * @create 2025/2/26 15:59
 */
public final class WxConstant {
    private WxConstant() {
    }

    // 微信 appId
    public static final String WX_APPID = "wxf669f04dc4f5c906";

    // 微信 appSecret
    public static final String WX_SECRET = "4fb130cb15dba42aa2cb56e633f65c08";

    // 微信登录 jsCode2Session
    public static final String WX_JS_CODE_URL = "https://api.weixin.qq.com/sns/jscode2session";


    ///////////////////////////////默认参数名与默认参数/////////////////////////////////////

    // 请求参数名 appid
    public static final String PARAMS_APP_ID = "appid";

    // 请求参数名 secret
    public static final String PARAMS_SECRET = "secret";

    // 请求参数名 js_code
    public static final String PARAMS_JS_CODE = "js_code";

    // 请求参数名 grant_type
    public static final String PARAMS_GRANT_TYPE = "grant_type";

    // 请求参数名 grant_type 对应的参数值 authorization_code
    public static final String VALUE_GRANT_TYPE = "authorization_code";
}
