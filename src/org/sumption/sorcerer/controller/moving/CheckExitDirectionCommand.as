package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;

    public class CheckExitDirectionCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        override public function execute():void
        {
            trace(this + ".execute()");
            var fromTile:TileVO = mapModel.getTile(partyMoveVo.party.location);
            trace ("Party move direction: " + partyMoveVo.direction);
            if (!fromTile.hasExitInDirection(partyMoveVo.direction))
            {
                trace("INVALID MOVE - no exit in that direction");
                partyMoveVo.allowed = false;
            }
            else
            {
                trace("move not blocked yet - but may be if new tile throws up dead end");
            }
        }
    }
}