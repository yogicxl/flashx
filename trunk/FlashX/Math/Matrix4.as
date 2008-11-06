package FlashX.Math
{
	public class Matrix4 implements IMatrix
	{
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
		
		public function Matrix4(M11:Number = 0, M12:Number = 0, M13:Number = 0, M14:Number = 0,
								M21:Number = 0, M22:Number = 0, M23:Number = 0, M24:Number = 0,
								M31:Number = 0, M32:Number = 0, M33:Number = 0, M34:Number = 0,
								M41:Number = 0, M42:Number = 0, M43:Number = 0, M44:Number = 0)
		{
			this.M11 = M11; this.M12 = M12; this.M13 = M13; this.M14 = M14;
			this.M21 = M21; this.M22 = M22; this.M23 = M23; this.M24 = M24;
			this.M31 = M31; this.M32 = M32; this.M33 = M33; this.M34 = M34;
			this.M41 = M41; this.M42 = M42; this.M43 = M43; this.M44 = M44;
		}
		
		static public function get Identity():IMatrix { return new Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
	}
}