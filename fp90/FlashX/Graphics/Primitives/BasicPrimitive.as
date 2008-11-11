package FlashX.Graphics.Primitives
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicPrimitive extends Abstract implements IPrimitive
	{
		protected var vertices:Array;
		protected var indices:Array;

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

		/*
		* Primitive Properties
		*/
		
		public function get Vertices():Array
		{
			return this.vertices;
		}
		
		public function get Indices():Array
		{
			return this.indices;
		}
		
		/*
		* Abstract Methods
		*/
		
		public function Draw(device:GraphicsDevice):void {}
	}
}