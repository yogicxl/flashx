// dot product
// cross product
// multiple
// add
// subtract


package FlashX.Math
{
	import FlashX.Core.Errors.*;
	
	public class Vector3 implements IVector
	{
		private var x:Number;
		private var y:Number;
		private var z:Number;
		
		private var length:Number;
		private var changed:Boolean;
		
		/*
		* Constructors
		*/
		
		public function Vector3(x:Number = 0, y:Number = 0, z:Number = 0)
		{
			this.length = 0;
			this.changed = false;
			
			this.X = x;
			this.Y = y;
			this.Z = z;
		}
		
		/*
		* Properties
		*/
		
		public function set X(x:Number):void 
		{
			//x = Math.round(x * 1000);
			
			if(this.x != x)
				this.changed = true;
			
			this.x = x;
		}
		
		public function get X():Number
		{
			return this.x;
		}
		
		public function set Y(y:Number):void 
		{
			//y = Math.round(y * 1000);
			
			if(this.y != y)
				this.changed = true;
			
			this.y = y;
		}
		
		public function get Y():Number
		{
			return this.y;
		}
		
		public function set Z(z:Number):void 
		{
			//z = Math.round(z * 1000);
			
			if(this.z != z)
				this.changed = true;
			
			this.z = z;
		}
		
		public function get Z():Number
		{
			return this.z;
		}
		
		public function set Length(length:Number):void 
		{
			this.Divide(this.Length / length);
			
			this.length = length > 0 ? length : -length;
		}
		
		public function get Length():Number
		{
			if(this.changed)
			{
				this.length = Math.sqrt(this.LengthSquared);
				
				this.changed = false;
			}
			
			return this.length;
		}
		
		public function get LengthSquared():Number
		{
			return (this.X * this.X) + (this.Y * this.Y) + (this.Z * this.Z);
		}
		
		/*
		* Generate Methods
		*/
		
		public static function get Null():IVector { return new Vector3(); }
		
		public static function get Forward():IVector { return new Vector3(0, 0, -1); }
		public static function get Backward():IVector { return new Vector3(0, 0, 1); }
		
		public static function get Up():IVector { return new Vector3(0, 1, 0); }
		public static function get Down():IVector { return new Vector3(0, -1, 0); }
		
		public static function get Left():IVector { return new Vector3(-1, 0, 0); }
		public static function get Right():IVector { return new Vector3(1, 0, 0); }
		
		public static function get UnitX():IVector { return new Vector3(1, 0, 0); }
		public static function get UnitY():IVector { return new Vector3(0, 1, 0); }
		public static function get UnitZ():IVector { return new Vector3(0, 0, 1); }
		
		public static function get Zero():IVector { return new Vector3(0, 0, 0); }
		public static function get One():IVector { return new Vector3(1, 1, 1); }

		/*
		* Arithmetic Methods
		*/

		public function Add(v:IVector):IVector
		{
			this.X += v.X;
			this.Y += v.Y;
			this.Z += v.Z;
			
			return this;
		}
		
		public function Subtract(v:IVector):IVector
		{
			this.X -= v.X;
			this.Y -= v.Y;
			this.Z -= v.Z;
			
			return this;
		}
		
		public function Multiply(n:Number):IVector
		{
			this.X *= n;
			this.Y *= n;
			this.Z *= n;
			
			return this;
		}
		
		public function Divide(n:Number):IVector
		{
			// optimization
			var factor:Number = 1 / n;
			
			this.X *= factor;
			this.Y *= factor;
			this.Z *= factor;
		
			return this;
		}
		
		public function Negate():IVector
		{
			this.X = -this.X;
			this.Y = -this.Y;
			this.Z = -this.Z;
			
			return this;
		}
		
		public function Invert():IVector
		{
			this.X = this.Z;
			this.Z = this.X;
			
			return this;
		}
		
		public function Normalize():IVector
		{
			//this.Divide(this.Length);
			
			this.Length = 1;
			
			return this;
		}
		
		public function Dot(v:IVector):Number
		{
			return (this.X * v.X) + (this.Y * v.Y) + (this.Z * v.Z);
		}
		
		public function Cross(v2:IVector):IVector
		{
			var v1:IVector = this.Clone();
			
			this.X = (v1.Y * v2.Z) - (v1.Z * v2.Y);
			this.Y = (v1.Z * v2.X) - (v1.X * v2.Z);
			this.Z = (v1.X * v2.Y) - (v1.Y * v2.X);
			
			return this;
		}

		/*
		* Trigonometry Methods
		*/
		
		public function Angle(v:IVector):Number
		{
			return Math.acos(this.Dot(v) / (this.Length * v.Length));
		}
		
		public function Reflect(normal:IVector):IVector
		{
			var dot:Number = 2 * this.Dot(normal);
			
			this.X -= normal.X * dot;
			this.Y -= normal.Y * dot;
			this.Z -= normal.Z * dot;

			return this;
		}
		
		public function Transform(m:IMatrix):IVector
		{
			return this.TransformMatrix(m);
		}
		
		public function TransformMatrix(m:IMatrix):IVector
		{
			var v:IVector = this.Clone();

			this.X = (v.X * m[1][1]) + (v.Y * m[2][1]) + (v.Z * m[3][1]) + m[4][1];
			this.Y = (v.X * m[1][2]) + (v.Y * m[2][2]) + (v.Z * m[3][2]) + m[4][2];
			this.Z = (v.X * m[1][3]) + (v.Y * m[2][3]) + (v.Z * m[3][3]) + m[4][3];
			
			return this;
		}
		
		public function TransformQuaternion(q:IQuaternion):IVector
		{
			var v:IVector = this.Clone();
			
			throw new NotImplementedError();
			
			return this;
		}


		/*
		* Basic Methods
		*/
		
		public function Nullify():IVector
		{
			this.X = this.Y = this.Z = 0;
			
			return this;
		}
		
		public function Equals(v:IVector):Boolean
		{
			return (this.X == v.X) && (this.Y == v.Y) && (this.Z == v.Z);
		}
		
		public function Copy(v:IVector):IVector
		{
			this.X = v.X;
			this.Y = v.Y;
			this.Z = v.Z;
			
			return this;
		}
		
		public function Clone():IVector
		{
			return new Vector3(this.X, this.Y, this.Z);
		}
		
		public function toString():String
		{
			return "[Vector3 " + this.X + ", " + this.Y + ", " + this.Z + " Length: " + this.Length + "]";
		}
		
		/*
		* Static Methods
		*/
		
		public static function Lerp(v1:IVector, v2:IVector, n:Number):IVector
		{
			throw new NotImplementedError();
			
			var v:IVector = VectorHelper.Subtract(v2, v1);
			
			v.Multiply(n);
			v.Add(v1);
			
			return v;
		}

		public static function Bezier(v1:IVector, v2:IVector, v3:IVector, n:Number):IVector
		{
			throw new NotImplementedError();
			
			var v4:IVector = Vector3.Lerp(v1, v2, n);
			var v5:IVector = Vector3.Lerp(v2, v3, n);
			
			return Vector3.Lerp(v4, v5, n);
		}
		
		public static function CatmullRom(v1:IVector, v2:IVector, v3:IVector, v4:IVector, n:Number):IVector
		{
			throw new NotImplementedError();
			
			return Vector3.Zero;
		}
		
		public static function Barycentric(v1:IVector, v2:IVector, v3:IVector, n1:Number, n2:Number):IVector
		{
			throw new NotImplementedError();
			
			return Vector3.Zero;
		}
		
		// beta
		public static function Clamp(v:IVector, min:IVector, max:IVector):IVector
		{
			return Vector3.Zero;
		}
		
		public static function Transform(v:IVector, m:IMatrix):IVector
		{
			throw new NotImplementedError();
			
			return Vector3.Zero;
		}
		
		public static function TransformQuaternion(v:IVector, q:IQuaternion):IVector
		{
			throw new NotImplementedError();
			
			return Vector3.Zero;
		}
		
		public static function Max(v1:IVector, v2:IVector):IVector
		{
			return new Vector3(Math.max(v1.X, v2.X), Math.max(v1.Y, v2.Y), Math.max(v1.Z, v2.Z));
		}
		
		public static function Min(v1:IVector, v2:IVector):IVector
		{
			return new Vector3(Math.min(v1.X, v2.X), Math.min(v1.Y, v2.Y), Math.min(v1.Z, v2.Z));
		}
		
		public static function Angle(v1:IVector, v2:IVector):Number
		{
			return Math.acos(VectorHelper.Dot(v1, v2) / (v1.Length * v2.Length));
		}
		
		public static function Reflect(v:IVector, normal:IVector):IVector
		{
			var dot:Number = 2 * VectorHelper.Dot(v, normal);
			
			return new Vector3(v.X - (normal.X * dot), v.Y - (normal.Y * dot), v.Z - (normal.Z * dot));
		}
	}
}