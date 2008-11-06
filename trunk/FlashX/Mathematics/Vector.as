package FlashX.Mathematics
{
	/*
	* Implicit casting between Vector2 and Vector3. Strict usage.
	*/
	public interface Vector
	{
		/*
		* Properties
		*/
		
		function set X(x:int):void;
		
		function get X():int;
		
		function set Y(y:int):void;
		
		function get Y():int;
		
		function set Z(z:int):void;
		
		function get Z():int;
		
		function set Length(length:Number):void;
		
		function get Length():Number;
		
		function get LengthSquared():Number;
		
		/*
		* Arithmetic Methods
		*/
		
		function Add(v:Vector):Vector;
		
		function Subtract(v:Vector):Vector;
		
		function Multiply(n:Number):Vector;
		
		function Divide(n:Number):Vector;
		
		function Normalize():Vector;
		
		function Invert():Vector;
		
		function Dot(v:Vector):Number;
		
		function Cross(v:Vector):Vector;
		
		/*
		* Trigonometry Methods
		*/
		
		function Angle(v:Vector):Number;
		
		function Reflect(normal:Vector):Vector;
		
		/*
		* Basic Methods
		*/
		
		function Null():Vector;
		
		function Equals(v:Vector):Boolean;
		
		function Copy(v:Vector):Vector;
		
		function Clone():Vector;
		
		function toString():String;
	}
}