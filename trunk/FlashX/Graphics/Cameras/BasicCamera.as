package FlashX.Graphics.Cameras
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;

	public class BasicCamera extends Abstract implements ICamera
	{
		private var position:IVector;
		private var rotation:IVector;
		private var direction:IQuaternion;
		
		private var view:IMatrix;
		
		private var visible:Boolean;

		/*
		* Properties
		*/
		
		public function set Visible(visible:Boolean):void
		{
			this.visible = visible;
		}
		
		public function get Visible():Boolean
		{
			return this.visible;
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
		* Camera Properties
		*/
		
		public function get View():IMatrix
		{
			return this.view;
		}
		
		public function set View(view:IMatrix):void
		{
			this.view = view;
		}
		
		/*
		* Methods
		*/
		
		public function Initialize():void {}
		
		public function Update(time:Time):void {}
		
		public function Dispose():void {}
	}
}