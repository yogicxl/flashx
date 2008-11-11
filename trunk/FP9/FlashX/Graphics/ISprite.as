package FlashX.Graphics
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public interface ISprite extends IComponent
	{
		function get Position():IVector;
		function set Position(position:IVector):void;
		
		function get Rotation():IVector;
		function set Rotation(rotation:IVector):void;
		
		function get Direction():IQuaternion;
		function set Direction(rotation:IQuaternion):void;
		
		function get Camera():ICamera;
		function set Camera(camera:ICamera):void;
		
		function get Lighting():ILighting;
		function set Lighting(lighting:ILighting):void;
	}
}