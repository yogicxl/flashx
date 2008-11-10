package FlashX.Core.Errors
{
	
	
	public class DivideByZeroError extends BasicError
	{
		public function DivideByZeroError() //message:String, source:Object
		{
			super("Dividing by zero is undefined.", 504);
			
			this.name = "DivideByZeroError";
		}
	}
}