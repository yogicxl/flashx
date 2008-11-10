package FlashX.Math.Errors
{
	import FlashX.Core.Errors.*;
	
	public class NegativePlaneDistanceError extends BasicError
	{
		public function NegativePlaneDistanceError(object:String)
		{
			super("Plane distance cannot be negative: " + object + ".", 701);
			
			this.name = "NegativePlaneDistanceError";
		}
	}
}