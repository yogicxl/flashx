// dot product
// cross product
// multiple
// add
// subtract

package FlashX.Math
{
	public class Vector2 extends BasicVector
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
				this.length = Math.sqrt(this.LengthSquared);
				
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
		
		public static function get Null():IVector { return new Vector2(); }
		
		public static function get Up():IVector { return new Vector2(0, 1); }
		public static function get Down():IVector { return new Vector2(0, -1); }
		
		public static function get Left():IVector { return new Vector2(-1, 0); }
		public static function get Right():IVector { return new Vector2(1, 0); }
		
		public static function get UnitX():IVector { return new Vector2(1, 0); }
		public static function get UnitY():IVector { return new Vector2(0, 1); }

		public static function get Zero():IVector { return new Vector2(0, 0); }
		public static function get One():IVector { return new Vector2(1, 1); }
		
		/*
		* Arithmetic Methods
		*/

		public function Add(v:IVector):IVector
		{
			this.X += v.X;
			this.Y += v.Y;
			
			return this;
		}
		
		public function Subtract(v:IVector):IVector
		{
			this.X -= v.X;
			this.Y -= v.Y;
			
			return this;
		}
		
		public function Multiply(n:Number):IVector
		{
			this.X *= n;
			this.Y *= n;
			
			return this;
		}
		
		public function Divide(n:Number):IVector
		{
			this.X /= n;
			this.Y /= n;
			
			return this;
		}
		
		public function Negate():IVector
		{
			this.X = -this.X;
			this.Y = -this.Y;
			
			return this;
		}
		
		public function Invert():IVector
		{
			this.X = this.Y;
			this.Y = this.X;
			
			return this;
		}
		
		public function Normalize():IVector
		{
			this.Divide(this.Length);
			
			this.Length = 1;
			
			return this;
		}
		
		public function Dot(v:IVector):Number
		{
			return (this.X * v.X) + (this.Y * v.Y);
		}
		
		public function Cross(v:IVector):IVector
		{
			this.X = (this.Y * v.Z) - (this.Z * v.Y);
			this.Y = (this.Z * v.X) - (this.X * v.Z);
			
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

			return this;
		}
		
		/*
		* Basic Methods
		*/
		
		public function Nullify():IVector
		{
			this.X = this.Y = 0;
			
			return this;
		}
		
		public function Equals(v:IVector):Boolean
		{
			return (this.X == v.X) && (this.Y == v.Y);
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