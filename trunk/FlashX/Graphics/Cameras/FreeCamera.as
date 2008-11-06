package FlashX.Graphics.Cameras
{
	import FlashX.Mathematics.Vector;
	import FlashX.Mathematics.Matrix;
	import FlashX.Mathematics.Quaternion;
	
	import FlashX.Mathematics.Vector3;
	import FlashX.Mathematics.Matrix4;
	
	public class FreeCamera extends BasicCamera
	{
		/*
		* Constructor
		*/
		
		public function FreeCamera()
		{
			this.Position = Vector3.Zero;
			this.Rotation = Vector3.Zero;
			
			this.Direction = Quaternion.Identity;

			this.View = Matrix4.Identity;
		}
		
		/*
		* Overloaded Methods
		*/
		
		public override function Initialize():void
		{
			
		}

		public override function Update():void
		{

		}

		public override function Draw():void
		{

		}
	}
}