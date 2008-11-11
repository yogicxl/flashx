package FlashX.Graphics.Filters
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicFilter extends Abstract implements IFilter
	{
		private var world:IMatrix;
		private var view:IMatrix;
		private var projection:IMatrix;
		
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
		
		public function Begin(device:GraphicsDevice):void {}
		public function End(device:GraphicsDevice):void {}
	}
}