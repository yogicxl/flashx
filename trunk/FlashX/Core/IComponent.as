package FlashX.Core
{
	public interface IComponent extends IUpdateable, IDisposable
	{
		/*
		* Properties
		*/
		
		function get Visible():Boolean;
		function set Visible(visible:Boolean):void;
		
		function Initialize():void;
	}
}