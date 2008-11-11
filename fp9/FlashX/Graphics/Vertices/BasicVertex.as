package FlashX.Graphics.Vertices
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicVertex extends Abstract implements IVertex
	{
		private var position:IVector;
		private var culled:Boolean;
		
		public function get Position():IVector
		{
			return this.position;
		}
		
		public function set Position(position:IVector):void
		{
			this.position = position;
		}
		
		public function get Culled():Boolean
		{
			return this.culled;
		}
		
		public function set Culled(culled:Boolean):void
		{
			this.culled = culled;
		}
		
		private var color:Colour;
		
		public function get Color():Colour
		{
			return this.color;
		}
		
		public function set Color(colour:Colour):void
		{
			this.color = colour;
		}
	}
}