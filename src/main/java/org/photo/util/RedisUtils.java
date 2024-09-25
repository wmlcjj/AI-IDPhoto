package org.photo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.concurrent.TimeUnit;

@Component
public class RedisUtils {

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 指定缓存过期时间
     *
     * @param key
     * @param time 时间(秒)
     * @return
     */
    public void expire(String key, long time){
        redisTemplate.expire(key, time, TimeUnit.SECONDS);
    }

    /**
     * 根据key 获取过期时间
     * @return 时间(秒) 返回0代表为永久有效
     */
    public long getExpire(String key){
        return redisTemplate.getExpire(key);
    }

    /**
     * 判断key是否存在
     * @return
     */
    public boolean hasKey(String key){
        return redisTemplate.hasKey(key);
    }

    /**
     * 删除缓存
     * @return
     */
    public void delete(String... key){
        if(key!=null && key.length>0){
            redisTemplate.delete(CollectionUtils.arrayToList(key));
        }
    }

    /**
     * 根据key 获取缓存数据
     * @return
     */
    public Object get(String key){
        return redisTemplate.opsForValue().get(key);
    }

    /**
     * 添加缓存数据
     * @return
     */
    public void set(String key, Object value){
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 添加缓存数据并设置过期时间
     *
     * @param time 时间小于等于0，将设置无限期
     * @return
     */
    public void set(String key, Object value, long time){
        redisTemplate.opsForValue().set(key, value, time, TimeUnit.SECONDS);
    }
}
