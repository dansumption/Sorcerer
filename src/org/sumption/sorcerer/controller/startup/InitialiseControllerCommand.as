package org.sumption.sorcerer.controller.startup
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.controller.AddTileCommand;
	import org.sumption.sorcerer.controller.moving.MovePartyMacroCommand;
	import org.sumption.sorcerer.controller.turns.NextPlayerCommand;
	import org.sumption.sorcerer.core.SystemNotifcations;
	
	public class InitialiseControllerCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerCommand(SystemNotifcations.ADD_TILE, AddTileCommand);
			facade.registerCommand(SystemNotifcations.MOVE_PARTY, MovePartyMacroCommand);
			facade.registerCommand(SystemNotifcations.NEXT_PLAYER, NextPlayerCommand);
		}
	}
}