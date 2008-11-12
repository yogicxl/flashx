package FlashX.Graphics.Models
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicModel extends Abstract implements IModel
	{
		private var primitives:Array;
		
		private var position:IVector;
		private var rotation:IVector;
		private var direction:IQuaternion;
		
		private var world:IMatrix;
		private var view:IMatrix;
		private var projection:IMatrix;
		
		private var camera:ICamera;
		private var lighting:ILighting;
		
		private var visible:Boolean;
		private var active:Boolean;
		
		/*
		* Properties
		*/
		

		
		
		
		/*
		* Model Properties
		*/
		
		public function get Primitives():Array
		{
			return this.primitives;
		}
		
		public function set Primitives(primitives:Array):void
		{
			this.primitives = primitives;
		}
		
		public function get Visible():Boolean
		{
			return this.visible;
		}
		
		public function set Visible(visible:Boolean):void
		{
			this.visible = visible;
		}
		
		public function get Active():Boolean
		{
			return this.active;
		}
		
		public function set Active(active:Boolean):void
		{
			this.active = active;
		}
		
		/*
		* Drawable Properties
		*/
		
		public function get World():IMatrix
		{
			return this.world;
		}
		
		public function set World(world:IMatrix):void
		{
			this.world = world;
		}
		
		public function get View():IMatrix
		{
			return this.view;
		}
		
		public function set View(view:IMatrix):void
		{
			this.view = view;
		}
		
		public function get Projection():IMatrix
		{
			return this.projection;
		}
		
		public function set Projection(projection:IMatrix):void
		{
			this.projection = projection;
		}

		/*
		* Sprite Properties
		*/
		
		public function get Position():IVector
		{
			return this.position;
		}
		
		public function set Position(position:IVector):void
		{
			this.position = position;
		}
		
		public function get Rotation():IVector
		{
			return this.rotation;
		}
		
		public function set Rotation(rotation:IVector):void
		{
			this.rotation = rotation;
		}
		
		public function get Direction():IQuaternion
		{
			return this.direction;
		}
		
		public function set Direction(direction:IQuaternion):void
		{
			this.direction = direction;
		}
		
		public function get Camera():ICamera
		{
			return this.camera;
		}
		
		public function set Camera(camera:ICamera):void
		{
			this.camera = camera;
		}
		
		public function get Lighting():ILighting
		{
			return this.lighting;
		}
		
		public function set Lighting(lighting:ILighting):void
		{
			this.lighting = lighting;
		}
		
		/*
		* Methods
		*/
		
		public function Initialize():void {}
		
		public function Update(time:Time):void {}
		
		public function Draw(device:GraphicsDevice):void {}
		
		public function Dispose():void {}
	}
}