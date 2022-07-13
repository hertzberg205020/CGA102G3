package com.cga102g3.core.util;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 04:32
 */
public class JedisPoolUtil {
    private static JedisPool pool = null;

    private JedisPoolUtil() {
    }

    public static JedisPool getJedisPool() {
        // 懶漢式
        if (pool == null) {
            synchronized (JedisPoolUtil.class) {
                if (pool == null) {
                    JedisPoolConfig config = new JedisPoolConfig();
                    config.setMaxTotal(70);
                    config.setMaxIdle(8);
                    config.setMaxWaitMillis(10000);
                    pool = new JedisPool(config, "localhost", 6379);
                }
            }
        }
        return pool;
    }

    // 可在ServletContextListener的contextDestroyed裡呼叫此方法註銷Redis連線池
    public static void shutdownJedisPool() {
        if (pool != null)
            pool.destroy();
    }
}
