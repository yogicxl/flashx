package FlashX.Graphics.Primitives
{
	import flash.geom.*;
	import flash.display.*;
	import flash.filters.*;
	
	//import flash.display.*;

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
			this.Draw2(device, this.Vertices, this.Indices);
		}
		
		public function Draw2(device:GraphicsDevice, vertexData:Array, indexData:Array = null):void
		{
			if(vertexData.length > 0)
			{
				if(indexData.length > 0)
				{
					this.DrawIndexedPrimitives(device, vertexData, 0, indexData, 0, vertexData.length + 1);
				}
				else
				{
					this.DrawPrimitives(device, vertexData, 0, vertexData.length + 1);
				}
			}
		}
		
		
		public function DrawPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, primitiveCount:int):void
		{
			for each(var vertex:IVertex in vertexData)
			{
				device.drawer.setPixel32(vertex.Position.X, vertex.Position.Y, vertex.Color.base);
			}
		}
		
		public function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, indexData:Array, indexOffset:int, primitiveCount:int):void
		{
			for each(var index:int in indexData)
			{
				var vertex:IVertex = vertexData[index];
			}
		}
	}
}