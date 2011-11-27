package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.utils.MapUtils;

    public class CheckForDeadEndCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && !partyMoveVo.leavingCavern)
            {
                checkForDeadEnd();
            }
        }

        private function checkForDeadEnd():void
        {
            trace("check for dead end");
            var party:PartyVO = partyMoveVo.party;
            var toTile:TileVO = mapModel.getTile(party.location);

            if (!toTile.hasExitInDirection(party.positionOnTile) &&
                    partyMoveVo.direction != MapUtils.UP &&
                    partyMoveVo.direction != MapUtils.DOWN)
            {
                partyMoveVo.deadEnd = true;
                toTile.explored = party.positionOnTile | toTile.explored;
            }

        }
    }
}