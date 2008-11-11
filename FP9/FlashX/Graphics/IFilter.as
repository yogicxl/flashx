package FlashX.Graphics
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public interface IFilter
	{
		//function get Device():GraphicsDevice;
		//function set Device(device:GraphicsDevice):void;
		
		function get World():IMatrix;
		function set World(world:IMatrix):void;
		
		function get View():IMatrix;
		function set View(view:IMatrix):void;
		
		function get Projection():IMatrix;
		function set Projection(projection:IMatrix):void;
		
		function Begin(device:GraphicsDevice):void;
		function End(device:GraphicsDevice):void;
	}
}