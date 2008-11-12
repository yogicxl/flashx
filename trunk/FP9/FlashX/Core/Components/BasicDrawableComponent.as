package FlashX.Core.Components
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicDrawableComponent extends Abstract implements IDrawableComponent
	{
		private var world:IMatrix;
		private var view:IMatrix;
		private var projection:IMatrix;
		
		private var visible:Boolean;
		private var active:Boolean;
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
		* Methods
		*/
		
		public function Initialize():void {}
		
		public function Update(time:Time):void {}

		public function Draw(device:GraphicsDevice):void {}
		
		public function Dispose():void {}
	}
}