package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.PartiesModel;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.signal.DisableInput;
    import org.sumption.sorcerer.view.PartiesMediator;

    public class GetCurrentPartyCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var partiesModel:PartiesModel;

        [Inject]
        public var disableInput:DisableInput;

        override public function execute():void
        {
            trace(this + ".execute()");
            trace("Move direction is " + partyMoveVo.direction);
            disableInput.dispatch();
            partyMoveVo.party = partiesModel.currentParty;
        }
    }
}