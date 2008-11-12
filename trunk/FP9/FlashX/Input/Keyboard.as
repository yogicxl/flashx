package FlashX.Input
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	
	public class Keyboard
	{
		private var stage:Stage;
		private var state:KeyboardState;
		
		public function Keyboard(parent:MovieClip)
		{
			this.stage = parent.stage;
			this.state = new KeyboardState();
		}
		
		public function KeyDownHandler(e:KeyboardEvent):void
		{
			this.state[e.keyCode] = true;
		}

		public function KeyUpHandler(e:KeyboardEvent):void
		{
			this.state[e.keyCode] = false;
		}
	}
}