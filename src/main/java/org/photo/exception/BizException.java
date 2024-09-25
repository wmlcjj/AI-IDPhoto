package org.photo.exception;


import java.io.Serializable;

/**
 * 业务异常基类
 */
public class BizException extends RuntimeException implements Serializable {


    private static final long serialVersionUID = 1L;

    public BizException(String message){
        super(message);
    }

    public BizException(Throwable cause)
    {
        super(cause);
    }

    public BizException(String message, Throwable cause)
    {
        super(message,cause);
    }

}
