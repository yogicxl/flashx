package FlashX.Core
{
	import flash.utils.getQualifiedClassName;
	
	public class Abstract
	{
		/*
		* Constructor
		*/
		
		public function Abstract()
		{
			if (getQualifiedClassName(this).substr(8,8) == "abstract")
				throw new Error("Class is abstract and must be extended.");
		}
	}
}