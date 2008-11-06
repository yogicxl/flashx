package FlashX.Graphics.Sprites
{
	import FlashX.Graphics.*;
	
	import FlashX.Core.Abstract;
	
	import FlashX.Math.Vector;
	import FlashX.Math.Matrix;
	import FlashX.Math.Quaternion;
	
	public class BasicSprite extends Abstract implements Sprite
	{
		private var position:Vector;
		private var rotation:Vector;
		
		private var direction:Quaternion;
		
		private var world:Matrix;
		private var view:Matrix;
		private var projection:Matrix;
		
		private var camera:Camera;
		private var lighting:Lighting;
		
		private var visible:Boolean;
		
		/*
		* Properties
		*/
		
		public function get Visible():Boolean
		{
			return this.visible;
		}
		
		public function set Visible(visible:Boolean):void
		{
			this.visible = visible;
		}
		
		/*
		* Drawable Properties
		*/
		
		public function get Position():Vector
		{
			return this.position;
		}
		
		public function set Position(position:Vector):void
		{
			this.position = position;
		}
		
		public function get Rotation():Vector
		{
			return this.rotation;
		}
		
		public function set Rotation(rotation:Vector):void
		{
			this.rotation = rotation;
		}
		
		public function get Direction():Quaternion
		{
			return this.direction;
		}
		
		public function set Direction(direction:Quaternion):void
		{
			this.direction = direction;
		}
		
		/*
		* Sprite Properties
		*/
		
		public function get World():Matrix
		{
			return this.world;
		}
		
		public function set World(world:Matrix):void
		{
			this.world = world;
		}
		
		public function get View():Matrix
		{
			return this.view;
		}
		
		public function set View(view:Matrix):void
		{
			this.view = view;
		}
		
		public function get Projection():Matrix
		{
			return this.projection;
		}
		
		public function set Projection(projection:Matrix):void
		{
			this.projection = projection;
		}
		
		public function get Camera2():Camera
		{
			return this.camera;
		}
		
		public function set Camera2(camera:Camera):void
		{
			this.camera = camera;
		}
		
		public function get Lighting2():Lighting
		{
			return this.lighting;
		}
		
		public function set Lighting2(lighting:Lighting):void
		{
			this.lighting = lighting;
		}
		
		/*
		* Methods
		*/
		
		public function Initialize():void
		{
			
		}
		
		public function Update():void
		{
			
		}
		
		public function Draw():void
		{
			
		}
		
		public function Dispose():void
		{
			
		}
	}
}