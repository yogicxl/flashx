package FlashX.Graphics.Models
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class Cube extends BasicModel
	{
		public function Cube()
		{
			this.Primitives = new Array();
		}
		
		/*
		* Overloaded Methods
		*/
		
		public override function Update(time:Time):void
		{
			// update direction via rotation
			// update view
			
		}
		
		public override function Draw(device:GraphicsDevice):void
		{
			// draw with world, view, and projection
		}
	}
}