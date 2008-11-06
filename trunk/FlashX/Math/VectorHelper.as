package FlashX.Math
{
	import FlashX.Core.Abstract;
	
	public class VectorHelper extends Abstract
	{
		public static function Add(v1:IVector, v2:IVector):IVector
		{
			return v1.Clone().Add(v2);
		}
		
		public static function Subtract(v1:IVector, v2:IVector):IVector
		{
			return v1.Clone().Subtract(v2);
		}
		
		public static function Multiply(v:IVector, n:Number):IVector
		{
			return v.Clone().Multiply(n);
		}
		
		public static function Divide(v:IVector, n:Number):IVector
		{
			return v.Clone().Divide(n);
		}
		
		public static function Normalize(v:IVector):IVector
		{
			return v.Clone().Normalize();
		}
		
		public static function Invert(v:IVector):IVector
		{
			return v.Clone().Invert();
		}
		
		public static function Dot(v1:IVector, v2:IVector):Number
		{
			return v1.Clone().Dot(v2);
		}
		
		public static function Cross(v1:IVector, v2:IVector):IVector
		{
			return v1.Clone().Cross(v2);
		}
		
		public static function Equals(v1:IVector, v2:IVector):Boolean
		{
			return v1.Equals(v2);
		}
		
		public static function Copy(v1:IVector, v2:IVector):IVector
		{
			return v1.Copy(v2);
		}
		
		public static function Distance(v1:IVector, v2:IVector):Number
		{
			var v:IVector = VectorHelper.Subtract(v1, v2);
			
			return v.Length;
		}
		
		public static function DistanceSquared(v1:IVector, v2:IVector):Number
		{
			var v:IVector = VectorHelper.Subtract(v1, v2);
			
			return v.LengthSquared;
		}
	}
}