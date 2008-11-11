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
			var preVertex:IVertex;
			
			for each(var vertex:IVertex in vertexData)
			{
				if(preVertex != null)
				{
					
					
					Raster.line(device.drawer, vertex.Position.X * 256 / vertex.Position.Z, vertex.Position.Y * 256 / vertex.Position.Z, preVertex.Position.X * 256 / preVertex.Position.Z, preVertex.Position.Y * 256 / preVertex.Position.Z, vertex.Color.base);
				}
				
				preVertex = vertex;
			}
			
			Raster.line(device.drawer, preVertex.Position.X * 256 / preVertex.Position.Z, preVertex.Position.Y * 256 / preVertex.Position.Z, vertexData[0].Position.X * 256 / vertexData[0].Position.Z, vertexData[0].Position.Y * 256 / vertexData[0].Position.Z, vertexData[0].Color.base);
		}
		
		public override function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, indexData:Array, indexOffset:int, primitiveCount:int):void
		{
			for each(var index:int in indexData)
			{
				var vertex:IVertex = vertexData[index];

			}
		}
	}
}