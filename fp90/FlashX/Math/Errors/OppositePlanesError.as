package FlashX.Math.Errors
{
	import FlashX.Core.Errors.*;
	
	public class OppositePlanesError extends BasicError
	{
		public function OppositePlanesError()
		{
			super("Far plane distance must be larger than short plane distance.", 703);
			
			this.name = "OppositePlanesError";
		}
	}
}