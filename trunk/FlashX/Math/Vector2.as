// dot product
// cross product
// multiple
// add
// subtract

package FlashX.Math
{
	public class Vector2 extends Object implements Vector
	{
		private var x:int;
		private var y:int;

		private var length:Number;
		private var changed:Boolean;
		
		public function Vector2(x:int = 0, y:int = 0)
		{
			this.length = 0;
			this.changed = false;
			
			this.X = x;
			this.Y = y;
		}
		
		/*
		* Properties
		*/
		
		public override function set X(x:int):void 
		{
			if(this.x != x)
				this.changed = true;
			
			this.x = x;
		}
		
		public override function get X():int
		{
			return this.x;
		}
		
		public override function set Y(y:int):void 
		{
			if(this.y != y)
				this.changed = true;
			
			this.y = y;
		}
		
		public override function get Y():int
		{
			return this.y;
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
				this.length = Math.sqrt((this.X * this.X) + (this.Y * this.Y));
				
				this.changed = false;
			}
			
			return this.length;
		}
		
		public function get LengthSquared():Number
		{
			return (this.X * this.X) + (this.Y * this.Y);
		}
		
		/*
		* Premade Vectors
		*/
		
		static public function get Up():Vector { return new Vector2(0, 1); }
		static public function get Down():Vector { return new Vector2(0, -1); }
		
		static public function get Left():Vector { return new Vector2(-1, 0); }
		static public function get Right():Vector { return new Vector2(1, 0); }
		
		static public function get UnitX():Vector { return new Vector2(1, 0); }
		static public function get UnitY():Vector { return new Vector2(0, 1); }

		static public function get Zero():Vector { return new Vector2(0, 0); }
		static public function get One():Vector { return new Vector2(1, 1); }
		
		/*
		* Arithmetic Methods
		*/

		public function Add(v:Vector):Vector
		{
			this.X += v.X;
			this.Y += v.Y;
			
			return this;
		}
		
		static public function Add(v1:Vector, v2:Vector):Vector
		{
			return new Vector2(v1.X + v2.X, v1.Y + v2.Y);
		}
		
		public function Subtract(v:Vector):Vector
		{
			this.X -= v.X;
			this.Y -= v.Y;
			
			return this;
		}
		
		static public function Subtract(v1:Vector, v2:Vector):Vector
		{
			return new Vector2(v1.X - v2.X, v1.Y - v2.Y);
		}
		
		public function Multiply(n:Number):Vector
		{
			this.X *= n;
			this.Y *= n;
			
			return this;
		}
		
		static public function Multiply(v:Vector, n:Number):Vector
		{
			return new Vector2(v.X * n, v.Y * n);
		}
		
		public function Divide(n:Number):Vector
		{
			this.X /= n;
			this.Y /= n;
			
			return this;
		}
		
		static public function Divide(v:Vector, n:Number):Vector
		{
			return new Vector2(v.X / n, v.Y / n);
		}
		
		public function Normalize():Vector
		{
			this.Divide(this.Length);
			
			this.Length = 1;
			
			return this;
		}

		static public function Normalize(v:Vector):Vector
		{
			return new Vector2(v.X / v.Length, v.Y / v.Length);
		}
		
		public function Invert():Vector
		{
			this.X *= -1;
			this.Y *= -1;
			
			return this;
		}
		
		static public function Invert(v:Vector):Vector
		{
			return new Vector2(-v.X, -v.Y);
		}
		
		public function Dot(v:Vector):Number
		{
			return (this.X * v.X) + (this.Y * v.Y);
		}
		
		static function Dot(v1:Vector, v2:Vector):Number
		{
			return (v1.X * v2.X) + (v1.Y * v2.Y);
		}
		
		public function Cross(v:Vector):Vector
		{
			this.X = (this.Y * v.Z) - (this.Z * v.Y);
			this.Y = (this.Z * v.X) - (this.X * v.Z);
			
			return this;
		}

		static public function Cross(v1:Vector, v2:Vector):Vector
		{
			return new Vector2((v1.Y * v2.Z) - (v1.Z * v2.Y));
		}
		
		static public function Lerp(v1:Vector, v2:Vector, lerp:Number):Vector
		{
			var v:Vector2 = Vector2.Subtract(v2, v1);
			
			v.Multiply(lerp);
			v.Add(v1);
			
			return v;
		}
		
		static public function Distance(v1:Vector, v2:Vector):Number
		{
			var v:Vector = Vector2.Subtract(v1, v2);
			
			return v.Length;
		}
		
		static public function DistanceSquared(v1:Vector, v2:Vector):Number
		{
			var v:Vector = Vector3.Subtract(v1, v2);
			
			return v.LengthSquared;
		}
		
		static public function Max(v1:Vector, v2:Vector):Vector
		{
			return new Vector2(Math.max(v1.X, v2.X), Math.max(v1.Y, v2.Y));
		}
		
		static public function Min(v1:Vector, v2:Vector):Vector
		{
			return new Vector2(Math.min(v1.X, v2.X), Math.min(v1.Y, v2.Y));
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
			return Math.acos(Vector2.Dot(v1, v2) / (v1.Length * v2.Length));
		}
		
		public function Reflect(normal:Vector):Vector
		{
			var dot:Number = 2 * this.Dot(normal);
			
			this.X -= normal.X * dot;
			this.Y -= normal.Y * dot;

			return this;
		}
		
		static public function Reflect(v:Vector, normal:Vector):Vector
		{
			var dot:Number = 2 * Vector2.Dot(v, normal);
			
			return new Vector2(v.X - (normal.X * dot), v.Y - (normal.Y * dot));
		}
		
		/*
		* Basic Methods
		*/
		
		public function Null():Vector
		{
			this.X = this.Y = 0;
			
			return this;
		}
		
		static public function Null():Vector
		{
			return new Vector2();
		}
		
		public function Equals(v:Vector):Boolean
		{
			if((v.X == this.X) && (v.Y == this.Y))
				return true;
			else
				return false;
		}
		
		static public function Equals(v1:Vector, v2:Vector):Boolean
		{
			if((v1.X == v2.X) && (v1.Y == v2.Y))
				return true;
			else
				return false;
		}

		public function Copy(v:Vector):Vector
		{
			this.X = v.X;
			this.Y = v.Y;
			
			return this;
		}
		
		public function Clone():Vector
		{
			return new Vector2(this.X, this.Y);
		}
		
		public override function toString():String
		{
			var x:Number = Math.round(this.X * 1000) / 1000;
			var y:Number = Math.round(this.Y * 1000) / 1000;
			
			return "[Vector2 " + x + ", " + y + " Length: " + this.Length + "]";
		}
}