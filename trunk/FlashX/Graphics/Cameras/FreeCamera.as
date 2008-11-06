package FlashX.Graphics.Cameras
{
	import FlashX.Math.*
	
	public class FreeCamera extends BasicCamera
	{
		/*
		* Constructor
		*/
		
		public function FreeCamera()
		{
			this.Position = Vector3.Zero;
			this.Rotation = Vector3.Zero;
			
			this.Direction = Quaternion3.Identity;

			this.View = Matrix4.Identity;
		}
		
		/*
		* Overloaded Methods
		*/
		
		public override function Initialize():void
		{
			super.Initialize();
		}

		public override function Update():void
		{
			super.Update();
		}

		public override function Draw():void
		{
			super.Draw();
		}
		
		public override function Dispose():void
		{
			super.Dispose();
		}
	}
}