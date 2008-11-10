package FlashX.Graphics
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public interface IVertex
	{
		function get Position():IVector;
		function set Position(position:IVector):void;
		
		function get Culled():Boolean;
		function set Culled(culled:Boolean):void;
		
		function get Color():Colour;
		function set Color(colour:Colour):void;
	}
}