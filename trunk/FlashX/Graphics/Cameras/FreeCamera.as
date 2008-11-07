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

		public override function Update(time:Time):void
		{
			super.Update(time);
		}

		public override function Draw(device:GraphicsDevice):void
		{
			super.Draw(device);
		}
		
		public override function Dispose():void
		{
			super.Dispose();
		}
	}
}