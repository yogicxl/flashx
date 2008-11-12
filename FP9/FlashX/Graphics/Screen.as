package FlashX.Graphics
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Core.Errors.*;
	
	public class Screen
	{
		private var x:int;
		private var y:int;
		
		private var width:int;
		private var height:int;
		
		private var minDepth:Number;
		private var maxDepth:Number;

		/*
		* Constructor
		*/
		
		public function Screen(x:int = 0, y:int = 0, width:int = 0, height:int = 0, minDepth:Number = 0, maxDepth:Number = 1)
		{
			this.X = x;
			this.Y = y;
			
			this.Width = width;
			this.Height = height;
			
			this.MinDepth = minDepth;
			this.MaxDepth = maxDepth;
		}
		
		/*
		* Properties
		*/
		
		public function get AspectRatio():Number
		{
			return this.Height ? this.Width / this.Height : 0;
		}
		
        public function get X():int
		{
			return this.x;
		}
		
        public function set X(x:int):void
		{
			this.x = x;
		}
		
        public function get Y():int
		{
			return this.y;
		}
		
        public function set Y(y:int):void
		{
			this.y = y;
		}

        public function get Width():int
		{
			return this.width;
		}
		
        public function set Width(width:int):void
		{
			this.width = width;
		}
		
        public function get Height():int
		{
			return this.height;
		}
		
        public function set Height(height:int):void
		{
			this.height = height;
		}
		
        public function get MinDepth():Number
		{
			return this.minDepth;
		}
		
        public function set MinDepth(minDepth:Number):void
		{
			this.minDepth = minDepth;
		}
		
        public function get MaxDepth():Number
		{
			return this.maxDepth;
		}
		
        public function set MaxDepth(maxDepth:Number):void
		{
			this.maxDepth = maxDepth;
		}
		
        public function get Top():int
		{
			return this.x;
		}
		
        public function get Left():int
		{
			return this.y;
		}
		
        public function get Bottom():int
		{
			return this.x + this.height;
		}
		
        public function get Right():int
		{
			return this.y + this.width;
		}
		
		public function Project(source:IVector, projection:IMatrix, view:IMatrix, world:IMatrix):IVector
		{
			var m:IMatrix = MatrixHelper.Multiply(world, view, projection);
			
			var v:IVector = VectorHelper.Transform(source, m);
			
			var n:Number = (source.X * m[1][4]) + (source.Y * m[2][4]) + (source.Z * m[3][4]) + m[4][4];
			
			if(!MathHelper.WithinEpsilon(n, 1))
				v.Divide(n);
			
			v.X = (((v.X + 1) * 0.5) * this.Width) + this.X;
			v.Y = (((-v.Y + 1) * 0.5) * this.Height) + this.Y;
			v.Z = (v.Z * (this.MaxDepth - this.MinDepth)) + this.MinDepth;
			
			return v;
		}
		
		public function Unproject(source:IVector, projection:IMatrix, view:IMatrix, world:IMatrix):IVector
		{
			var m:IMatrix = MatrixHelper.Multiply(world, view, projection).Invert();
			
			var v:IVector = new Vector3();

			v.X = (((source.X - this.X) / this.Width) * 2) - 1;
			v.Y = -((((source.Y - this.Y) / this.Height) * 2) - 1);
			v.Z = (source.Z - this.MinDepth) / (this.MaxDepth - this.MinDepth);
			
			v.Transform(m);
			
			var n:Number = (source.X * m[1][4]) + (source.Y * m[2][4]) + (source.Z * m[3][4]) + m[4][4];
			
			if(!MathHelper.WithinEpsilon(n, 1))
				v.Divide(n);
			
			return v;
		}
		
		public function toString():String
		{
			return "[Viewport " + this.X + ", " + this.Y + " Width: " + this.Width + " Height: " + this.Height + "]";
		}
	}
}