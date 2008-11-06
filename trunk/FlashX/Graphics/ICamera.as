package FlashX.Graphics
{
	import FlashX.Math.*;
	
	public interface ICamera extends IComponent
	{
		// generate view matrix from position and rotation
		function get View():IMatrix;
		function set View(view:IMatrix):void;
	}
}