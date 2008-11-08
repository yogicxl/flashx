package FlashX.Graphics.Renderers
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class LineStripRenderer extends BasicRenderer
	{
		public override function DrawPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, primitiveCount:int):void
		{
			for each(var vertex:IPrimitive in vertexData)
			{
				
			}
		}
		
		public override function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, vertexTotal:int, indexData:Array, indexOffset:int, primitiveCount:int):void
		{
			for each(var index:int in indexData)
			{
				var vertex:IPrimitive = vertexData[index];

			}
		}
	}
}