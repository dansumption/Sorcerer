package org.sumption.sorcerer.model.party
{
	public class PartyMoveVO
	{
		public var partyId:uint;
		public var party:PartyVO;
		public var direction:uint;
		public var allowed:Boolean = true;
		public var deadEnd:Boolean = false;
		public var leavingCavern:Boolean = false;
	}
}