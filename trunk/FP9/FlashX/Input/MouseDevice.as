package FlashX.Input
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.display.MovieClip;
	
	public class MouseDevice extends Sprite
	{
		public function MouseDevice(mc:MovieClip)
		{
		
		}
		
		private function ReceivedFromJavaScript(value:String):void
		{
			//output.appendText("JavaScript says: " + value + "\n");
		}
		
		private function CheckJavaScriptReady():Boolean
		{
			var isReady:Boolean = ExternalInterface.call("isReady");
			return isReady;
		}
		
		private function TimerHandler(event:TimerEvent):void
		{
			//output.appendText("Checking JavaScript status...\n");
			var isReady:Boolean = CheckJavaScriptReady();
			if (isReady)
			{
				//output.appendText("JavaScript is ready.\n");
				Timer(event.target).stop();
			}
		}
		
		private function ClickHandler(event:MouseEvent):void
		{
			//if(ExternalInterface.available)
				//ExternalInterface.call("sendToJavaScript", input.text);
		}
		
		public function DisableRightClick()
		{
			if(ExternalInterface.available)
			{
				try
				{
					//output.appendText("Adding callback...\n");
					
					ExternalInterface.addCallback("sendToActionScript", ReceivedFromJavaScript);
					
					if(CheckJavaScriptReady())
					{
						//output.appendText("JavaScript is ready.\n");
					}
					else
					{
						//output.appendText("JavaScript is not ready, creating timer.\n");
						var readyTimer:Timer = new Timer(100, 0);
						readyTimer.addEventListener(TimerEvent.TIMER, TimerHandler);
						readyTimer.start();
					}
				} catch (error:SecurityError) {
					//output.appendText("A SecurityError occurred: " + error.message + "\n");
				} catch (error:Error) {
					//output.appendText("An Error occurred: " + error.message + "\n");
				}
			}
			else
			{
				//output.appendText("External interface is not available for this container.");
			}
		}
		/*
			var injectScript:String = 
(
<![CDATA[
function right(e)
{
if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)) return false;
else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) {
return false;
}

return true;
}
document.onmousedown=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
window.onmousedown=right;
]]>
).toString();

ExternalInterface.call("function(){"+injectScript+"}");
			//var url:URLRequest = new URLRequest("javascript:(function(){" + injectScript + "})(); void(0);");
			//navigateToURL(url, "_self");*/
	}
}