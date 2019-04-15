package com.kh.pickmatch.common.exception;

public class MessageException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3404009771744270773L;

	public MessageException() {
		super();
	}
	
	public MessageException(String msg)
	{
		super(msg);
	}
	
}
