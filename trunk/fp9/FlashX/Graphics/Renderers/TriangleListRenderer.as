package FlashX.Graphics.Renderers
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class TriangleListRenderer extends BasicRenderer
	{
		public override function DrawPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, primitiveCount:int):void
		{
			var preVertex:IVertex;
			trace("aasd");
			for each(var vertex:IVertex in vertexData)
			{
				if(preVertex != null)
				{
					var v1:IVector = device.Viewport.Project(vertex.Position, device.Filter.Projection, device.Filter.View, device.Filter.World));
					var v2:IVector = device.Viewport.Project(preVertex.Position, device.Filter.Projection, device.Filter.View, device.Filter.World));
					
					Raster.line(device.drawer, v1.X, v1.Y, v2.X, v2.Y, vertex.Color.base);
				}
				
				preVertex = vertex;
			}
			
			//Raster.line(device.drawer, preVertex.Position.X * 256 / preVertex.Position.Z, preVertex.Position.Y * 256 / preVertex.Position.Z, vertexData[0].Position.X * 256 / vertexData[0].Position.Z, vertexData[0].Position.Y * 256 / vertexData[0].Position.Z, vertexData[0].Color.base);
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