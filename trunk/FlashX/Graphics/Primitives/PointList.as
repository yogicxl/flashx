package FlashX.Graphics.Primitives
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	import FlashX.Graphics.Renderers.PointListRenderer;
	
	//     Renders the vertices as a collection of isolated points. This value is unsupported
	//     for indexed primitives.
	public class PointList extends BasicPrimitive
	{
		public static var renderer:IRenderer;
		
		public static function get Renderer():IRenderer
		{
			if(renderer == null)
				renderer = new PointListRenderer();
			
			return renderer;
		}
		
		/*
		* Properties
		*/
		
		/*
		* Constructor
		*/
		
		public function PointList()
		{
			this.vertices = new Array();
			this.indices = new Array();
		}
		
		public override function Draw(device:GraphicsDevice):void
		{
			PointList.Renderer.Draw(device, this.Vertices, this.Indices);
		}
	}
}