package FlashX.Input
{
	public dynamic class KeyboardState
	{
        public function KeyboardState()
		{
			for(var i = 0, l = 255; i < l; ++i)
				this[i] = false;
		}
		
		public function IsKeyDown(key:uint)
		{
			return this[key];
		}
		
		public function IsKeyUp(key:uint)
		{
			return !this[key];
		}
		
		public function Clone()
		{
			var state:KeyboardState = new KeyboardState();
			
			for(var i = 0, l = 255; i < l; ++i)
				state[i] = this[i];
			
			return state;
		}
	}
}