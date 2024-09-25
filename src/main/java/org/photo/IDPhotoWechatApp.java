package org.photo;

import org.dromara.x.file.storage.spring.EnableFileStorage;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@EnableFileStorage
public class IDPhotoWechatApp {
    public static void main(String[] args) {
        SpringApplication.run(IDPhotoWechatApp.class, args);
    }
}
