package org.photo.exception;

import lombok.extern.slf4j.Slf4j;
import org.photo.util.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 异常处理器
 *
 * @Author scott
 * @Date 2019
 */
@RestControllerAdvice
@Slf4j
public class BizExceptionHandler {


	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(BizException.class)
	public R<?> handleBizException(BizException e){
		return R.no(e.getMessage());
	}

	@ExceptionHandler(Exception.class)
	public R<?> handleException(Exception e){
		return R.no("操作失败，"+e.getMessage());
	}

}
