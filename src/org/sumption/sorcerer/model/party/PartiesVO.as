package org.sumption.sorcerer.model.party
{
	public class PartiesVO
	{
		public var allParties:Vector.<PartyVO> = new Vector.<PartyVO>();
		public var currentPartyIndex:uint = 0;
		public var allocatedPartyIndex:uint = 0;
		
		public function get currentParty():PartyVO
		{
			return allParties[currentPartyIndex];
		}
	}
}