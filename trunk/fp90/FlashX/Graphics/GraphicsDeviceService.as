package FlashX.Graphics
{
	public class GraphicsDeviceService
	{
		internal static var instance:GraphicsDeviceService;
		
		public static function get Instance():GraphicsDeviceService
		{
			if(instance == null)
			{
				instance = new GraphicsDeviceService();
			}
			
			return instance;
		}
		
		/*
		*
		*/
		
		private var graphicsDevice:GraphicsDevice;
		
		/*
		* Properties
		*/
		
		public function get Device():GraphicsDevice
		{
			return this.graphicsDevice;
		}
		
		/*
		* Constructor
		*/
		
		public function GraphicsDeviceService()
		{
			this.graphicsDevice = new GraphicsDevice();
		}
		
		
		
		
	}
}