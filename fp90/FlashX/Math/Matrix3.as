package FlashX.Math
{
	import FlashX.Core.Errors.*;
	
	public dynamic class Matrix3 extends Array implements IMatrix
	{
		/*
        public var M11:Number;
        public var M12:Number;
        public var M13:Number;
		
        public var M21:Number;
        public var M22:Number;
        public var M23:Number;
		
        public var M31:Number;
        public var M32:Number;
        public var M33:Number;
		*/
		/*
		* Constructor
		*/
		
		public function Matrix3(M11:Number = 0, M12:Number = 0, M13:Number = 0, 
								M21:Number = 0, M22:Number = 0, M23:Number = 0, 
								M31:Number = 0, M32:Number = 0, M33:Number = 0)
		{
			//this.M11 = M11; this.M12 = M12; this.M13 = M13;
			//this.M21 = M21; this.M22 = M22; this.M23 = M23;
			//this.M31 = M31; this.M32 = M32; this.M33 = M33;
			
			this.push(null);
			this.push(new Array(null, new Array(null)));
			this.push(new Array(null, new Array(null)));
			this.push(new Array(null, new Array(null)));
			
			this[1][1] = M11; this[1][2] = M12; this[1][3] = M13;
			this[2][1] = M21; this[2][2] = M22; this[2][3] = M23;
			this[3][1] = M31; this[3][2] = M32; this[3][3] = M33;
		}
		
		/*
		* Generate Methods
		*/
		
		public static function get Identity():IMatrix { return new Matrix3(1, 0, 0, 0, 1, 0, 0, 0, 1); }
		
		/*
		* Methods
		*/


		public function Add(m:IMatrix):IMatrix
		{
			this[1][1] += m[1][1]; this[1][2] += m[1][2]; this[1][3] += m[1][3];
			this[2][1] += m[2][1]; this[2][2] += m[2][2]; this[2][3] += m[2][3];
			this[3][1] += m[3][1]; this[3][2] += m[3][2]; this[3][3] += m[3][3];
			
			return this;
		}
		
		public function Subtract(m:IMatrix):IMatrix
		{
			this[1][1] -= m[1][1]; this[1][2] -= m[1][2]; this[1][3] -= m[1][3];
			this[2][1] -= m[2][1]; this[2][2] -= m[2][2]; this[2][3] -= m[2][3];
			this[3][1] -= m[3][1]; this[3][2] -= m[3][2]; this[3][3] -= m[3][3];
			
			return this;
		}
		
		public function Multiply(m2:IMatrix):IMatrix
		{
			var m1:IMatrix = this.Clone();
			
			this[1][1] = (m1[1][1] * m2[1][1]) + (m1[1][2] * m2[2][1]) + (m1[1][3] * m2[3][1]);
			this[1][2] = (m1[1][1] * m2[1][2]) + (m1[1][2] * m2[2][2]) + (m1[1][3] * m2[3][2]);
			this[1][3] = (m1[1][1] * m2[1][3]) + (m1[1][2] * m2[2][3]) + (m1[1][3] * m2[3][3]);
			
			this[2][1] = (m1[2][1] * m2[1][1]) + (m1[2][2] * m2[2][1]) + (m1[2][3] * m2[3][1]);
			this[2][2] = (m1[2][1] * m2[1][2]) + (m1[2][2] * m2[2][2]) + (m1[2][3] * m2[3][2]);
			this[2][3] = (m1[2][1] * m2[1][3]) + (m1[2][2] * m2[2][3]) + (m1[2][3] * m2[3][3]);
			
			this[3][1] = (m1[3][1] * m2[1][1]) + (m1[3][2] * m2[2][1]) + (m1[3][3] * m2[3][1]);
			this[3][2] = (m1[3][1] * m2[1][2]) + (m1[3][2] * m2[2][2]) + (m1[3][3] * m2[3][2]);
			this[3][3] = (m1[3][1] * m2[1][3]) + (m1[3][2] * m2[2][3]) + (m1[3][3] * m2[3][3]);
			
			this[4][1] = (m1[4][1] * m2[1][1]) + (m1[4][2] * m2[2][1]) + (m1[4][3] * m2[3][1]);
			this[4][2] = (m1[4][1] * m2[1][2]) + (m1[4][2] * m2[2][2]) + (m1[4][3] * m2[3][2]);
			this[4][3] = (m1[4][1] * m2[1][3]) + (m1[4][2] * m2[2][3]) + (m1[4][3] * m2[3][3]);
			
			return this;
		}
		
		public function Translate(v:IVector):IMatrix
		{
			this[1][3] += v.X;
			this[2][3] += v.Y;

			return this;
		}
		
		public function Invert():IMatrix
		{
			var m:IMatrix = this.Clone();

			throw new NotImplementedError();
			
			return this;
		}
		
		public function Determinant():Number
		{
			throw new NotImplementedError();
			
			return 0;
		}
		
		public function Clone():IMatrix
		{
			var m:IMatrix = this.concat() as Matrix3;
			
			return m;
		}
		
		public function toString():String
		{
			return  "Matrix3\n" + 
			"[ " + this[1][1] + "\t\t" + this[1][2] + "\t\t" + this[1][3] + "\t\t" + " ]\n" + 
			"[ " + this[2][1] + "\t\t" + this[2][2] + "\t\t" + this[2][3] + "\t\t" + " ]\n" + 
			"[ " + this[3][1] + "\t\t" + this[3][2] + "\t\t" + this[3][3] + "\t\t" + " ]\n";
		}

	}
}