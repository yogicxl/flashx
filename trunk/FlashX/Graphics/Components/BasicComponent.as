package FlashX.Graphics.Components
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class BasicComponent extends Abstract implements IComponent
	{
		private var position:IVector;
		private var rotation:IVector;
		
		private var direction:IQuaternion;
		
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
		
		/*
		* Methods
		*/
		
		public function Initialize():void {}
		
		public function Update(time:Time):void {}

		public function Draw(device:GraphicsDevice):void {}
		
		public function Dispose():void {}
	}
}