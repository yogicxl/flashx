package FlashX.Math
{
	public interface Quaternion2
	{
		private var x:int;
		private var y:int;
		private var w:int;
		
		/*
		* Constructor
		*/
		
		public function Quaternion2(x:int = 0, y:int = 0, w:int = 1)
		{
			this.X = x;
			this.Y = y;
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
		* Basic Methods
		*/
		
		public function toString():String
		{
			var x:Number = Math.round(this.X * 1000) / 1000;
			var y:Number = Math.round(this.Y * 1000) / 1000;
			var w:Number = Math.round(this.W * 1000) / 1000;
			
			return "[Quaternion2 " + x + ", " + y + ", " + z + "]";
		}
	}
}