package FlashX.Core
{
	public class TimeHandler
	{
		private var startTime:Number;
		private var currentTime:Time;
		
		/*
		* Constructor
		*/
		
		public function TimeHandler()
		{
			this.startTime = (new Date()).milliseconds;
			this.currentTime = new Time();
			
			//trace(this.startTime);
			this.Update();
		}
		
		/*
		* Properties
		*/
		
		public function get CurrentTime():Time
		{
			return this.currentTime;
		}
		
		public function Difference(time:Time)
		{
			return new Time(this.currentTime.TotalRealTime - time.TotalRealTime, this.currentTime.ElapsedRealTime - time.ElapsedRealTime, this.currentTime.TotalFlashTime - time.TotalFlashTime, this.currentTime.ElapsedFlashTime - time.ElapsedFlashTime);
		}
		
		public function Update()
		{
			var now:Number = (new Date()).milliseconds;
			
			var totalRealTime:int = now - this.startTime;
			var totalFlashTime:int = now - this.startTime;

			var elapsedRealTime:int = totalRealTime - this.currentTime.TotalRealTime;
			var elapsedFlashTime:int = totalFlashTime - this.currentTime.TotalFlashTime;
			
			this.currentTime = new Time(totalRealTime, elapsedRealTime, totalFlashTime, elapsedFlashTime);
		}
		
		/*
		* Static Methods
		*/
		
		//public static function Difference(t1:Time, t2:Time)
		//{
			//return t1.Clone().Difference(t2);
		//}
	}
}