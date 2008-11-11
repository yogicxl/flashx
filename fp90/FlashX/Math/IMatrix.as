// dot product
// cross product
// multiple
// add
// subtract

package FlashX.Math
{
	public interface IMatrix
	{
		function Add(m:IMatrix):IMatrix;
		
		function Subtract(m:IMatrix):IMatrix;
		
		function Multiply(m2:IMatrix):IMatrix;
		
		function Translate(v:IVector):IMatrix;
		
		function Invert():IMatrix;
		
		function Determinant():Number;
		
		function Clone():IMatrix;
		
		function toString():String;
	}
}