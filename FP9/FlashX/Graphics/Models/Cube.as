﻿package FlashX.Graphics.Models
{
	import flash.geom.*;
	import flash.display.*;
	import flash.filters.*;
	
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Input.*;
	
	import FlashX.Graphics.*;
	import FlashX.Graphics.Cameras.*;
	import FlashX.Graphics.Filters.*;
	import FlashX.Graphics.Lighting.*;
	
	public class Cube extends BasicModel
	{
		public var Filter:IFilter;
		
		public function Cube()
		{
			this.Visible = true;
			this.Active = true;
			
			this.Position = Vector3.Zero;
			this.Rotation = Vector3.Forward;
			this.Direction = Quaternion3.Identity;
			
			this.World = Matrix4.Identity;

			this.Primitives = new Array();
			
			this.Filter = new DefaultFilter();
			this.Lighting = new DefaultLighting();
			
			this.Camera = new FreeCamera();
			this.Camera.Position.X = 50;
			this.Camera.Position.Y = 50;
			this.Camera.Position.Z = 50;
		}
		
		/*
		* Overloaded Methods
		*/
		
		public override function Update(time:Time):void
		{
			this.Camera.Update(time);
			
			var keyState:KeyboardState = KeyboardDevice.GetState();
			
			if(keyState.IsKeyDown(Keys.Up))
				this.Position.Y += 5;
			else if(keyState.IsKeyDown(Keys.Left))
				this.Position.X -= 5;
			else if(keyState.IsKeyDown(Keys.Down))
				this.Position.Y -= 5;
			else if(keyState.IsKeyDown(Keys.Right))
				this.Position.X += 5;
		}
		
		public override function Draw(device:GraphicsDevice):void
		{
			//var rect:Rectangle = new Rectangle(10, 10, 40, 10);
			//device.drawer.fillRect(rect, 0xFF0000);
			
			//var rect:Rectangle = new Rectangle(10, 10, 80, 10);
			//device.drawer.fillRect(rect, 0xFF0000);
			
			//var pt:Point = new Point(10, 10);
			//var filter:BlurFilter = new BlurFilter();
			//device.drawer.applyFilter(device.drawer, rect, pt, filter);
			
				//var rotationMatrix:Matrix = new Matrix();
				//rotationMatrix.translate(-16,-16);
				//rotationMatrix.rotate(angle_in_radians);
				//rotationMatrix.translate(16,16);
			
			//device.drawer.draw(device.bmp);
			
			//var filter:IFilter = new DefaultFilter();
			if(this.Visible)
			{
				this.Filter.World = this.World;
				this.Filter.View = MatrixHelper.Multiply(this.Camera.View, MatrixHelper.CreateTranslation(this.Position));
				this.Filter.Projection = Matrix4.CreatePerspectiveFieldOfView(MathHelper.ToRadians(45), device.Viewport.AspectRatio, 1, 1000);
				
				this.Filter.Begin(device);
	
				for each(var primitive:IPrimitive in this.Primitives)
				{
					primitive.Draw(device);
				}
				
				this.Filter.End(device);
			}
		}
	}
}