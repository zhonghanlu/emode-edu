package com.mini.common.utils.http;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * @author zhonghanlu
 * @Date 2025年2月26日16:20:57
 */
public class HttpClientUtil {

    private static final Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);
    private static final CloseableHttpClient httpClient = HttpClients.createDefault();

    private static CloseableHttpClient createHttpClient() {
        return httpClient;
    }

    private static void closeResources(CloseableHttpResponse response, CloseableHttpClient httpClient) {
        try {
            if (response != null) {
                response.close();
            }
            if (httpClient != null) {
                httpClient.close();
            }
        } catch (IOException e) {
            logger.error("Error closing resources", e);
        }
    }

    public static String doGet(String url, Map<String, String> param) {
        CloseableHttpClient httpclient = createHttpClient();
        String resultString = "";
        CloseableHttpResponse response = null;
        try {
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }
            URI uri = builder.build();
            HttpGet httpGet = new HttpGet(uri);
            response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200) {
                resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            logger.error("Error executing GET request", e);
        } finally {
            closeResources(response, httpclient);
        }
        return resultString;
    }

    public static String doGet(String url, Map<String, String> param, Map<String, String> heads) {
        CloseableHttpClient httpclient = createHttpClient();
        String resultString = "";
        CloseableHttpResponse response = null;
        try {
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }
            URI uri = builder.build();
            HttpGet httpGet = new HttpGet(uri);
            setHeader(httpGet, heads);
            response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200) {
                resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            logger.error("Error executing GET request", e);
        } finally {
            closeResources(response, httpclient);
        }
        return resultString;
    }

    public static String doGet2(String url, Map<String, String> param, String slipersAuth) {
        CloseableHttpClient httpclient = createHttpClient();
        String resultString = "";
        CloseableHttpResponse response = null;
        try {
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }
            URI uri = builder.build();
            HttpGet httpGet = new HttpGet(uri);
            if (StringUtils.isNotBlank(slipersAuth)) {
                httpGet.setHeader("Authorization", slipersAuth);
            }
            response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200) {
                resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            logger.error("Error executing GET request", e);
        } finally {
            closeResources(response, httpclient);
        }
        return resultString;
    }

    public static String doGetBuffer(String url, Map<String, String> param) {
        CloseableHttpClient httpclient = createHttpClient();
        CloseableHttpResponse response = null;
        try {
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }
            URI uri = builder.build();
            HttpGet httpGet = new HttpGet(uri);
            response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200) {
                InputStream in = response.getEntity().getContent();
                StringBuffer sb = new StringBuffer();
                byte[] b = new byte[1024 * 1024];
                int len;
                while ((len = in.read(b)) != -1) {
                    sb.append(new String(b, 0, len, "utf-8"));
                }
                return sb.toString();
            }
        } catch (Exception e) {
            logger.error("Error executing GET request", e);
        } finally {
            closeResources(response, httpclient);
        }
        return "";
    }

    private static void setHeader(HttpRequestBase httpRequestBase, Map<String, String> header) {
        if (header != null && !header.isEmpty()) {
            for (Map.Entry<String, String> entry : header.entrySet()) {
                httpRequestBase.setHeader(entry.getKey(), entry.getValue());
            }
        }
    }

    public static String doPost(String url, Map<String, String> param) {
        CloseableHttpClient httpClient = createHttpClient();
        CloseableHttpResponse response = null;
        String resultString = "";
        try {
            HttpPost httpPost = new HttpPost(url);
            if (param != null) {
                List<NameValuePair> paramList = new ArrayList<>();
                for (String key : param.keySet()) {
                    paramList.add(new BasicNameValuePair(key, param.get(key)));
                }
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(paramList);
                httpPost.setEntity(entity);
            }
            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), "utf-8");
        } catch (Exception e) {
            logger.error("Error executing POST request", e);
        } finally {
            closeResources(response, httpClient);
        }
        return resultString;
    }

    public static String doPost(String url, MultipartFile file, Map<String, String> param) {
        return doPost(url, param);
    }

    public static String doPost(String url, Map<String, String> param, Map<String, String> heads) {
        CloseableHttpClient httpClient = createHttpClient();
        CloseableHttpResponse response = null;
        String resultString = "";
        try {
            HttpPost httpPost = new HttpPost(url);
            if (param != null) {
                List<NameValuePair> paramList = new ArrayList<>();
                for (String key : param.keySet()) {
                    paramList.add(new BasicNameValuePair(key, param.get(key)));
                }
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(paramList);
                httpPost.setEntity(entity);
            }
            setHeader(httpPost, heads);
            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), "utf-8");
        } catch (Exception e) {
            logger.error("Error executing POST request", e);
        } finally {
            closeResources(response, httpClient);
        }
        return resultString;
    }

    public static String doPost(String url) {
        return doPost(url, null);
    }

    public static String doPostJson(String url, String json) {
        CloseableHttpClient httpClient = createHttpClient();
        CloseableHttpResponse response = null;
        String resultString = "";
        try {
            HttpPost httpPost = new HttpPost(url);
            StringEntity entity = new StringEntity(json, ContentType.APPLICATION_JSON);
            httpPost.setEntity(entity);
            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), "utf-8");
        } catch (Exception e) {
            logger.error("Error executing POST request", e);
        } finally {
            closeResources(response, httpClient);
        }
        return resultString;
    }

    public static String doPostJson(String url, String json, Map<String, String> heads) {
        CloseableHttpClient httpClient = createHttpClient();
        CloseableHttpResponse response = null;
        String resultString = "";
        try {
            HttpPost httpPost = new HttpPost(url);
            StringEntity entity = new StringEntity(json, ContentType.APPLICATION_JSON);
            httpPost.setEntity(entity);
            setHeader(httpPost, heads);
            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), "utf-8");
        } catch (Exception e) {
            logger.error("Error executing POST request", e);
        } finally {
            closeResources(response, httpClient);
        }
        return resultString;
    }

}
