package org.sumption.sorcerer.view
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.events.KeyboardEvent;
	
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class InteractiveMediator extends Mediator
	{
		public function InteractiveMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		public function enable():void
		{
			var stage:DisplayObject = InteractiveObject(getViewComponent()).stage;
			if (stage)
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, false);
			}
		}
		
		public function disable():void
		{
			var stage:DisplayObject = InteractiveObject(getViewComponent()).stage;
			if (stage)
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			}
		}
		
		protected function get centreX():Number
		{
			return DisplayObject(viewComponent).stage.stageWidth/2;
		}
		
		protected function get centreY():Number
		{
			return DisplayObject(viewComponent).stage.stageHeight/2;
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			throw new Error('Extending class does not override onKeyDown');
		}
	}
}