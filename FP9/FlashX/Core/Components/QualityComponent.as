package FlashX.Core.Components
{
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.display.MovieClip;
	
	import FlashX.Core.*;
	
	public class QualityComponent extends BasicComponent
	{
		private var stage:Stage;
		private var fps:FramesComponent;
		
		public function QualityComponent(parent:MovieClip, fps:FramesComponent)
		{
			this.Active = true;
			
			this.stage = parent.stage;
			this.fps = fps;
		}
		
		public override function Initialize():void
		{
			
		}

		public override function Update(time:Time):void
		{
			if(this.fps.fps > 50)
				this.stage.quality = StageQuality.BEST;
			else if(this.fps.fps > 40)
				this.stage.quality = StageQuality.HIGH;
			else if(this.fps.fps > 30)
				this.stage.quality = StageQuality.MEDIUM;
			else
				this.stage.quality = StageQuality.LOW;
		}
	}
}