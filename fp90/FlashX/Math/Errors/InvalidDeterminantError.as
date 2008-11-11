package FlashX.Math.Errors
{
	import FlashX.Core.Errors.*;
	
	public class InvalidDeterminantError extends BasicError
	{
		public function InvalidDeterminantError()
		{
			super("Matrix determinant is invalid or null.", 704);
			
			this.name = "InvalidDeterminantError";
		}
	}
}