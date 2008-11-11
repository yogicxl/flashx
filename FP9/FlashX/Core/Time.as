package FlashX.Core
{
	public class Time
	{
		private var totalRealTime:int;
		private var elapsedRealTime:int;
		
		private var totalFlashTime:int;
		private var elapsedFlashTime:int;
		
		/*
		* Constructor
		*/
		
		public function Time(totalRealTime:int = 0, elapsedRealTime:int = 0, totalFlashTime:int = 0, elapsedFlashTime:int = 0)
		{
			this.totalRealTime = totalRealTime;
			this.elapsedRealTime = elapsedRealTime;
			this.totalFlashTime = totalFlashTime;
			this.elapsedFlashTime = elapsedFlashTime;
		}

        public function get TotalRealTime():int
		{
			return this.totalRealTime;
		}
		
        public function get ElapsedRealTime():int
		{
			return this.elapsedRealTime;
		}
		
        public function get TotalFlashTime():int
		{
			return this.totalFlashTime;
		}
		
        public function get ElapsedFlashTime():int
		{
			return this.elapsedFlashTime;
		}

        public function get IsRunningSlowly():Boolean
		{
			return false;
		}
		
		public function Clone():Time
		{
			return new Time(this.totalRealTime, this.elapsedRealTime, this.totalFlashTime, this.elapsedFlashTime);
		}
	}
}