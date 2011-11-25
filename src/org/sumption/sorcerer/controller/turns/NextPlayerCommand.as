package org.sumption.sorcerer.controller.turns
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.party.PartiesProxy;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.view.PartiesMediator;
	
	public class NextPlayerCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var partiesProxy:PartiesProxy = facade.retrieveProxy(PartiesProxy.NAME) as PartiesProxy;
			var party:PartyVO = partiesProxy.advanceAndRetrieveNextParty();
			sendNotification(SystemNotifcations.RENDER, party.location);
			
			var partiesMediator:PartiesMediator = facade.retrieveMediator(PartiesMediator.NAME) as PartiesMediator;
			partiesMediator.enable();
		}
	}
}