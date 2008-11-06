package FlashX.Math
{
	public class Quaternion3 implements IQuaternion
	{
		private var x:int;
		private var y:int;
		private var z:int;
		private var w:int;
		
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
		
		/*
		* Static Methods
		*/
		
		static public function get Identity():IQuaternion { return new Quaternion3(); }
		
		public static function Add(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			return new Quaternion3(q1.X + q2.X, q1.Y + q2.Y, q1.Z + q2.Z, q1.W + q2.W);      
		}
		
		public static function Subtract(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			return new Quaternion3(q1.X - q2.X, q1.Y - q2.Y, q1.Z - q2.Z, q1.W - q2.W);      
		}
		
		public static function Multiply(q1:IQuaternion, q2:IQuaternion):IQuaternion
		{
			var q:IQuaternion = new Quaternion3();
			
			q.X = (q1.W * q2.X) + (q1.X * q2.W) + (q1.Y * q2.Z) - (q1.Z * q2.Y);
			q.Y = (q1.W * q2.Y) - (q1.X * q2.Z) + (q1.Y * q2.W) + (q1.Z * q2.X);
			q.Z = (q1.W * q2.Z) + (q1.X * q2.Y) - (q1.Y * q2.X) + (q1.Z * q2.W);
			q.W = (q1.W * q2.W) - (q1.X * q2.X) - (q1.Y * q2.Y) - (q1.Z * q2.Z);
			
			return q;
		}
		
		public function Multiply(q:IQuaternion):void
		{
			this.MultiplyQuaternion(q);
		}
		
		public function MultiplyQuaternion(q1:IQuaternion):void
		{
			var q2:IQuaternion = this.Clone();
			
			this.X = (q1.W * q2.X) + (q1.X * q2.W) + (q1.Y * q2.Z) - (q1.Z * q2.Y);
			this.Y = (q1.W * q2.Y) - (q1.X * q2.Z) + (q1.Y * q2.W) + (q1.Z * q2.X);
			this.Z = (q1.W * q2.Z) + (q1.X * q2.Y) - (q1.Y * q2.X) + (q1.Z * q2.W);
			this.W = (q1.W * q2.W) - (q1.X * q2.X) - (q1.Y * q2.Y) - (q1.Z * q2.Z);
		}

		public function MultiplyVector(q:IQuaternion, v:IVector):void
		{
			
		}
		
		public static function Dot(q1:IQuaternion, q2:IQuaternion):Number
		{
			return (q1.X * q2.X) + (q1.Y * q2.Y) + (q1.Z * q2.Z) + (q1.W * q2.W);
		}
		

		/*
		* Basic Methods
		*/
		
		public function Null():IQuaternion
		{
			this.X = this.Y = this.Z = 0;
			this.W = 1;
			
			return this;
		}
		
		static public function Null():IQuaternion
		{
			return new Quaternion3();
		}
		
		public function Equals(q:IQuaternion):Boolean
		{
			return (this.X == q.X) && (this.Y == q.Y) && (this.Y == q.Y) && (this.W == q.W);
		}
		
		static public function Equals(q1:IQuaternion, q2:IQuaternion):Boolean
		{
			return (q1.X == q2.X) && (q1.Y == q2.Y) && (q1.Y == q2.Y) && (q1.W == q2.W);
		}

		public function Copy(q:IQuaternion):IQuaternion
		{
			this.X = q.X;
			this.Y = q.Y;
			this.Z = q.Z;
			this.W = q.W;
			
			return this;
		}
		
		public function Clone():IQuaternion
		{
			return new Quaternion3(this.X, this.Y, this.Z, this.W);
		}
		
		public function toString():String
		{
			var x:Number = Math.round(this.X * 1000) / 1000;
			var y:Number = Math.round(this.Y * 1000) / 1000;
			var z:Number = Math.round(this.Z * 1000) / 1000;
			var w:Number = Math.round(this.W * 1000) / 1000;
			
			return "[Quaternion3 " + x + ", " + y + ", " + z + " w: " + w + "]";
		}
	}
}