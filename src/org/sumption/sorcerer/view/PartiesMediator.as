package org.sumption.sorcerer.view
{
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    import org.sumption.sorcerer.model.MapModel;

    import org.sumption.sorcerer.model.PartiesModel;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.DisableInput;
    import org.sumption.sorcerer.signal.EnableInput;
    import org.sumption.sorcerer.signal.MoveParty;
    import org.sumption.sorcerer.signal.NextPlayer;
    import org.sumption.sorcerer.signal.PartyAdded;
    import org.sumption.sorcerer.signal.Render;
    import org.sumption.sorcerer.utils.MapUtils;
    import org.sumption.sorcerer.utils.Scale;
    import org.sumption.sorcerer.view.parties.PartiesView;
    import org.sumption.sorcerer.view.parties.PartySprite;

    public class PartiesMediator extends InteractiveMediator
    {
        [Inject]
        public var render:Render;

        [Inject]
        public var partyAdded:PartyAdded;

        [Inject]
        public var movePartySignal:MoveParty;

        [Inject]
        public var view:PartiesView;

        [Inject]
        public var partiesModel:PartiesModel;

        [Inject]
        public var enableInput:EnableInput;

        [Inject]
        public var disableInput:DisableInput;

        [Inject]
        public var mapModel:MapModel;


        override public function onRegister():void
        {
            trace(this + ".onRegister");
            render.add(onRender);
            partyAdded.add(addParty);
            enableInput.add(enable);
            disableInput.add(disable);
        }

        private function addParty(partyVo:PartyVO):void
        {
            var partySprite:PartySprite = new PartySprite(partyVo);
            getViewComponent().addChild(partySprite);
            partySprite.draw();
        }

        private function onRender(mapCentre:LocationVectorVO):void
        {
            getViewComponent().x = centreX;
            getViewComponent().y = centreY;
            getViewComponent().render(mapCentre, Scale.scale( Scale.SIZES[mapModel.sizeIndex]));
        }

        override protected function onKeyDown(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case Keyboard.UP:
                {
                    moveParty(MapUtils.NORTH);
                    break;
                }
                case Keyboard.RIGHT:
                {
                    moveParty(MapUtils.EAST);
                    break;
                }
                case Keyboard.DOWN:
                {
                    moveParty(MapUtils.SOUTH);
                    break;
                }
                case Keyboard.LEFT:
                {
                    moveParty(MapUtils.WEST);
                    break;
                }
                case Keyboard.A:
                {
                    moveParty(MapUtils.UP);
                    break;
                }
                case Keyboard.Z:
                {
                    moveParty(MapUtils.DOWN);
                    break;
                }
            }
        }

        private function moveParty(direction:uint):void
        {
            var partyMoveVo:PartyMoveVO = new PartyMoveVO();
            partyMoveVo.direction = direction;
            movePartySignal.dispatch(partyMoveVo);
        }
    }
}