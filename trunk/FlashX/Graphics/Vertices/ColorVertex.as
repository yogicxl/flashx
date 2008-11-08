package FlashX.Graphics.Vertices
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class ColorVertex extends BasicVertex
	{
		private var color:Colour;
		
		public function get Color():Colour
		{
			return this.color;
		}
		
		public function set Color(colour:Colour):void
		{
			this.color = colour;
		}
		
		public function ColorVertex(position:IVector, colour:Colour)
		{
			this.Position = position;
			this.Color = colour;
		}
	}
}