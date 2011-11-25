package org.sumption.sorcerer.controller.startup
{
	import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
	import org.sumption.sorcerer.controller.turns.NextPlayerCommand;
	
	public class StartupCommand extends AsyncMacroCommand
	{
		override protected function initializeAsyncMacroCommand():void
		{
			addSubCommand(InitialiseControllerCommand);
			addSubCommand(InitialiseViewCommand);
			addSubCommand(InitialiseModelCommand);
			addSubCommand(LoadCardsAsyncCommand);
			addSubCommand(PrepareMapCommand);
			addSubCommand(AddPartyCommand);
			addSubCommand(NextPlayerCommand);
		}
	}
}