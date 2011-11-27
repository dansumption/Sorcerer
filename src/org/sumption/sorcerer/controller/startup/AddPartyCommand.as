package org.sumption.sorcerer.controller.startup
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.PartiesModel;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	
	public class AddPartyCommand extends Command
	{
        [Inject]
        public var partiesModel:PartiesModel;

		override public function execute():void
		{
			var party:PartyVO = new PartyVO();
			party.location = new LocationVectorVO(0, 0, 0);
			partiesModel.addParty(party);
		}
	}
}