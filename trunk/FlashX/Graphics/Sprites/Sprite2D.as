package FlashX.Graphics.Sprites
{
	public class Sprite2D extends BasicSprite
	{
		/*
		* Constructor
		*/
		
		public function Sprite2D()
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
		
		public override function Update()
		{
			// update direction via rotation
			// update view
			
		}
		
		public override function Draw()
		{
			// draw with world, view, and projection
		}
	}
}