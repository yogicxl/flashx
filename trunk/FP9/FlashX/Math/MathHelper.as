package FlashX.Math
{
	public class MathHelper
	{
		public static const E:Number = 2.718282;
		public static const Log10E:Number = 0.434295;
		public static const Log2E:Number = 1.442695;
		public static const Pi:Number = 3.141593;
		public static const PiOver2:Number = 1.570796;
		public static const PiOver4:Number = 0.785398;
		public static const TwoPi:Number = 6.283185;
		public static const Epsilon:Number = 0.000001;

		public static function ToDegrees(radians:Number):Number
		{
			return radians * 57.29578; // (180 / Math.PI)
		}
		
		public static function ToRadians(degrees:Number):Number
		{
			return degrees * 0.0174533; // (Math.PI / 180)
		}
		
		public static function WithinEpsilon(n1:Number, n2:Number):Boolean
		{
			var n3:Number = n1 - n2;
			
			return ((n3 >= -MathHelper.Epsilon) && (n3 <= MathHelper.Epsilon));
		}
	}
}