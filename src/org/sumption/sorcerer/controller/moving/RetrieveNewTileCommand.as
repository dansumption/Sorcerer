package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.signal.AddTile;
    import org.sumption.sorcerer.utils.MapUtils;

    public class RetrieveNewTileCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var addTile:AddTile;

        private var toTile:TileVO;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && !partyMoveVo.leavingGame)
            {
                retrieveNewTile();
            }
        }

        private function retrieveNewTile():void
        {
            trace("retrieve new tile");
            assignTargetTile();
            if (toTile == null)
            {
                addTile.dispatch(partyMoveVo.party.location);
                assignTargetTile();
                trace ("Added new tile " + toTile);
            }
            addStairsToTargetTile();
        }

        private function assignTargetTile():void
        {
            toTile = mapModel.getTile(partyMoveVo.party.location);
        }

        private function addStairsToTargetTile():void
        {
            // Stairs never lead to dead ends
            if (partyMoveVo.direction == MapUtils.UP)
            {
                toTile.down = true;
            }
            else if (partyMoveVo.direction == MapUtils.DOWN)
            {
                toTile.up = true;
            }
        }
    }
}