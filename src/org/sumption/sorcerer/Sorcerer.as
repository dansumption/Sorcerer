package org.sumption.sorcerer
{
	import flash.display.Sprite;
	
	import org.sumption.sorcerer.core.SorcererFacade;
	
	[SWF(width="800", height="800", backgroundColor="#FFFFFF")]
	
	public class Sorcerer extends Sprite
	{
		public static const NAME:String = "org.sumption.sorcerer";

		public function Sorcerer()
		{
			init();
		}
		
		private function init():void
		{
			SorcererFacade.getInstance(NAME).startup(this);
		}
	}
}