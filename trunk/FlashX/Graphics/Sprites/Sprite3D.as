package FlashX.Graphics.Sprites
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class Sprite3D extends BasicSprite
	{
		/*
		* Constructor
		*/
		
		public function Sprite3D()
		{
			this.Position = Vector3.Zero;
			this.Rotation = Vector3.Zero;
			
			this.Direction = Quaternion3.Identity;
			
			this.World = Matrix4.Identity;
			this.View = Matrix4.Identity;
			this.Projection = Matrix4.Identity;
		}
		
		/*
		* Overloaded Methods
		*/
		
		public override function Update(time:Time):void
		{
			// update direction via rotation
			// update view
			
		}
		
		public override function Draw(device:GraphicsDevice):void
		{
			// draw with world, view, and projection
		}
	}
}