package com.gelert.log;

import openfl.text.TextField;

/**
 * ...
 * @author gelert
 */
class ScreenLog extends TextField {

	public function new() {
		super();
		wordWrap = true;
		multiline = true;
	}
	
	public function resize(width:Float, height:Float) {
		this.width = width;
		this.height = height;
		scrollV = maxScrollV;
	}
	
	public function add(message:String) {
		if(text == '') {
			text = message;
		} else {
			appendText('\n' + message);
		}
		scrollV = maxScrollV;
	}
}