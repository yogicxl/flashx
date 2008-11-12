package FlashX
{
	import FlashX.Core.*;
	import FlashX.Core.Components.*;
	
	import FlashX.Graphics.*;
	import FlashX.Graphics.Cameras.FreeCamera;
	
	import FlashX.Input.*;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.events.*;
	import flash.display.*;
	
	public class Program
	{
		private var active:Boolean;
		
		private var mc:MovieClip;
		private var stage:Stage;
		
		private var timer:TimeHandler;
		
		private var components:Array;
		public var drawableComponents:Array;
		
		public var keyboard:KeyboardDevice;
		public var mouse:MouseDevice;
		
		public var graphics:GraphicsDevice;
		
		public function Program(mc:MovieClip)
		{
			this.mc = mc;
			this.active = true;
			
			this.components = new Array();
			this.drawableComponents = new Array();
			
			this.timer = new TimeHandler();
			
			this.keyboard = new KeyboardDevice(this.mc);
			this.graphics = GraphicsDeviceService.Instance.Device;
			this.mouse = new MouseDevice(this.mc);
			this.mc.addChild(mouse);
			this.Initialize();
		}
		
		public function Initialize()
		{
			this.mc.stage.showDefaultContextMenu = false;
			this.mc.stage.quality = StageQuality.LOW;
			
			this.InitializeGraphics();
			this.InitializeComponents();
			this.InitializeCamera();
			this.InitializeKeyboard();
			this.InitializeMouse();
			
			this.mc.addEventListener(Event.ENTER_FRAME, this.Main);
			
			trace("FlashX started.");
		}
		
		public function InitializeComponents()
		{
			var fps:FramesComponent = new FramesComponent(this.mc, this.mc.stage.stageWidth - 185, 25, 200, 100);
			
			fps.Initialize();
			
			this.drawableComponents.push(fps);
			
			var ram:IDrawableComponent = new MemoryComponent(this.mc, this.mc.stage.stageWidth - 185, 85, 200, 100);
			
			ram.Initialize();
			
			this.drawableComponents.push(ram);
			
			var quality:IComponent = new QualityComponent(this.mc, fps);
			
			quality.Initialize();
			
			this.components.push(quality);
			
			
			
		}
		
		public function InitializeGraphics()
		{
			this.graphics.bmp = new Bitmap(this.graphics.drawer);
			this.mc.addChild(this.graphics.bmp);
		}
		
		public function InitializeKeyboard()
		{

		}
		
		public function InitializeMouse()
		{
			this.mouse.DisableRightClick();
		}
		
		public function InitializeCamera()
		{
			var camera:ICamera = new FreeCamera();
			
			camera.Initialize();
			
			this.components.push(camera);
		}
		
		public function Main(e:Event)
		{
			var self:Program = this;
			
			if(this.active)
			{
				//var component:IComponent;
				
				this.timer.Update();
				
				this.graphics.drawer.fillRect(this.graphics.drawer.rect, 0xFF000000);
				
				for each(var component:IComponent in this.components)
				{
					component.Update(timer.CurrentTime);
				}
				
				for each(var drawableComponent:IDrawableComponent in this.drawableComponents)
				{
					drawableComponent.Update(timer.CurrentTime);
				
					drawableComponent.Draw(self.graphics);
				}
			}
		}
		
		
	}
}