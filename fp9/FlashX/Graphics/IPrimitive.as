package FlashX.Graphics
{
	import FlashX.Core.*;
	
	public interface IPrimitive extends IDrawable
	{
		function get Vertices():Array;
		function get Indices():Array;
	}
}