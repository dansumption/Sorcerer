package org.sumption.sorcerer.view
{
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    import org.sumption.sorcerer.Sorcerer;
    import org.sumption.sorcerer.signal.DisableInput;
    import org.sumption.sorcerer.signal.EnableInput;

    public class ApplicationMediator extends InteractiveMediator
    {
        [Inject]
        public var view:Sorcerer;

        [Inject]
        public var enableInput:EnableInput;

        [Inject]
        public var disableInput:DisableInput;

        override public function onRegister():void
        {
            trace(this + ".onRegister");
            view.createChildren();
            enableInput.add(enable);
            disableInput.add(disable);
        }

        override protected function onKeyDown(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                // TODO - add command to restart game
                case Keyboard.EQUAL:
                {
                    event.stopImmediatePropagation();
                    // TODO - add zoom in
                    break;
                }
                case Keyboard.MINUS:
                {
                    event.stopImmediatePropagation();
                    // TODO - add zoom out
                    break;
                }
            }
        }
    }
}