package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.EnterCavern;

    public class HandleEncountersCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var enterCavern:EnterCavern;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && !partyMoveVo.leavingGame)
            {
                handleEncounter();
            }
        }

        private function handleEncounter():void
        {
            var party:PartyVO = partyMoveVo.party;
            var toTile:TileVO = mapModel.getTile(party.location);
            if (toTile.cavern)
            {
                trace("Cavern contents:" + toTile.cards);
                enterCavern.dispatch(toTile);
            }
        }
    }
}