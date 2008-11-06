package FlashX.Graphics.Components
{
	import FlashX.Graphics.*;
	
	import FlashX.Core.Abstract;
	
	import FlashX.Mathematics.Vector;
	import FlashX.Mathematics.Quaternion;
	
	public class BasicComponent extends Abstract implements Component
	{
		private var position:Vector;
		private var rotation:Vector;
		
		private var direction:Quaternion;
		
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