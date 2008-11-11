package FlashX.Graphics.Filters
{
	import FlashX.Core.*;
	import FlashX.Math.*;
	import FlashX.Graphics.*;
	
	public class DefaultFilter extends BasicFilter
	{
		public function DefaultFilter()
		{
			//this.World = Matrix4.Identity;
			//this.View = Matrix4.Identity;
			//this.Projection = Matrix4.Identity;
		}
		
		public override function Begin(device:GraphicsDevice):void
		{
			//trace(this.World, this.View, this.Projection);
			device.Filter = this;
			
		}
		
		public override function End(device:GraphicsDevice):void
		{
			device.Filter = null;
		}
	}
	
}