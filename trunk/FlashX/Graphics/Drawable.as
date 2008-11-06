package FlashX.Graphics
{
	import FlashX.Math.Vector;
	import FlashX.Math.Quaternion;
	
	public interface Drawable
	{
		function get Position():Vector;
		function set Position(position:Vector):void;
		
		function get Rotation():Vector;
		function set Rotation(rotation:Vector):void;
		
		function get Direction():Quaternion;
		function set Direction(rotation:Quaternion):void;
		
		function Draw():void;
	}
}