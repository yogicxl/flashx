package FlashX.Math
{
	public interface IQuaternion
	{
		function set X(x:int):void;
		
		function get X():int;
		
		function set Y(y:int):void;
		
		function get Y():int;
		
		function set Z(z:int):void;
		
		function get Z():int;
		
		function set W(w:int):void;
		
		function get W():int;
		
		function Add(q:IQuaternion):IQuaternion;
		
		function Subtract(q:IQuaternion):IQuaternion;
		
		function Multiply(q:IQuaternion):IQuaternion;
		
		function MultiplyQuaternion(q1:IQuaternion):IQuaternion;
		
		function MultiplyVector(v:IVector):IQuaternion;
		
		function Dot(q:IQuaternion):Number;
		
		/*
		* Trigonometry Methods
		*/
		
		/*
		* Basic Methods
		*/
		
		function Copy(q:IQuaternion):IQuaternion;
		
		function Null():IQuaternion;

		function Equals(q:IQuaternion):Boolean;
		
		function Clone():IQuaternion;
		
		function toString():String;
	}
}