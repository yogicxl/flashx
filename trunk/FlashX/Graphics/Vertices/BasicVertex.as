package FlashX.Graphics.Vertices
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicVertex extends Abstract implements IVertex
	{
		private var position:IVector;
		
		public function get Position():IVector
		{
			return this.position;
		}
		
		public function set Position(position:IVector):void
		{
			this.position = position;
		}
	}
}