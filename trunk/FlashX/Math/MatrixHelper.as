package FlashX.Math
{
	import FlashX.Core.*;
	
	public class MatrixHelper extends Abstract
	{
		public static function Add(... args:Array):IMatrix
		{
			var m1:IMatrix = args[0].Clone();
			
			for each(var m2:IMatrix in args)
				m1.Add(m2);
			
			return m1;
		}
		
		public static function Subtract(... args:Array):IMatrix
		{
			var m1:IMatrix = args[0].Clone();
			
			for each(var m2:IMatrix in args)
				m1.Subtract(m2);
			
			return m1;
		}
		
		public static function Multiply(... args:Array):IMatrix
		{
			var m1:IMatrix = args[0].Clone();
			
			for each(var m2:IMatrix in args)
				m1.Multiply(m2);
			
			return m1;
		}

		public static function CreateTranslation(v:IVector):IMatrix
		{
			return Matrix4.Identity.Translate(v);
		}
		
		public static function CreateFromAxisAngle(v:IVector, angle:Number):IMatrix
		{
			var m:IMatrix = Matrix4.Identity;
			
			var x:Number = v.X;
			var y:Number = v.Y;
			var z:Number = v.Z;
			
			var a1:Number = Math.sin(angle);
			var a2:Number = Math.cos(angle);
			
			var n1:Number = x * x;
			var n2:Number = y * y;
			var n3:Number = z * z;
			var n4:Number = x * y;
			var n5:Number = x * z;
			var n6:Number = y * z;
			
			m[1][1] = n1 + (a2 * (1 - n1));
			m[1][2] = (n4 - (a2 * n4)) + (a1 * z);
			m[1][3] = (n5 - (a2 * n5)) - (a1 * y);

			m[2][1] = (n4 - (a2 * n4)) - (a1 * z);
			m[2][2] = n2 + (a2 * (1 - n2));
			m[2][3] = (n6 - (a2 * n6)) + (a1 * x);

			m[3][1] = (n5 - (a2 * n5)) + (a1 * y);
			m[3][2] = (n6 - (a2 * n6)) - (a1 * x);
			m[3][3] = n3 + (a2 * (1 - n3));

			return m;
		}
		
		public static function CreateRotationX(radians:Number):IMatrix
		{
			var m:IMatrix = Matrix4.Identity;
			
			var a1:Number = Math.cos(radians);
			var a2:Number = Math.sin(radians);
			
			m[2][2] = a1; m[2][3] = a2;
			m[3][2] = -a2; m[3][3] = a1;
			
			return m;
		}
		
		public static function CreateRotationY(radians:Number):IMatrix
		{
			var m:IMatrix = Matrix4.Identity;
			
			var a1:Number = Math.cos(radians);
			var a2:Number = Math.sin(radians);
			
			m[1][1] = a1; m[1][3] = -a2;
			m[3][1] = a2; m[3][3] = a1;
			
			return m;
		}
		
		public static function CreateRotationZ(radians:Number):IMatrix
		{
			var m:IMatrix = Matrix4.Identity;
			
			var a1:Number = Math.cos(radians);
			var a2:Number = Math.sin(radians);
			
			m[1][1] = a1; m[1][2] = a2;
			m[2][1] = -a2; m[2][2] = a1;
			
			return m;
		}
	}
}