package FlashX.Core
{
	public interface IComponent extends IUpdateable, IDisposable
	{
		/*
		* Properties
		*/
		
		function Initialize():void;
		
		function get Active():Boolean;
		function set Active(active:Boolean):void;
	}
}