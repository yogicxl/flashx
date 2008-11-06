package FlashX.Graphics
{
	public interface IComponent extends IDrawable, IUpdateable, IDisposable
	{
		/*
		* Properties
		*/
		function get Visible():Boolean;
		function set Visible(visible:Boolean):void;
		
		function Initialize():void;
	}
}