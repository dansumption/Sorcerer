package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.signal.AddTile;

    public class RetrieveNewTileCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var addTile:AddTile;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && !partyMoveVo.leavingCavern)
            {
                retrieveNewTile();
            }
        }

        private function retrieveNewTile():void
        {
            trace("retrieve new tile");
            var toTile:TileVO = mapModel.getTile(partyMoveVo.party.location);
            if (toTile == null)
            {
                addTile.dispatch(partyMoveVo.party.location);
            }
        }
    }
}