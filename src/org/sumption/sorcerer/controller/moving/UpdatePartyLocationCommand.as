package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.utils.MapUtils;

    public class UpdatePartyLocationCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed)
            {
                updatePartyLocation();
            }
        }

        private function updatePartyLocation():void
        {
            trace("update party location");
            var party:PartyVO = partyMoveVo.party;
            var moveVector:LocationVectorVO = MapUtils.vector(partyMoveVo.direction);

            party.location.add(moveVector);
            trace("Party location now " + party.location);
            party.positionOnTile = MapUtils.opposite(partyMoveVo.direction);

            if (party.location.z < 0)
            {
                partyMoveVo.leavingGame = true;
                // TODO - handle end of game/leaving cavern
            }
        }
    }
}