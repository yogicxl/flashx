package FlashX.Graphics
{
	import FlashX.Mathematics.Matrix;
	
	public interface Camera extends Component
	{
		// generate view matrix from position and rotation
		function get View():Matrix;
		function set View(view:Matrix):void;
	}
}