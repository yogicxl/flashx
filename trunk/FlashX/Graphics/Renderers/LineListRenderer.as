package FlashX.Graphics.Renderers
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class LineListRenderer extends BasicRenderer
	{
		public override function Draw(device:GraphicsDevice, vertexData:Array, indexData:Array = null):void
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
		
		
		public override function DrawPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, primitiveCount:int):void
		{
			for each(var vertex:IPrimitive in vertexData)
			{
				
			}
		}
		
		public override function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, indexData:Array, indexOffset:int, primitiveCount:int):void
		{
			for each(var index:int in indexData)
			{
				var vertex:IPrimitive = vertexData[index];

			}
		}
	}
}