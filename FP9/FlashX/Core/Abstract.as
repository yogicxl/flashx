package FlashX.Core
{
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	public class Abstract
	{
		/*
		* Constructor
		*/
		
		public function Abstract()
		{
			if (getQualifiedSuperclassName(this).substr(-8) == "Abstract")
				throw new Error(getQualifiedClassName(this) + " is abstract and must be extended.");
		}
	}
}