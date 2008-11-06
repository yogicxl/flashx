// dot product
// cross product
// multiple
// add
// subtract


package FlashX.Mathematics
{
	public class Vector3 extends Object implements Vector
	{
		private var x:int;
		private var y:int;
		private var z:int;
		
		private var length:Number;
		private var changed:Boolean;
		
		/*
		* Constructors
		*/
		
		public function Vector3(x:int = 0, y:int = 0, z:int = 0)
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
		
		public function set X(x:int):void 
		{
			if(this.x != x)
				this.changed = true;
			
			this.x = x;
		}
		
		public function get X():int
		{
			return this.x;
		}
		
		public function set Y(y:int):void 
		{
			if(this.y != y)
				this.changed = true;
			
			this.y = y;
		}
		
		public function get Y():int
		{
			return this.y;
		}
		
		public function set Z(z:int):void 
		{
			if(this.z != z)
				this.changed = true;
			
			this.z = z;
		}
		
		public function get Z():int
		{
			return this.z;
		}
		
		public function set Length(length:Number):void 
		{
			this.Divide(this.Length / length);
			
			this.length = length < 0 ? -length : length;
		}
		
		public function get Length():Number
		{
			if(this.changed)
			{
				this.length = Math.sqrt((this.X * this.X) + (this.Y * this.Y) + (this.Z * this.Z));
				
				this.changed = false;
			}
			
			return this.length;
		}
		
		public function get LengthSquared():Number
		{
			return (this.X * this.X) + (this.Y * this.Y) + (this.Z * this.Z);
		}
		
		
		/*
		* Premade Vectors
		*/
		
		static public function get Forward():Vector { return new Vector3(0, 0, 1); }
		static public function get Backward():Vector { return new Vector3(0, 0, -1); }
		
		static public function get Up():Vector { return new Vector3(0, 1, 0); }
		static public function get Down():Vector { return new Vector3(0, -1, 0); }
		
		static public function get Left():Vector { return new Vector3(-1, 0, 0); }
		static public function get Right():Vector { return new Vector3(1, 0, 0); }
		
		static public function get UnitX():Vector { return new Vector3(1, 0, 0); }
		static public function get UnitY():Vector { return new Vector3(0, 1, 0); }
		static public function get UnitZ():Vector { return new Vector3(0, 0, 1); }
		
		static public function get Zero():Vector { return new Vector3(0, 0, 0); }
		static public function get One():Vector { return new Vector3(1, 1, 1); }

		/*
		* Arithmetic Methods
		*/

		public function Add(v:Vector):Vector
		{
			this.X += v.X;
			this.Y += v.Y;
			this.Z += v.Z;
			
			return this;
		}
		
		static public function Add(v1:Vector, v2:Vector):Vector
		{
			return new Vector3(v1.X + v2.X, v1.Y + v2.Y, v1.Z + v2.Z);
		}
		
		public function Subtract(v:Vector):Vector
		{
			this.X -= v.X;
			this.Y -= v.Y;
			this.Z -= v.Z;
			
			return this;
		}
		
		static public function Subtract(v1:Vector, v2:Vector):Vector
		{
			return new Vector3(v1.X - v2.X, v1.Y - v2.Y, v1.Z - v2.Z);
		}
		
		public function Multiply(n:Number):Vector
		{
			this.X *= n;
			this.Y *= n;
			this.Z *= n;
			
			return this;
		}
		
		static public function Multiply(v:Vector, n:Number):Vector
		{
			return new Vector3(v.X * n, v.Y * n, v.Z * n);
		}
		
		public function Divide(n:Number):Vector
		{
			this.X /= n;
			this.Y /= n;
			this.Z /= n;
			
			return this;
		}
		
		static public function Divide(v:Vector, n:Number):Vector
		{
			return new Vector3(v.X / n, v.Y / n, v.Z / n);
		}
		
		public function Normalize():Vector
		{
			this.Divide(this.Length);
			
			this.Length = 1;
			
			return this;
		}

		static public function Normalize(v:Vector):Vector
		{
			return new Vector3(v.X / v.Length, v.Y / v.Length, v.Z / v.Length);
		}
		
		public function Invert():Vector
		{
			this.X *= -1;
			this.Y *= -1;
			this.Z *= -1;
			
			return this;
		}
		
		static public function Invert(v:Vector):Vector
		{
			return new Vector3(-v.X, -v.Y, -v.Z);
		}
		
		public function Dot(v:Vector):Number
		{
			return (this.X * v.X) + (this.Y * v.Y) + (this.Z * v.Z);
		}
		
		static function Dot(v1:Vector, v2:Vector):Number
		{
			return (v1.X * v2.X) + (v1.Y * v2.Y) + (v1.Z * v2.Z);
		}
		
		public function Cross(v:Vector):Vector
		{
			this.X = (this.Y * v.Z) - (this.Z * v.Y);
			this.Y = (this.Z * v.X) - (this.X * v.Z);
			this.Z = (this.X * v.Y) - (this.Y * v.X);
			
			return this;
		}
		
		static public function Cross(v1:Vector, v2:Vector):Vector
		{
			return new Vector3((v1.Y * v2.Z) - (v1.Z * v2.Y), (v1.Z * v2.X) - (v1.X * v2.Z), (v1.X * v2.Y) - (v1.Y * v2.X));
		}
		
		static public function Lerp(v1:Vector, v2:Vector, n:Number):Vector
		{
			var v:Vector = Vector3.Subtract(v2, v1);
			
			v.Multiply(n);
			v.Add(v1);
			
			return v;
		}

		// beta
		public static function Bezier(v1:Vector, v2:Vector, v3:Vector, n:Number):Vector
		{
			var v4:Vector = Vector3.Lerp(v1, v2, n);
			var v5:Vector = Vector3.Lerp(v2, v3, n);
			
			return Vector3.Lerp(v4, v5, n);
		}
		
		// beta
		public static function CatmullRom(v1:Vector, v2:Vector, v3:Vector, v4:Vector, n:Number):Vector
		{
			return Vector3.Zero;
		}
		
		// beta
		public static function Barycentric(v1:Vector, v2:Vector, v3:Vector, n1:Number, n2:Number):Vector
		{
			return Vector3.Zero;
		}
		
		// beta
		public static function Clamp(v:Vector, min:Vector, max:Vector):Vector
		{
			return Vector3.Zero;
		}
		
		// beta
		public static function Transform(v:Vector, m:Matrix):Vector
		{
			return Vector3.Zero;
		}
		
		// beta
		public static function TransformQuaternion(v:Vector, q:Quaternion):Vector
		{
			return Vector3.Zero;
		}
		
		static public function Distance(v1:Vector, v2:Vector):Number
		{
			var v:Vector = Vector3.Subtract(v1, v2);
			
			return v.Length;
		}
		
		static public function DistanceSquared(v1:Vector, v2:Vector):Number
		{
			var v:Vector = Vector3.Subtract(v1, v2);
			
			return v.LengthSquared;
		}
		
		static public function Max(v1:Vector, v2:Vector):Vector
		{
			return new Vector3(Math.max(v1.X, v2.X), Math.max(v1.Y, v2.Y), Math.max(v1.Z, v2.Z));
		}
		
		static public function Min(v1:Vector, v2:Vector):Vector
		{
			return new Vector3(Math.min(v1.X, v2.X), Math.min(v1.Y, v2.Y), Math.min(v1.Z, v2.Z));
		}
		
		/*
		* Trigonometry Methods
		*/
		
		public function Angle(v:Vector):Number
		{
			return Math.acos(this.Dot(v) / (this.Length * v.Length));
		}
		
		static public function Angle(v1:Vector, v2:Vector):Number
		{
			return Math.acos(Vector3.Dot(v1, v2) / (v1.Length * v2.Length));
		}
		
		public function Reflect(normal:Vector):Vector
		{
			var dot:Number = 2 * this.Dot(normal);
			
			this.X -= normal.X * dot;
			this.Y -= normal.Y * dot;
			this.Z -= normal.Z * dot;

			return this;
		}
		
		static public function Reflect(v:Vector, normal:Vector):Vector
		{
			var dot:Number = 2 * Vector3.Dot(v, normal);
			
			return new Vector3(v.X - (normal.X * dot), v.Y - (normal.Y * dot), v.Z - (normal.Z * dot));
		}
		
		/*
		* Basic Methods
		*/
		
		public function Null():Vector
		{
			this.X = this.Y = this.Z = 0;
			
			return this;
		}
		
		static public function Null():Vector
		{
			return new Vector3();
		}
		
		public function Equals(v:Vector):Boolean
		{
			if((v.X == this.X) && (v.Y == this.Y) && (v.Z == this.Z))
				return true;
			else
				return false;
		}
		
		static public function Equals(v1:Vector, v2:Vector):Boolean
		{
			if((v1.X == v2.X) && (v1.Y == v2.Y) && (v1.Z == v2.Z))
				return true;
			else
				return false;
		}

		public function Copy(v:Vector):Vector
		{
			this.X = v.X;
			this.Y = v.Y;
			this.Z = v.Z;
			
			return this;
		}
		
		public function Clone():Vector
		{
			return new Vector3(this.X, this.Y, this.Z);
		}
		
		public function toString():String
		{
			var x:Number = Math.round(this.X * 1000) / 1000;
			var y:Number = Math.round(this.Y * 1000) / 1000;
			var z:Number = Math.round(this.Z * 1000) / 1000;
			
			return "[Vector3 " + x + ", " + y + ", " + z + " Length: " + this.Length + "]";
		}
	}
}