package FlashX.Graphics
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.PixelSnapping;
	
	import FlashX.Core.*;
	import FlashX.Math.*;
	import flash.events.EventDispatcher;
	public class GraphicsDevice
	{
		public var drawer:BitmapData;
		public var bmp:Bitmap;
		public var Viewport:Screen;
		public var Filter:IFilter;
		
		/*
		* Constructor
		*/
		
		public function GraphicsDevice()
		{
			this.drawer = new BitmapData(800, 600, false, 0xFFCC00);
			//this.display = new Sprite();
			 
			this.bmp = new Bitmap(this.drawer);
			this.bmp.smoothing = false;
			this.bmp.pixelSnapping = PixelSnapping.AUTO;
			 
			this.Viewport = new Screen();
			 
			this.Viewport.Width = 800;
			this.Viewport.Height = 600;
		}
		
		/*
		* Properties
		*/
		
		/*
		* Methods
		*/
		
		public function Clear(colour:Colour):void
		{
			
		}
	}
}