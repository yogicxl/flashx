package FlashX.Graphics.Renderers
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicRenderer extends Abstract implements IRenderer
	{
		public function Draw(device:GraphicsDevice, vertexData:Array, indexData:Array = null):void {};
		
		public function DrawPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, primitiveCount:int):void { }
		
		public function DrawIndexedPrimitives(device:GraphicsDevice, vertexData:Array, vertexOffset:int, indexData:Array, indexOffset:int, primitiveCount:int):void { }
	}
}