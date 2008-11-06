package FlashX.Graphics
{
	import FlashX.Math.*;
	
	public interface ISprite extends IComponent
	{
		function get World():IMatrix;
		function set World(world:IMatrix):void;
		
		function get View():IMatrix;
		function set View(view:IMatrix):void;
		
		function get Projection():IMatrix;
		function set Projection(projection:IMatrix):void;
		
		function get Camera():ICamera;
		function set Camera(camera:ICamera):void;
		
		function get Lighting():ILighting;
		function set Lighting(lighting:ILighting):void;
	}
}