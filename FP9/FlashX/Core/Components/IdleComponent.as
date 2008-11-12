package FlashX.Core.Components
{
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.display.MovieClip;
	
	import FlashX.Core.*;
	
	public class IdleComponent extends BasicComponent
	{
		private var mc:MovieClip;
		
		public function IdleComponent(mc:MovieClip, fps:FramesComponent)
		{
			this.Active = true;
			
			this.mc = mc;
		}
		
		public override function Initialize():void
		{
			this.mc.stage.addEventListener(Event.DEACTIVATE, this.DeactivateListener);
			this.mc.stage.addEventListener(Event.ACTIVATE, this.ActivateListener);
		}
		
		public function DeactivateListener()
		{
			//this.active = false;
		}
		
		public function ActivateListener()
		{
			//this.active = true;
		}
	}
}