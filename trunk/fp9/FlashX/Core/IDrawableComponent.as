package FlashX.Core
{
	public interface IDrawableComponent extends IDrawable, IComponent
	{
		function get Visible():Boolean;
		function set Visible(visible:Boolean):void;
	}
}