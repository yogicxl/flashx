package FlashX.Core.Components
{
	import flash.system.System;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.events.Event;
	
	import FlashX.Core.*;
	import FlashX.Graphics.*;
	
	public class MemoryComponent extends BasicDrawableComponent
	{
		private var mc:MovieClip;
		private var txt:TextField;
		
		public function MemoryComponent(parent:MovieClip, x:Number, y:Number, width:Number, height:Number)
		{
			this.Visible = true;
			this.Active = true;
			
			this.mc = new MovieClip();
			
			parent.addChild(this.mc);

			this.txt = new TextField();
			this.txt.x = x; this.txt.y = y;
            this.txt.width = width; this.txt.height = height;
			this.txt.defaultTextFormat = new TextFormat("Verdana", 35, 0xFF0000, false, false, false);
			this.txt.selectable = false;
			
			this.mc.addChild(this.txt);
		}
		
		public override function Initialize():void
		{
			
		}

		public override function Update(time:Time):void
		{

		}

		public override function Draw(device:GraphicsDevice):void
		{
			this.txt.text = Number(System.totalMemory / 1024 / 1024).toFixed(2) + " MB";
		}
	}
}