package;

import com.gelert.log.ScreenLog;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import openfl.events.TimerEvent;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.utils.Timer;

/**
 * ...
 * @author gelert
 */
class Main extends Sprite {

	public function new() {
		super();
		var halfWidth = stage.stageWidth / 2;
		var format = new TextFormat(null, Std.int(stage.stageWidth / 25));
		_leftLog.defaultTextFormat = format;
		_leftLog.width = halfWidth;
		addChild(_leftLog);
		_rightLog.defaultTextFormat = format;
		_rightLog.width = halfWidth;
		_rightLog.x = halfWidth;
		addChild(_rightLog);
		update();
		stage.addEventListener(Event.RESIZE, onResize);
		_timer.addEventListener(TimerEvent.TIMER, update);
		_timer.start();
	}
	
	var _leftLog = new ScreenLog();
	var _rightLog = new ScreenLog();
	var _timer = new Timer(100);
	var _height:Int = 0;
	
	function update(?_) {
		if(_height != stage.stageHeight) {
			_height = stage.stageHeight;
			_leftLog.height = _height;
			_rightLog.height = height;
			_rightLog.add('stageHeight = ${Std.string(_height)}');
			graphics.clear();
			graphics.beginFill(0xCCCCCC);
			graphics.drawRect(0, 0, stage.stageWidth, _height);
		}
	}
	
	function onResize(_) {
		_leftLog.add('onResize:\nstageHeight = ${stage.stageHeight}');
		update();
	}
}