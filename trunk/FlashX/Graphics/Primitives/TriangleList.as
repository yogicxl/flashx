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
			var vertex2:IVertex;
			var vertex3:IVertex;
			
			for each(var index:int in indexData)
			{
				var vertex:IVertex = vertexData[index];

				if(indexData.length > index+1)
					vertex2 = vertexData[index+1];
					
				if(indexData.length > index+2)
					vertex3 = vertexData[index+2];
				
				if(vertex2 != null && vertex3 != null)
				{
					//trace((vertex.Position.Clone().Normalize().X));
					//Raster.filledTri(device.drawer, vertex.Position.X - (vertex.Position.X / vertex.Position.Clone().Normalize().X) * (vertex.Position.Z / vertex.Position.Clone().Normalize().Z), vertex.Position.Y - (vertex.Position.Y / vertex.Position.Clone().Normalize().Y) * (vertex.Position.Z / vertex.Position.Clone().Normalize().Z), 
													//vertex2.Position.X - (vertex2.Position.X / vertex2.Position.Clone().Normalize().X) * (vertex2.Position.Z / vertex2.Position.Clone().Normalize().Z), vertex2.Position.Y - (vertex2.Position.Y / vertex2.Position.Clone().Normalize().Y) * (vertex2.Position.Z / vertex2.Position.Clone().Normalize().Z), 
													//vertex3.Position.X - (vertex3.Position.X / vertex3.Position.Clone().Normalize().X) * (vertex3.Position.Z / vertex3.Position.Clone().Normalize().Z), vertex3.Position.Y - (vertex3.Position.Y / vertex3.Position.Clone().Normalize().Y) * (vertex3.Position.Z / vertex3.Position.Clone().Normalize().Z), 
													//vertex.Color.base);
					//var vertex3:IVertex = ;
					
					var v1:IVector = device.Viewport.Project(vertex.Position, device.Filter.Projection, device.Filter.View, device.Filter.World);
					var v2:IVector = device.Viewport.Project(vertex2.Position, device.Filter.Projection, device.Filter.View, device.Filter.World);
					var v3:IVector = device.Viewport.Project(vertex3.Position, device.Filter.Projection, device.Filter.View, device.Filter.World);
					
					Raster.filledTri(device.drawer, v1.X, v1.Y, v2.X, v2.Y, v3.X, v3.Y, vertex.Color.base);
				}
			}
		}
	}
}