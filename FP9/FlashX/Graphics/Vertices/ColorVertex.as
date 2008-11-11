package FlashX.Graphics.Vertices
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class ColorVertex extends BasicVertex
	{
		
		public function ColorVertex(position:IVector, colour:Colour)
		{
			this.Position = position;
			this.Color = colour;
		}
	}
}