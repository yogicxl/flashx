package FlashX.Graphics.Cameras
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class FreeCamera extends BasicCamera
	{
		/*
		* Constructor
		*/
		
		public function FreeCamera()
		{
			this.Position = Vector3.Zero;
			this.Rotation = Vector3.Forward;
			this.Direction = Quaternion3.Identity;

			//this.View = Matrix4.Identity;
		}
		
		/*
		* Overloaded Methods
		*/
		
		public override function Initialize():void
		{
			
		}

		public override function Update(time:Time):void
		{
			this.View = Matrix4.CreateLookAt(this.Position, this.Rotation, Vector3.Up);
		}
		
		public override function Dispose():void
		{
			
		}
	}
}