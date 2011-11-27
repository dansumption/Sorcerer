package org.sumption.sorcerer.model
{
    import org.sumption.sorcerer.model.party.*;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.party.PartiesVO;
	import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.PartyAdded;

    public class PartiesModel
	{
        [Inject]
        public var partyAdded:PartyAdded;

		private var data:PartiesVO;

		public function PartiesModel()
		{
			data = new PartiesVO();
            trace(this + " create");
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
            partyAdded.dispatch(partyVo)
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