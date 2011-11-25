package org.sumption.sorcerer.model.party
{
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.party.PartiesVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	
	public class PartiesProxy extends Proxy
	{
		public static const NAME:String = "org.sumption.sorcerer.model.PartiesProxy"; 
		
		public function PartiesProxy()
		{
			super(NAME, new PartiesVO());
		}
		
		private function get vo():PartiesVO
		{
			return data as PartiesVO;
		}
		
		public function get currentParty():PartyVO
		{
			return vo.currentParty;
		}
		
		public function advanceAndRetrieveNextParty():PartyVO
		{
			vo.currentPartyIndex++;
			if (vo.currentPartyIndex >= vo.allParties.length)
			{
				vo.currentPartyIndex = 0;
			}
			return vo.currentParty;
		}
		
		public function addParty(partyVo:PartyVO):void
		{
			partyVo.id = vo.allocatedPartyIndex++;
			vo.allParties.push(partyVo);
			sendNotification(SystemNotifcations.PARTY_ADDED, partyVo);
		}
		
		public function getPartyById(id:uint):PartyVO
		{
			var len:uint = vo.allParties.length;
			var party:PartyVO;
			for (var i:uint = 0; i < len; i++)
			{
				party = vo.allParties[i];
				if (party.id == id)
				{
					return party;
				}
			}
			return null;
		}
	}
}