package FlashX.Graphics.Primitives
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	//     Renders the specified vertices as a sequence of isolated triangles. Each
	//     group of three vertices defines a separate triangle. Back-face culling is
	//     affected by the current winding-order render state.
	public class TriangleList extends BasicPrimitive
	{
		public function TriangleList()
		{
			this.vertices = new Array();
			this.indices = new Array();
		}
		
		public override function Draw(device:GraphicsDevice):void
		{
			var vertexData:Array = this.Vertices;
			var indexData:Array = this.Indices;
			
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
			var vertex4:IVertex = vertexData[0];
			
			var vertex2:IVertex;
			var vertex3:IVertex;
			
			for each(var vertex:IVertex in vertexData)
			{
				if(vertex2 != null && vertex3 != null)
				{
					
					
					Raster.filledTri(device.drawer, vertex.Position.X * 256 / vertex.Position.Z, vertex.Position.Y * 256 / vertex.Position.Z, vertex2.Position.X * 256 / vertex2.Position.Z, vertex2.Position.Y * 256 / vertex2.Position.Z, vertex4.Position.X * 256 / vertex4.Position.Z, vertex4.Position.Y * 256 / vertex4.Position.Z, vertex.Color.base);
				}
				
				vertex3 = vertex2;
				vertex2 = vertex;
			}
			
			Raster.filledTri(device.drawer, vertex.Position.X * 256 / vertex.Position.Z, vertex.Position.Y * 256 / vertex.Position.Z, vertex2.Position.X * 256 / vertex2.Position.Z, vertex2.Position.Y * 256 / vertex2.Position.Z, vertex3.Position.X * 256 / vertex3.Position.Z, vertex3.Position.Y * 256 / vertex3.Position.Z, vertex.Color.base);
		}
		
		public function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, indexData:Array, indexOffset:int, primitiveCount:int):void
		{
			for(var i = 0, l = indexData.length; i < l; i+=3)
			{
				if(indexData.length >= i+2)
				{
					var vertex:IVertex = vertexData[indexData[i]];
					var vertex2:IVertex = vertexData[indexData[i+1]];
					var vertex3:IVertex = vertexData[indexData[i+2]];
				
					var v1:IVector = device.Viewport.Project(vertex.Position, device.Filter.Projection, device.Filter.View, device.Filter.World);
					var v2:IVector = device.Viewport.Project(vertex2.Position, device.Filter.Projection, device.Filter.View, device.Filter.World);
					var v3:IVector = device.Viewport.Project(vertex3.Position, device.Filter.Projection, device.Filter.View, device.Filter.World);
					//trace(device.Filter.View);
					//trace(v1);
					//trace(vertex.Position);
					Raster.filledTri(device.drawer, v1.X, v1.Y, v2.X, v2.Y, v3.X, v3.Y, vertex.Color.base);
				}
			}
		}
	}
}