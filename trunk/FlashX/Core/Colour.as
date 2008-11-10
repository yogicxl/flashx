package FlashX.Core
{
	public class Colour
	{
		public var base:uint;
		
		public function Colour(base:uint = 0x000000)
		{
			this.base = base;
		}
		
		public static function get Black():Colour
		{
			return new Colour();
		}
		
		public static function get White():Colour
		{
			return new Colour(0xFFFFFFF);
		}
		
		public static function get Red():Colour
		{
			return new Colour(0x60FF0000);
		}
	}
}