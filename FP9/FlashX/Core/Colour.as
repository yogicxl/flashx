package FlashX.Core
{
	public class Colour
	{
		public var base:uint;
		
		public function Colour(base:uint = 0xFFFFFFF)
		{
			this.base = base;
		}
		
		public static function get White():Colour { return new Colour(0xFFFFFFF); }
		public static function get Black():Colour { return new Colour(0x000000); }
		public static function get Red():Colour { return new Colour(0x60FF0000); }
		public static function get Green():Colour { return new Colour(0x6000FF00); }
		public static function get Blue():Colour { return new Colour(0x600000FF); }
		public static function get Orange():Colour { return new Colour(0x60FF7300); }
		public static function get Cyan():Colour { return new Colour(0x6000FFF2); }
		public static function get Purple():Colour { return new Colour(0x605E00FF); }
		public static function get Yellow():Colour { return new Colour(0x60FFFF00); }
		
	}
}