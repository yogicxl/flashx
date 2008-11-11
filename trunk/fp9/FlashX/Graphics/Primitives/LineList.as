package FlashX.Graphics.Primitives
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	import FlashX.Graphics.Renderers.LineListRenderer;
	
	//     Renders the vertices as a list of isolated straight line segments; the count
	//     may be any positive integer.
	public class LineList extends BasicPrimitive
	{
		public static var renderer:IRenderer;
		
		public static function get Renderer():IRenderer
		{
			if(renderer == null)
				renderer = new LineListRenderer();
			
			return renderer;
		}
		
		/*
		* Properties
		*/
		
		
		
		/*
		* Constructor
		*/
		
		public function LineList()
		{
			this.vertices = new Array();
			this.indices = new Array();
		}
		
		public override function Draw(device:GraphicsDevice):void
		{
			LineList.Renderer.Draw(device, this.Vertices, this.Indices);
		}
	}
}