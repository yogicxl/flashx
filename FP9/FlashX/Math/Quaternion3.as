package FlashX.Math
{
	import FlashX.Core.Errors.*;
	
	public class Quaternion3 implements IQuaternion
	{
		private var x:Number;
		private var y:Number;
		private var z:Number;
		private var w:Number;
		
		private var length:Number;
		private var changed:Boolean;
		
		/*
		* Constructor
		*/
		
		public function Quaternion3(x:int = 0, y:int = 0, z:int = 0, w:int = 1)
		{
			this.X = x;
			this.Y = y;
			this.Z = z;
			this.W = w;
		}
		
		/*
		* Properties
		*/
		
		public function set X(x:int):void 
		{
			this.x = x;
		}
		
		public function get X():int
		{
			return this.x;
		}
		
		public function set Y(y:int):void 
		{
			this.y = y;
		}
		
		public function get Y():int
		{
			return this.y;
		}
		
		public function set Z(z:int):void 
		{
			this.z = z;
		}
		
		public function get Z():int
		{
			return this.z;
		}
		
		public function set W(w:int):void 
		{
			this.w = w;
		}
		
		public function get W():int
		{
			return this.w;
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
			return (this.X * this.X) + (this.Y * this.Y) + (this.Z * this.Z) + (this.W * this.W);
		}
		
		/*
		* Generate Methods
		*/
		
		public static function get Identity():IQuaternion { return new Quaternion3(); }
		
		public static function get Null():IQuaternion { return new Quaternion3(); }
		
		/*
		* Arithmetic Methods
		*/
		
		public function Add(q:IQuaternion):IQuaternion
		{
			this.X += q.X;
			this.Y += q.Y;
			this.Z += q.Z;
			this.W += q.W;
			
			return this;     
		}
		
		public function Subtract(q:IQuaternion):IQuaternion
		{
			this.X -= q.X;
			this.Y -= q.Y;
			this.Z -= q.Z;
			this.W -= q.W;
			
			return this;      
		}
		
		public function Multiply(q:IQuaternion):IQuaternion
		{
			return this.MultiplyQuaternion(q);
		}
		
		
		public function MultiplyQuaternion(q1:IQuaternion):IQuaternion
		{
			var q2:IQuaternion = this.Clone();
			
			this.X = (q1.W * q2.X) + (q1.X * q2.W) + (q1.Y * q2.Z) - (q1.Z * q2.Y);
			this.Y = (q1.W * q2.Y) - (q1.X * q2.Z) + (q1.Y * q2.W) + (q1.Z * q2.X);
			this.Z = (q1.W * q2.Z) + (q1.X * q2.Y) - (q1.Y * q2.X) + (q1.Z * q2.W);
			this.W = (q1.W * q2.W) - (q1.X * q2.X) - (q1.Y * q2.Y) - (q1.Z * q2.Z);
			
			return this;
		}
		
		public function MultiplyVector(v:IVector):IQuaternion
		{
			return this;
		}
		
		public function Dot(q:IQuaternion):Number
		{
			return (this.X * q.X) + (this.Y * q.Y) + (this.Z * q.Z) + (this.W * q.W);
		}
		
		/*
		* Trigonometry Methods
		*/
		
		/*
		* Basic Methods
		*/
		
		public function Copy(q:IQuaternion):IQuaternion
		{
			this.X = q.X;
			this.Y = q.Y;
			this.Z = q.Z;
			this.W = q.W;
			
			return this;
		}
		
		public function Null():IQuaternion
		{
			this.X = this.Y = this.Z = 0;
			this.W = 1;
			
			return this;
		}
	
		public function Equals(q:IQuaternion):Boolean
		{
			return (this.X == q.X) && (this.Y == q.Y) && (this.Y == q.Y) && (this.W == q.W);
		}
		
		public function Clone():IQuaternion
		{
			return new Quaternion3(this.X, this.Y, this.Z, this.W);
		}
		
		public function toString():String
		{
			return "[Quaternion3 " + this.X + ", " + this.Y + ", " + this.Z + " W: " + this.W + "]";
		}
		
		/*
		* Static Methods
		*/
		
		public static function Add(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			return q1.Clone().Add(q2);
		}
		
		public static function Subtract(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			return q1.Clone().Subtract(q2);
		}
		
		public static function Multiply(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			return q1.MultiplyQuaternion(q2);
		}
		
		public static function MultiplyQuaternion(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			var q:IQuaternion = q1.Clone();
			
			return q.MultiplyQuaternion(q2);
		}
		
		public static function MultiplyVector(q:IQuaternion, v:IVector):IQuaternion
		{
			return q.Clone().MultiplyVector(v);
		}
		
		public static function Dot(q1:IQuaternion, q2:IQuaternion):Number
		{
			return q1.Dot(q2);
		}
		
		public static function Copy(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			return q1.Copy(q2);
		}
		
		public static function Equals(q1:IQuaternion, q2:IQuaternion):Boolean
		{
			return q1.Equals(q2);
		}
	}
}