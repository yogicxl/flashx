package FlashX.Core.Components
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public class BasicComponent extends Abstract implements IComponent
	{
		private var active:Boolean;
		
		/*
		* Properties
		*/
		
		public function get Active():Boolean
		{
			return this.active;
		}
		
		public function set Active(active:Boolean):void
		{
			this.active = active;
		}
		
		/*
		* Methods
		*/
		
		public function Initialize():void {}
		
		public function Update(time:Time):void {}
		
		public function Dispose():void {}
	}
}