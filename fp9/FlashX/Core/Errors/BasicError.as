package FlashX.Core.Errors
{
	import FlashX.Core.*;
	
	public class BasicError extends Error
	{
		public function BasicError(message:String, id:int, source:Object = null)
		{
			super(message, id);
		}
	}
}