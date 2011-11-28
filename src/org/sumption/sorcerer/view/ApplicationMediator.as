package org.sumption.sorcerer.view
{
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    import org.sumption.sorcerer.Sorcerer;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.PartiesModel;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.DisableInput;
    import org.sumption.sorcerer.signal.EnableInput;
    import org.sumption.sorcerer.signal.Render;
    import org.sumption.sorcerer.signal.ZoomIn;
    import org.sumption.sorcerer.signal.ZoomOut;

    public class ApplicationMediator extends InteractiveMediator
    {
        [Inject]
        public var view:Sorcerer;

        [Inject]
        public var enableInput:EnableInput;

        [Inject]
        public var disableInput:DisableInput;

        [Inject]
        public var zoomIn:ZoomIn;

        [Inject]
        public var zoomOut:ZoomOut;

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
                    zoomIn.dispatch();
                    break;
                }
                case Keyboard.MINUS:
                {
                    event.stopImmediatePropagation();
                    zoomOut.dispatch();
                    break;
                }
            }
        }
    }
}