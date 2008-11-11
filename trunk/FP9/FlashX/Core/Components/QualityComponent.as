package FlashX.Core.Components
{
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.display.MovieClip;
	
	import FlashX.Core.*;
	
	public class QualityComponent extends BasicComponent
	{
		private var fr:Number;
		private var buffer:Number;
		private var stage:Stage;
		
		public function QualityComponent(parent:MovieClip)
		{
			this.stage = parent.stage;
			this.fr = parent.stage.frameRate;
			this.buffer = 5;
		}
		
		public override function Initialize():void
		{
			
		}

		public override function Update(time:Time):void
		{
			if(stage.frameRate <= this.fr - this.buffer)
				this.stage.quality = StageQuality.LOW;
			
			else if((this.stage.frameRate > this.fr - this.buffer) && (this.stage.frameRate < this.fr + this.buffer))
				this.stage.quality = StageQuality.MEDIUM;
			
			else if(this.stage.frameRate >= this.fr + this.buffer)
				this.stage.quality = StageQuality.HIGH;
			
			else if(this.stage.frameRate >= this.fr + this.buffer * 1.5)
				this.stage.quality = StageQuality.BEST;
		}
	}
}