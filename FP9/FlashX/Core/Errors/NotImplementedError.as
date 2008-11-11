package FlashX.Core.Errors
{
	
	
	public class NotImplementedError extends BasicError
	{
		public function NotImplementedError()
		{
			super("This function has not yet been implemented.", 505);
			
			this.name = "NotImplementedError";
		}
	}
}