package FlashX.Core
{
	public interface IComponent extends IUpdateable, IDisposable
	{
		/*
		* Properties
		*/
		
		function Initialize():void;
	}
}