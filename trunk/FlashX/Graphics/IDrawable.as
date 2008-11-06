package FlashX.Graphics
{
	import FlashX.Math.*;
	
	public interface IDrawable
	{
		function get Position():IVector;
		function set Position(position:IVector):void;
		
		function get Rotation():IVector;
		function set Rotation(rotation:IVector):void;
		
		function get Direction():IQuaternion;
		function set Direction(rotation:IQuaternion):void;
		
		function Draw():void;
	}
}