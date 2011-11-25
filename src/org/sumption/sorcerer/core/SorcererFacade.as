package org.sumption.sorcerer.core
{
	import org.sumption.sorcerer.controller.startup.StartupCommand;
	
	import flash.display.Sprite;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class SorcererFacade extends Facade
	{
		public function SorcererFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String):SorcererFacade
		{
			if (!instanceMap[key])
			{
				instanceMap[key] = new SorcererFacade(key);
			}
			return instanceMap[key] as SorcererFacade;
		}
		
		public function startup(sprite:Sprite):void
		{
			sendNotification(SystemNotifcations.STARTUP, sprite);
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(SystemNotifcations.STARTUP, StartupCommand);
		}
	}
}