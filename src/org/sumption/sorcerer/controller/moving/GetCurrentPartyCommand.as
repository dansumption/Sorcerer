package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.party.PartiesProxy;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.view.PartiesMediator;
	
	public class GetCurrentPartyCommand extends SimpleCommand
	{
		private var partyMoveVo:PartyMoveVO;
		
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			var partiesMediator:PartiesMediator = facade.retrieveMediator(PartiesMediator.NAME) as PartiesMediator;
			partiesMediator.enable();
			
			partyMoveVo = notification.getBody() as PartyMoveVO;
			var partiesProxy:PartiesProxy = facade.retrieveProxy(PartiesProxy.NAME) as PartiesProxy;
			partyMoveVo.party = partiesProxy.currentParty;
		}
	}
}