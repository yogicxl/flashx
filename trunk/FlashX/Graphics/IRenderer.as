package FlashX.Graphics
{
	public interface IRenderer
	{
		function Draw(device:GraphicsDevice, vertexData:Array, indexData:Array = null):void;
		
		function DrawPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, primitiveCount:int):void;
		
		function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, indexData:Array, indexOffset:int, primitiveCount:int):void;
	}
}

