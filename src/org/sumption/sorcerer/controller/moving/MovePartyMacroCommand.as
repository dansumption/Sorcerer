package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.MacroCommand;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.party.PartiesProxy;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.utils.MapUtils;
	
	public class MovePartyMacroCommand extends MacroCommand
	{
		override protected function initializeMacroCommand():void
		{
			addSubCommand(GetCurrentPartyCommand);
			addSubCommand(CheckExitDirectionCommand);
			addSubCommand(UpdatePartyLocationCommand);
			addSubCommand(RetrieveNewTileCommand);
			addSubCommand(CheckForDeadEndCommand);
			addSubCommand(ReturnFromDeadEndCommand);
			addSubCommand(HandleEncountersCommand);
			addSubCommand(CompleteMoveCommand);
		}
	}
}