package FlashX.Core
{
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public interface IDrawable
	{
		function get World():IMatrix;
		function set World(world:IMatrix):void;
		
		function get View():IMatrix;
		function set View(view:IMatrix):void;
		
		function get Projection():IMatrix;
		function set Projection(projection:IMatrix):void;
		
		function Draw(device:GraphicsDevice):void;
	}
}