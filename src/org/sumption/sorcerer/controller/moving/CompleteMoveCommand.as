package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.EnableInput;
    import org.sumption.sorcerer.signal.NextPlayer;

    public class CompleteMoveCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var nextPlayer:NextPlayer;

        [Inject]
        public var enableInput:EnableInput;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && !partyMoveVo.leavingCavern)
            {
                completeMove();
            }
            else
            {
                enableInput.dispatch();
            }

        }

        private function completeMove():void
        {
            trace("completeMove");
            var party:PartyVO = partyMoveVo.party;
            var toTile:TileVO = mapModel.getTile(party.location);
            toTile.fullyExplored = true;
            nextPlayer.dispatch();
        }
    }
}