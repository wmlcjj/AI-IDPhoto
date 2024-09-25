package org.photo.modular.user.contorller;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.photo.modular.user.entity.CustomerUser;
import org.photo.modular.user.vo.CustomerUserVo;
import org.springframework.beans.BeanUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.photo.modular.user.service.ICustomerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.photo.util.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
public class CustomerUserController {

    @Autowired
    private ICustomerUserService customerUserService;
    @Autowired
    private FileStorageService fileStorageService;//注入实列

    /**
     * 根据token获取用户信息
     * @param
     * @param
     * @return
     */
    @GetMapping(value = "/getUserInfo")
    public R getUserInfo(HttpServletRequest request){
        Object userId = StpUtil.getLoginId();
        CustomerUserVo userInfo = new CustomerUserVo();
        if (!StringUtils.isEmpty(userId)){
            LambdaQueryWrapper<CustomerUser> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(CustomerUser::getId,userId);
            CustomerUser user = customerUserService.getOne(queryWrapper);
            BeanUtils.copyProperties(user,userInfo);
        }
        if(!ObjectUtils.isEmpty(userInfo.getId())){
            return R.ok(userInfo);
        }
        return R.data(-1, "获取userInfo失败!", 1);
    }

    /**
     * 根据token获取用户信息
     * @param
     * @param
     * @return
     */
    @PostMapping(value = "/updateUserInfo")
    public R getUserInfo(@RequestBody CustomerUser user){
        Object userId = StpUtil.getLoginId();
        user.setId(userId.toString());
        customerUserService.updateById(user);
        return R.ok("更新成功");
    }


    /**
     * 上传文件用户头像
     */
    @PostMapping("/uploadUserAvatar")
    public R uploadUserAvatar(MultipartFile file) {
        Object userId = StpUtil.getLoginId();
        FileInfo info = fileStorageService.of(file)
                .setPath("userAvatar/")
                .upload();
        CustomerUser user = new CustomerUser();
        user.setId(userId.toString());
        user.setAvatar(info.getId());
        customerUserService.updateById(user);
        return R.ok("上传成功");
    }
}
