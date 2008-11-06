package FlashX.Mathematics
{
	public class Matrix3 implements Matrix
	{
        public var M11:Number;
        public var M12:Number;
        public var M13:Number;
		
        public var M21:Number;
        public var M22:Number;
        public var M23:Number;
		
        public var M31:Number;
        public var M32:Number;
        public var M33:Number;
		
		public function Matrix3(M11:Number = 0, M12:Number = 0, M13:Number = 0, 
								M21:Number = 0, M22:Number = 0, M23:Number = 0, 
								M31:Number = 0, M32:Number = 0, M33:Number = 0)
		{
			this.M11 = M11; this.M12 = M12; this.M13 = M13;
			this.M21 = M21; this.M22 = M22; this.M23 = M23;
			this.M31 = M31; this.M32 = M32; this.M33 = M33;
		}
		
		static public function get Identity():Matrix { return new Matrix3(1, 0, 0, 0, 1, 0, 0, 0, 1); }
	}
}