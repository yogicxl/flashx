package FlashX.Graphics.Sprites
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class Circle extends BasicSprite
	{
		/*
		* Constructor
		*/
		
		public function Circle()
		{
			this.Position = Vector2.Zero;
			this.Rotation = Vector2.Zero;
			
			this.Direction = Quaternion3.Identity;
			
			this.World = Matrix3.Identity;
			this.View = Matrix3.Identity;
			this.Projection = Matrix3.Identity;
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