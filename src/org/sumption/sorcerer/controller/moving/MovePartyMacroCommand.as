package org.sumption.sorcerer.controller.moving
{
    import org.robotlegs.utilities.macrobot.SequenceCommand;
    import org.sumption.sorcerer.model.party.PartyMoveVO;

    public class MovePartyMacroCommand extends SequenceCommand
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        override public function execute():void
        {
            addCommand(GetCurrentPartyCommand, partyMoveVo);
            addCommand(CheckExitDirectionCommand, partyMoveVo);
            addCommand(UpdatePartyLocationCommand, partyMoveVo);
            addCommand(RetrieveNewTileCommand, partyMoveVo);
            addCommand(CheckForDeadEndCommand, partyMoveVo);
            addCommand(ReturnFromDeadEndCommand, partyMoveVo);
            addCommand(HandleEncountersCommand, partyMoveVo);
            addCommand(CompleteMoveCommand, partyMoveVo);
            super.execute();
        }
    }
}