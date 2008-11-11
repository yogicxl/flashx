package FlashX.Core.Components
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	
	public class BasicComponent extends Abstract implements IComponent
	{
		/*
		* Methods
		*/
		
		public function Initialize():void {}
		
		public function Update(time:Time):void {}
		
		public function Dispose():void {}
	}
}