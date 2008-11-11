package FlashX.Math.Errors
{
	import FlashX.Core.Errors.*;
	
	public class OutOfRangeError extends BasicError
	{
		public function OutOfRangeError(object:String)
		{
			super("Object out of range: " + object + ".", 702);
			
			this.name = "OutOfRangeError";
		}
	}
}