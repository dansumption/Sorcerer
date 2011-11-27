package org.sumption.sorcerer.view
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
    import flash.display.Stage;
    import flash.events.KeyboardEvent;
	
    import org.robotlegs.mvcs.Mediator;
    import org.sumption.sorcerer.Sorcerer;

    public class InteractiveMediator extends Mediator
	{
		public function enable():void
		{
            trace(this + " add key listener to " + stage);
			if (stage)
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, false);
			}
		}
		
		public function disable():void
		{
            trace(this + " remove key listener from " + stage);
			if (stage)
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			}
		}
		
		protected function get centreX():Number
		{
			return stage.stageWidth/2;
		}
		
		protected function get centreY():Number
		{
			return stage.stageHeight/2;
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			throw new Error('Extending class does not override onKeyDown');
		}

        protected function get stage():Stage
        {
            return viewComponent.stage;
        }
	}
}