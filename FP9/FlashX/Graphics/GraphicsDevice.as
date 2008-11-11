package FlashX.Graphics
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.display.Sprite;
	
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public class GraphicsDevice
	{
		public var drawer:BitmapData;
		public var display:Sprite;
		public var stage2:Stage;
		public var bmp:Bitmap;
		public var Viewport:Screen;
		public var Filter:IFilter;
		
		/*
		* Constructor
		*/
		
		public function GraphicsDevice()
		{
			 this.drawer = new BitmapData(800, 600, false, 0xFFCC00);
			 this.display = new Sprite();
			 
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