package FlashX.Graphics
{
	import FlashX.Math.Matrix;
	
	public interface Sprite extends Component
	{
		function get World():Matrix;
		function set World(world:Matrix):void;
		
		function get View():Matrix;
		function set View(view:Matrix):void;
		
		function get Projection():Matrix;
		function set Projection(projection:Matrix):void;
		
		function get Camera2():Camera;
		function set Camera2(camera:Camera):void;
		
		function get Lighting2():Lighting;
		function set Lighting2(lighting:Lighting):void;
	}
}