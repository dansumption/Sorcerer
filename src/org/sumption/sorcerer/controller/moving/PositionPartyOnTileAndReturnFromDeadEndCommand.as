package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.utils.MapUtils;

    public class PositionPartyOnTileAndReturnFromDeadEndCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed)
            {
                if (partyMoveVo.deadEnd)
                {
                    returnFromDeadEnd();
                }
                else
                {
                    positionPartyOnTile();
                }
            }
        }

        private function returnFromDeadEnd():void
        {
            var party:PartyVO = partyMoveVo.party;
            party.positionOnTile = partyMoveVo.direction;
            partyMoveVo.direction = MapUtils.opposite(partyMoveVo.direction);
            var moveVector:LocationVectorVO = MapUtils.directionToVector(partyMoveVo.direction);

            party.location.add(moveVector);
            trace("Party returned to " + party.location);
        }

        private function positionPartyOnTile():void
        {
            var toTile:TileVO = mapModel.getTile(partyMoveVo.party.location);
            if (toTile.cavern && !toTile.fullyExplored)
            {
                partyMoveVo.party.positionOnTile = MapUtils.opposite(partyMoveVo.direction);
            }
            else
            {
                partyMoveVo.party.positionOnTile = 0;
            }
        }
    }
}