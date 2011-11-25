package org.sumption.sorcerer.view
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.sumption.sorcerer.core.SystemNotifcations;
	
	public class StageMediator extends InteractiveMediator
	{
		public static const NAME:String = "org.sumption.sorcerer.view.StageMediator"; 
		
		public function StageMediator(viewComponent:Stage)
		{
			super(NAME, viewComponent);
		}
		
		private function get stage():Stage
		{
			return viewComponent as Stage;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				SystemNotifcations.ENABLE_INPUT,
				SystemNotifcations.DISABLE_INPUT
				];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case SystemNotifcations.ENABLE_INPUT:
				{
					enable();
					break;
				}
				case SystemNotifcations.DISABLE_INPUT:
				{
					disable();
					break;
				}
			}
		}
		
		
		override protected function onKeyDown(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				case Keyboard.SPACE:
				{
					event.stopImmediatePropagation();
					sendNotification(SystemNotifcations.RESTART_GAME);
					break;
				}
				case Keyboard.EQUAL:
				{
					event.stopImmediatePropagation();
					sendNotification(SystemNotifcations.ZOOM_IN);
					break;
				}
				case Keyboard.MINUS:
				{
					event.stopImmediatePropagation();
					sendNotification(SystemNotifcations.ZOOM_OUT);
					break;
				}
			}
		}
	}
}