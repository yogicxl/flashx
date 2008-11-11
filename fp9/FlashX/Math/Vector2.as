// dot product
// cross product
// multiple
// add
// subtract

package FlashX.Math
{
	import FlashX.Core.Errors.*;
	
	public class Vector2 implements IVector
	{
		private var x:Number;
		private var y:Number;

		private var length:Number;
		private var changed:Boolean;
		
		public function Vector2(x:Number = 0, y:Number = 0)
		{
			this.length = 0;
			this.changed = false;
			
			this.X = x;
			this.Y = y;
		}
		
		/*
		* Properties
		*/
		
		public function set X(x:Number):void 
		{
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
			if(this.y != y)
				this.changed = true;
			
			this.y = y;
		}
		
		public function get Y():Number
		{
			return this.y;
		}
		
		public function set Z(z:Number):void  { }
		
		public function get Z():Number { return 0; }
		
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
		
		public function Cross(v1:IVector):IVector
		{
			var v2:IVector = this.Clone();

			v2.X = this.Y;
			v2.Y = -this.X;
			
			this.Copy(v2);
			
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
			return (this.X * v.X) + (this.Y * v.Y);
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
		
		public function Transform(m:IMatrix):IVector
		{
			return this.TransformMatrix(m);
		}
		
		public function TransformMatrix(m:IMatrix):IVector
		{
			var v:IVector = this.Clone();

			throw new NotImplementedError();
			
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
			return "[Vector2 " + this.X + ", " + this.Y + " Length: " + this.Length + "]";
		}
	}
}