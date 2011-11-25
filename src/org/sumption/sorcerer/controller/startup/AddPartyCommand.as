package org.sumption.sorcerer.controller.startup
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.party.PartiesProxy;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	
	public class AddPartyCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var proxy:PartiesProxy = facade.retrieveProxy(PartiesProxy.NAME) as PartiesProxy;
			var party:PartyVO = new PartyVO();
			party.location = new LocationVectorVO(0, 0, 0);
			proxy.addParty(party);
		}
	}
}