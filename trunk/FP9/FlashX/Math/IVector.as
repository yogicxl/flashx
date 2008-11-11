package FlashX.Math
{
	/*
	* Implicit casting between Vector2 and Vector3. Strict usage.
	*/
	public interface IVector
	{
		/*
		* Properties
		*/
		
		function set X(x:Number):void;
		
		function get X():Number;
		
		function set Y(y:Number):void;
		
		function get Y():Number;
		
		function set Z(z:Number):void;
		
		function get Z():Number;
		
		function set Length(length:Number):void;
		
		function get Length():Number;
		
		function get LengthSquared():Number;
		
		/*
		* Arithmetic Methods
		*/
		
		function Add(v:IVector):IVector;
		
		function Subtract(v:IVector):IVector;
		
		function Multiply(n:Number):IVector;
		
		function Divide(n:Number):IVector;
		
		function Normalize():IVector;
		
		function Invert():IVector;
		
		function Negate():IVector;
		
		function Dot(v:IVector):Number;
		
		function Cross(v:IVector):IVector;
		
		/*
		* Trigonometry Methods
		*/
		
		function Angle(v:IVector):Number;
		
		function Reflect(normal:IVector):IVector;
		
		function Transform(m:IMatrix):IVector;
		
		function TransformMatrix(m:IMatrix):IVector;
		
		function TransformQuaternion(q:IQuaternion):IVector;

		/*
		* Basic Methods
		*/
		
		function Nullify():IVector;
		
		function Equals(v:IVector):Boolean;
		
		function Copy(v:IVector):IVector;
		
		function Clone():IVector;

		function toString():String;
	}
}