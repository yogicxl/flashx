// dot product
// cross product
// multiple
// add
// subtract

package FlashX.Math
{
	public class Vector2 implements IVector
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
		
		static public function get Up():IVector { return new Vector2(0, 1); }
		static public function get Down():IVector { return new Vector2(0, -1); }
		
		static public function get Left():IVector { return new Vector2(-1, 0); }
		static public function get Right():IVector { return new Vector2(1, 0); }
		
		static public function get UnitX():IVector { return new Vector2(1, 0); }
		static public function get UnitY():IVector { return new Vector2(0, 1); }

		static public function get Zero():IVector { return new Vector2(0, 0); }
		static public function get One():IVector { return new Vector2(1, 1); }
		
		/*
		* Arithmetic Methods
		*/

		public function Add(v:IVector):IVector
		{
			this.X += v.X;
			this.Y += v.Y;
			
			return this;
		}
		
		static public function Add(v1:IVector, v2:IVector):IVector
		{
			return new Vector2(v1.X + v2.X, v1.Y + v2.Y);
		}
		
		public function Subtract(v:IVector):IVector
		{
			this.X -= v.X;
			this.Y -= v.Y;
			
			return this;
		}
		
		static public function Subtract(v1:IVector, v2:IVector):IVector
		{
			return new Vector2(v1.X - v2.X, v1.Y - v2.Y);
		}
		
		public function Multiply(n:Number):IVector
		{
			this.X *= n;
			this.Y *= n;
			
			return this;
		}
		
		static public function Multiply(v:IVector, n:Number):IVector
		{
			return new Vector2(v.X * n, v.Y * n);
		}
		
		public function Divide(n:Number):IVector
		{
			this.X /= n;
			this.Y /= n;
			
			return this;
		}
		
		static public function Divide(v:IVector, n:Number):IVector
		{
			return new Vector2(v.X / n, v.Y / n);
		}
		
		public function Normalize():IVector
		{
			this.Divide(this.Length);
			
			this.Length = 1;
			
			return this;
		}

		static public function Normalize(v:IVector):IVector
		{
			return new Vector2(v.X / v.Length, v.Y / v.Length);
		}
		
		public function Invert():IVector
		{
			this.X *= -1;
			this.Y *= -1;
			
			return this;
		}
		
		static public function Invert(v:IVector):IVector
		{
			return new Vector2(-v.X, -v.Y);
		}
		
		public function Dot(v:IVector):Number
		{
			return (this.X * v.X) + (this.Y * v.Y);
		}
		
		static function Dot(v1:IVector, v2:IVector):Number
		{
			return (v1.X * v2.X) + (v1.Y * v2.Y);
		}
		
		public function Cross(v:IVector):IVector
		{
			this.X = (this.Y * v.Z) - (this.Z * v.Y);
			this.Y = (this.Z * v.X) - (this.X * v.Z);
			
			return this;
		}

		static public function Cross(v1:IVector, v2:IVector):IVector
		{
			return new Vector2((v1.Y * v2.Z) - (v1.Z * v2.Y));
		}
		
		static public function Lerp(v1:IVector, v2:IVector, lerp:Number):IVector
		{
			var v:IVector2 = Vector2.Subtract(v2, v1);
			
			v.Multiply(lerp);
			v.Add(v1);
			
			return v;
		}
		
		static public function Distance(v1:IVector, v2:IVector):Number
		{
			var v:IVector = Vector2.Subtract(v1, v2);
			
			return v.Length;
		}
		
		static public function DistanceSquared(v1:IVector, v2:IVector):Number
		{
			var v:IVector = Vector3.Subtract(v1, v2);
			
			return v.LengthSquared;
		}
		
		static public function Max(v1:IVector, v2:IVector):IVector
		{
			return new Vector2(Math.max(v1.X, v2.X), Math.max(v1.Y, v2.Y));
		}
		
		static public function Min(v1:IVector, v2:IVector):IVector
		{
			return new Vector2(Math.min(v1.X, v2.X), Math.min(v1.Y, v2.Y));
		}
		
		/*
		* Trigonometry Methods
		*/
		
		public function Angle(v:IVector):Number
		{
			return Math.acos(this.Dot(v) / (this.Length * v.Length));
		}
		
		static public function Angle(v1:IVector, v2:IVector):Number
		{
			return Math.acos(Vector2.Dot(v1, v2) / (v1.Length * v2.Length));
		}
		
		public function Reflect(normal:IVector):IVector
		{
			var dot:Number = 2 * this.Dot(normal);
			
			this.X -= normal.X * dot;
			this.Y -= normal.Y * dot;

			return this;
		}
		
		static public function Reflect(v:IVector, normal:IVector):IVector
		{
			var dot:Number = 2 * Vector2.Dot(v, normal);
			
			return new Vector2(v.X - (normal.X * dot), v.Y - (normal.Y * dot));
		}
		
		/*
		* Basic Methods
		*/
		
		public function Null():IVector
		{
			this.X = this.Y = 0;
			
			return this;
		}
		
		static public function Null():IVector
		{
			return new Vector2();
		}
		
		public function Equals(v:IVector):Boolean
		{
			return (this.X == v.X) && (this.Y == v.Y);
		}
		
		static public function Equals(v1:IVector, v2:IVector):Boolean
		{
			return (v1.X == v2.X) && (v1.Y == v2.Y);
		}

		public function Copy(v:IVector):IVector
		{
			this.X = v.X;
			this.Y = v.Y;
			
			return this;
		}
		
		public function Clone():IVector
		{
			return new Vector2(this.X, this.Y);
		}
		
		public function toString():String
		{
			var x:Number = Math.round(this.X * 1000) / 1000;
			var y:Number = Math.round(this.Y * 1000) / 1000;
			
			return "[Vector2 " + x + ", " + y + " Length: " + this.Length + "]";
		}
}