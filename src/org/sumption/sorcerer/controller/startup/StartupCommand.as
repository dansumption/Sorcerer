package org.sumption.sorcerer.controller.startup
{
    import org.robotlegs.mvcs.Command;
    import org.robotlegs.utilities.macrobot.SequenceCommand;
    import org.sumption.sorcerer.controller.turns.NextPlayerCommand;

    public class StartupCommand extends SequenceCommand
	{

        public function StartupCommand()
        {
            addCommand(LoadCardsAsyncCommand);
            addCommand(PrepareMapCommand);
            addCommand(AddPartyCommand);
            addCommand(NextPlayerCommand);
        }
	}
}