package FlashX.Math
{
	import FlashX.Core.Errors.*;
	import FlashX.Math.Errors.*;
	
	public dynamic class Matrix4 extends Array implements IMatrix
	{
		/*
        public var M11:Number;
        public var M12:Number;
        public var M13:Number;
        public var M14:Number;
		
        public var M21:Number;
        public var M22:Number;
        public var M23:Number;
        public var M24:Number;
		
        public var M31:Number;
        public var M32:Number;
        public var M33:Number;
        public var M34:Number;
		
        public var M41:Number;
        public var M42:Number;
        public var M43:Number;
        public var M44:Number;
		*/
		/*
		* Constructor
		*/
		
		
		// don't use an array parameter for strict-typing, and optional arguments
		public function Matrix4(M11:Number = 0, M12:Number = 0, M13:Number = 0, M14:Number = 0,
								M21:Number = 0, M22:Number = 0, M23:Number = 0, M24:Number = 0,
								M31:Number = 0, M32:Number = 0, M33:Number = 0, M34:Number = 0,
								M41:Number = 0, M42:Number = 0, M43:Number = 0, M44:Number = 0)
		{
			//this.M11 = M11; this.M12 = M12; this.M13 = M13; this.M14 = M14;
			//this.M21 = M21; this.M22 = M22; this.M23 = M23; this.M24 = M24;
			//this.M31 = M31; this.M32 = M32; this.M33 = M33; this.M34 = M34;
			//this.M41 = M41; this.M42 = M42; this.M43 = M43; this.M44 = M44;

			// null: start access at row/column 1, not 0
			this.push(null);
			this.push(new Array(null, new Array(null)));
			this.push(new Array(null, new Array(null)));
			this.push(new Array(null, new Array(null)));
			this.push(new Array(null, new Array(null)));
			
			this[1][1] = M11; this[1][2] = M12; this[1][3] = M13; this[1][4] = M14;
			this[2][1] = M21; this[2][2] = M22; this[2][3] = M23; this[2][4] = M24;
			this[3][1] = M31; this[3][2] = M32; this[3][3] = M33; this[3][4] = M34;
			this[4][1] = M41; this[4][2] = M42; this[4][3] = M43; this[4][4] = M44;
		}
		
		/*
		* Generate Methods
		*/
		
		public static function get Zero():IMatrix { return new Matrix4(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0); }
		public static function get Identity():IMatrix { return new Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
		
		public static function CreateLookAt(position:IVector, target:IVector, up:IVector)
		{
			var m:IMatrix = Matrix4.Identity;
			
			var v1:IVector = VectorHelper.Subtract(position, target).Normalize();
			var v2:IVector = VectorHelper.Cross(up, v1).Normalize();
			var v3:IVector = VectorHelper.Cross(v1, v2); //v1 and v2 already normalized
			
			m[1][1] = v2.X;
			m[1][2] = v3.X;
			m[1][3] = v1.X;
			
			m[2][1] = v2.Y;
			m[2][2] = v3.Y;
			m[2][3] = v1.Y;
			
			m[3][1] = v2.Z;
			m[3][2] = v3.Z;
			m[3][3] = v1.Z;
			
			m[4][1] = -VectorHelper.Dot(v2, position);
			m[4][2] = -VectorHelper.Dot(v3, position);
			m[4][3] = -VectorHelper.Dot(v1, position);
			
			return m;
		}
		
		public static function CreatePerspectiveFieldOfView(fieldOfView:Number, aspectRatio:Number, nearPlaneDistance:Number, farPlaneDistance:Number)
		{
			var m:IMatrix = Matrix4.Zero;
			
            if ((fieldOfView <= 0) || (fieldOfView >= 3.141593))
                throw new OutOfRangeError("fieldOfView");
			
            if (nearPlaneDistance <= 0)
                throw new NegativePlaneDistanceError("nearPlaneDistance");
			
            if (farPlaneDistance <= 0)
                throw new NegativePlaneDistanceError("farPlaneDistance");
			
            if (nearPlaneDistance >= farPlaneDistance)
                throw new OppositePlanesError();
			
			var planeRatio:Number = farPlaneDistance / (nearPlaneDistance - farPlaneDistance);
			var lense:Number = 1 / Math.tan(fieldOfView * 0.5);

			m[1][1] = lense / aspectRatio;
			m[2][2] = lense;
			m[3][3] = planeRatio;
			m[3][4] = -1;
			m[4][3] = nearPlaneDistance * planeRatio;

			return m;
		}
		
		/*
		* Methods
		*/

		public function Add(m:IMatrix):IMatrix
		{
			this[1][1] += m[1][1]; this[1][2] += m[1][2]; this[1][3] += m[1][3]; this[1][4] += m[1][4];
			this[2][1] += m[2][1]; this[2][2] += m[2][2]; this[2][3] += m[2][3]; this[2][4] += m[2][4];
			this[3][1] += m[3][1]; this[3][2] += m[3][2]; this[3][3] += m[3][3]; this[3][4] += m[3][4];
			this[4][1] += m[4][1]; this[4][2] += m[4][2]; this[4][3] += m[4][3]; this[4][4] += m[4][4];
			
			return this;
		}
		
		public function Subtract(m:IMatrix):IMatrix
		{
			this[1][1] -= m[1][1]; this[1][2] -= m[1][2]; this[1][3] -= m[1][3]; this[1][4] -= m[1][4];
			this[2][1] -= m[2][1]; this[2][2] -= m[2][2]; this[2][3] -= m[2][3]; this[2][4] -= m[2][4];
			this[3][1] -= m[3][1]; this[3][2] -= m[3][2]; this[3][3] -= m[3][3]; this[3][4] -= m[3][4];
			this[4][1] -= m[4][1]; this[4][2] -= m[4][2]; this[4][3] -= m[4][3]; this[4][4] -= m[4][4];
			
			return this;
		}
		
		public function Multiply(m2:IMatrix):IMatrix
		{
			var m1:IMatrix = this.Clone();
			
			this[1][1] = (m1[1][1] * m2[1][1]) + (m1[1][2] * m2[2][1]) + (m1[1][3] * m2[3][1]) + (m1[1][4] * m2[4][1]);
			this[1][2] = (m1[1][1] * m2[1][2]) + (m1[1][2] * m2[2][2]) + (m1[1][3] * m2[3][2]) + (m1[1][4] * m2[4][2]);
			this[1][3] = (m1[1][1] * m2[1][3]) + (m1[1][2] * m2[2][3]) + (m1[1][3] * m2[3][3]) + (m1[1][4] * m2[4][3]);
			this[1][4] = (m1[1][1] * m2[1][4]) + (m1[1][2] * m2[2][4]) + (m1[1][3] * m2[3][4]) + (m1[1][4] * m2[4][4]);
			
			this[2][1] = (m1[2][1] * m2[1][1]) + (m1[2][2] * m2[2][1]) + (m1[2][3] * m2[3][1]) + (m1[2][4] * m2[4][1]);
			this[2][2] = (m1[2][1] * m2[1][2]) + (m1[2][2] * m2[2][2]) + (m1[2][3] * m2[3][2]) + (m1[2][4] * m2[4][2]);
			this[2][3] = (m1[2][1] * m2[1][3]) + (m1[2][2] * m2[2][3]) + (m1[2][3] * m2[3][3]) + (m1[2][4] * m2[4][3]);
			this[2][4] = (m1[2][1] * m2[1][4]) + (m1[2][2] * m2[2][4]) + (m1[2][3] * m2[3][4]) + (m1[2][4] * m2[4][4]);
			
			this[3][1] = (m1[3][1] * m2[1][1]) + (m1[3][2] * m2[2][1]) + (m1[3][3] * m2[3][1]) + (m1[3][4] * m2[4][1]);
			this[3][2] = (m1[3][1] * m2[1][2]) + (m1[3][2] * m2[2][2]) + (m1[3][3] * m2[3][2]) + (m1[3][4] * m2[4][2]);
			this[3][3] = (m1[3][1] * m2[1][3]) + (m1[3][2] * m2[2][3]) + (m1[3][3] * m2[3][3]) + (m1[3][4] * m2[4][3]);
			this[3][4] = (m1[3][1] * m2[1][4]) + (m1[3][2] * m2[2][4]) + (m1[3][3] * m2[3][4]) + (m1[3][4] * m2[4][4]);
			
			this[4][1] = (m1[4][1] * m2[1][1]) + (m1[4][2] * m2[2][1]) + (m1[4][3] * m2[3][1]) + (m1[4][4] * m2[4][1]);
			this[4][2] = (m1[4][1] * m2[1][2]) + (m1[4][2] * m2[2][2]) + (m1[4][3] * m2[3][2]) + (m1[4][4] * m2[4][2]);
			this[4][3] = (m1[4][1] * m2[1][3]) + (m1[4][2] * m2[2][3]) + (m1[4][3] * m2[3][3]) + (m1[4][4] * m2[4][3]);
			this[4][4] = (m1[4][1] * m2[1][4]) + (m1[4][2] * m2[2][4]) + (m1[4][3] * m2[3][4]) + (m1[4][4] * m2[4][4]);
			
			return this;
		}
		
		public function Translate(v:IVector):IMatrix
		{
			this[4][1] += v.X;
			this[4][2] += v.Y;
			this[4][3] += v.Z;

			return this;
		}
		
		public function Determinant():Number
		{
			/*
            var n1:Number = (this[3][3] * this[4][4]) - (this[3][4] * this[4][3]);
            var n2:Number = (this[3][2] * this[4][4]) - (this[3][4] * this[4][2]);
            var n3:Number = (this[3][2] * this[4][3]) - (this[3][3] * this[4][2]);
            var n4:Number = (this[3][1] * this[4][4]) - (this[3][4] * this[4][1]);
            var n5:Number = (this[3][1] * this[4][3]) - (this[3][3] * this[4][1]);
            var n6:Number = (this[3][1] * this[4][2]) - (this[3][2] * this[4][1]);
			
            return ((((this[1][1] * (((this[2][2] * n1) - (this[2][3] * n2)) 
			+ (this[2][4] * n3))) - (this[1][2] * (((this[2][1] * n1) 
			- (this[2][3] * n4)) + (this[2][4] * n5)))) 
			+ (this[1][3] * (((this[2][1] * n2) - (this[2][2] * n4)) + (this[2][4] * n6)))) 
			- (this[1][4] * (((this[2][1] * n3) - (this[2][2] * n5)) + (this[2][3] * n6))));
			*/
			
			
			
			return    (this[1][1] * this[2][2] - this[2][1] * this[1][2]) * (this[3][3] * this[4][4] - this[4][3] * this[3][4]) - (this[1][1] * this[3][2] - this[3][1] * this[1][2]) * (this[2][3] * this[4][4] - this[4][3] * this[2][4])
					+ (this[1][1] * this[4][2] - this[4][1] * this[1][2]) * (this[2][3] * this[3][4] - this[3][3] * this[2][4]) + (this[2][1] * this[3][2] - this[3][1] * this[2][2]) * (this[1][3] * this[4][4] - this[4][3] * this[1][4])
					- (this[2][1] * this[4][2] - this[4][1] * this[2][2]) * (this[1][3] * this[3][4] - this[3][3] * this[1][4]) + (this[3][1] * this[4][2] - this[4][1] * this[3][2]) * (this[1][3] * this[2][4] - this[2][3] * this[1][4]);
	   }
		
		public function Determinant3x3():Number
		{
			return    this[1][3] * (this[2][1] * this[3][2] - this[3][1] * this[2][2])
					- this[2][3] * (this[1][1] * this[3][2] - this[3][1] * this[1][2])
					+ this[3][3] * (this[1][1] * this[2][2] - this[2][1] * this[1][2])
			
			//return this[1][1] * (this[2][2] * this[3][3] - this[2][3] * this[3][2]) 
			//+ this[2][1] * (this[3][2] * this[1][3] - this[1][2] * this[3][3]) 
			//+ this[3][1] * (this[1][2] * this[2][3] - this[2][2] * this[1][3]);
		}
		
		public function Invert():IMatrix
		{
			var m:IMatrix = this.Clone();
			
			var d:Number = m.Determinant();
			
			if(Math.abs(d) < 0.001)
				throw new InvalidDeterminantError();

			d = 1 / d;
			
			// optimization
			var a1:Number = (m[3][3] * m[4][4]) - (m[4][3] * m[3][4]);
			var a2:Number = (m[2][3] * m[4][4]) - (m[4][3] * m[2][4]);
			var a3:Number = (m[2][3] * m[3][4]) - (m[3][3] * m[2][4]);
			var a4:Number = (m[1][3] * m[4][4]) - (m[4][3] * m[1][4]);
			var a5:Number = (m[1][3] * m[3][4]) - (m[3][3] * m[1][4]);
			var a6:Number = (m[1][3] * m[2][4]) - (m[2][3] * m[1][4]);
			
			var b1:Number = (m[3][2] * m[4][4]) - (m[4][2] * m[3][4]);
			var b2:Number = (m[2][2] * m[4][4]) - (m[4][2] * m[2][4]);
			var b3:Number = (m[2][2] * m[3][4]) - (m[3][2] * m[2][4]);
			var b4:Number = (m[1][2] * m[4][4]) - (m[4][2] * m[1][4]);
			var b5:Number = (m[1][2] * m[3][4]) - (m[3][2] * m[1][4]);
			var b6:Number = (m[1][2] * m[2][4]) - (m[2][2] * m[1][4]);
			
			var c1:Number = (m[3][2] * m[4][3]) - (m[4][2] * m[3][3]);
			var c2:Number = (m[2][2] * m[4][3]) - (m[4][2] * m[2][3]);
			var c3:Number = (m[2][2] * m[3][3]) - (m[3][2] * m[2][3]);
			var c4:Number = (m[1][2] * m[4][3]) - (m[4][2] * m[1][3]);
			var c5:Number = (m[1][2] * m[3][3]) - (m[3][2] * m[1][3]);
			var c6:Number = (m[1][2] * m[2][3]) - (m[2][2] * m[1][3]);
			
			this[1][1] = d * ((m[2][2] * a1) - (m[3][2] * a2) + (m[4][2] * a3));
			this[1][2] = d * ((m[1][2] * a1) - (m[3][2] * a4) + (m[4][2] * a5)) * -1;
			this[1][3] = d * ((m[1][2] * a2) - (m[2][2] * a4) + (m[4][2] * a6));
			this[1][4] = d * ((m[1][2] * a3) - (m[2][2] * a5) + (m[3][2] * a6)) * -1;
			
			this[2][1] = d * ((m[2][1] * a1) - (m[3][1] * a2) + (m[4][1] * a3)) * -1;
			this[2][2] = d * ((m[1][1] * a1) - (m[3][1] * a4) +( m[4][1] * a5));
			this[2][3] = d * ((m[1][1] * a2) - (m[2][1] * a4) + (m[4][1] * a6)) * -1;
			this[2][4] = d * ((m[1][1] * a3) - (m[2][1] * a5) + (m[3][1] * a6));
			
			this[3][1] = d * ((m[2][1] * b1) - (m[3][1] * b2) + (m[4][1] * b3));
			this[3][2] = d * ((m[1][1] * b1) - (m[3][1] * b4) + (m[4][1] * b5)) * -1;
			this[3][3] = d * ((m[1][1] * b2) - (m[2][1] * b4) + (m[4][1] * b6));
			this[3][4] = d * ((m[1][1] * b3) - (m[2][1] * b5) + (m[3][1] * b6)) * -1;
			
			this[4][1] = d * ((m[2][1] * c1) - (m[3][1] * c2) + (m[4][1] * c3)) * -1;
			this[4][2] = d * ((m[1][1] * c1) - (m[3][1] * c4) + (m[4][1] * c5));
			this[4][3] = d * ((m[1][1] * c2) - (m[2][1] * c4) + (m[4][1] * c6)) * -1;
			this[4][4] = d * ((m[1][1] * c3) - (m[2][1] * c5) + (m[3][1] * c6));
			
			return this;
		}
		
		public function Nullify():IMatrix
		{
			return this;
		}
		
		public function Clone():IMatrix
		{
			var m:Matrix4 = new Matrix4();
			
			m[1] = this[1].concat();
			m[2] = this[2].concat();
			m[3] = this[3].concat();
			m[4] = this[4].concat();
			
			return m;
		}
		
		public function toString():String
		{
			return  "Matrix4\n" + 
			"[ " + this[1][1] + "\t\t" + this[1][2] + "\t\t" + this[1][3] + "\t\t" + this[1][4] + " ]\n" + 
			"[ " + this[2][1] + "\t\t" + this[2][2] + "\t\t" + this[2][3] + "\t\t" + this[2][4] + " ]\n" + 
			"[ " + this[3][1] + "\t\t" + this[3][2] + "\t\t" + this[3][3] + "\t\t" + this[3][4] + " ]\n" + 
			"[ " + this[4][1] + "\t\t" + this[4][2] + "\t\t" + this[4][3] + "\t\t" + this[4][4] + " ]\n";
		}
	}
}