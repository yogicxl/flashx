package FlashX.Input
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class KeyboardDevice
	{
		internal static var state:KeyboardState;
		
		private var parent:MovieClip;
		private var stage:Stage;

		public function KeyboardDevice(parent:MovieClip)
		{
			if(KeyboardDevice.state == null)
			{
				this.parent = parent;
				this.stage = parent.stage;
				
				KeyboardDevice.state = new KeyboardState();
				
				this.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyDownHandler);
				this.stage.addEventListener(KeyboardEvent.KEY_UP, this.KeyUpHandler);
			}
			else
			{
				throw new Error("KeyboardDevice is a singleton.");
			}
		}
		
		public function KeyDownHandler(e:KeyboardEvent):void
		{
			KeyboardDevice.state[e.keyCode] = true;
		}

		public function KeyUpHandler(e:KeyboardEvent):void
		{
			KeyboardDevice.state[e.keyCode] = false;
		}
		
		public static function GetState():KeyboardState
		{
			return KeyboardDevice.state.Clone();
		}
	}
}