package FlashX.Graphics
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public interface ICamera extends IComponent
	{
		// generate view matrix from position and rotation
		function get View():IMatrix;
		function set View(view:IMatrix):void;
		
		function get Position():IVector;
		function set Position(position:IVector):void;
		
		function get Rotation():IVector;
		function set Rotation(rotation:IVector):void;
		
		function get Direction():IQuaternion;
		function set Direction(rotation:IQuaternion):void;
	}
}