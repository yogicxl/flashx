package FlashX.Graphics.Components
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.events.Event;
	
	import FlashX.Core.*;
	import FlashX.Graphics.*;
	
	public class FPSComponent extends BasicComponent
	{
		private var frames:Number;
		private var before:Number;
		private var now:Number;
		private var delay:Number;
		private var mc:MovieClip;
		private var txt:TextField;
		
		public function FPSComponent(parent:MovieClip, x:Number, y:Number, width:Number, height:Number)
		{
			this.Visible = true;
			
			this.frames = this.before = this.now = 0;

			this.delay = 1000;
			
			this.mc = new MovieClip();
			
			parent.addChild(this.mc);

			this.txt = new TextField();
			this.txt.x = x; this.txt.y = y;
            this.txt.width = width; this.txt.height = height;
			this.txt.defaultTextFormat = new TextFormat("Verdana", 45, 0xFF0000, false, false, false);
			this.txt.selectable = false;
			
			this.mc.addChild(this.txt);
		}
		
		public override function Initialize():void
		{
			
		}

		public override function Update(time:Time):void
		{
			++this.frames;

			this.now = getTimer();
		}

		public override function Draw(device:GraphicsDevice):void
		{
			if((this.now - this.before) > this.delay)
			{
				this.txt.text = String(this.frames) + " FPS";

				this.frames = 0;
				this.before = this.now;
			}
		}
	}
}