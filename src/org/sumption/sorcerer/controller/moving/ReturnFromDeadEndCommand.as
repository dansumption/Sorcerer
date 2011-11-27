package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.party.PartyMoveVO;

    public class ReturnFromDeadEndCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && partyMoveVo.deadEnd)
            {
                returnFromDeadEnd();
            }
        }

        private function returnFromDeadEnd():void
        {
            trace("return from dead end - TODO");
            // TODO: return
        }
    }
}