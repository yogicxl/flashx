package FlashX.Graphics
{
	public interface Component extends Drawable, Updateable, Disposable
	{
		/*
		* Properties
		*/
		function get Visible():Boolean;
		function set Visible(visible:Boolean):void;
		
		function Initialize():void;
	}
}