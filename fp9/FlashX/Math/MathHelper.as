package FlashX.Math
{
	public class MathHelper
	{
        public static const E:Number = 2.71828;
        public static const Log10E:Number = 0.434294;
        public static const Log2E:Number = 1.4427;
        public static const Pi:Number = 3.14159;
        public static const PiOver2:Number = 1.5708;
        public static const PiOver4:Number = 0.785398;
        public static const TwoPi:Number = 6.28319;
		public static const Epsilon:Number = 0.000001;

		public static function ToDegrees(radians:Number):Number
		{
			return radians * (180 / Math.PI);
		}
		
		public static function ToRadians(degrees:Number):Number
		{
			return degrees * (Math.PI / 180);
		}
		
		public static function WithinEpsilon(n1:Number, n2:Number):Boolean
		{
			var n3:Number = n1 - n2;
			
			return ((n3 >= -MathHelper.Epsilon) && (n3 <= MathHelper.Epsilon));
		}
	}
}