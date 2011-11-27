package org.sumption.sorcerer.controller.turns
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.PartiesModel;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.EnableInput;
    import org.sumption.sorcerer.signal.Render;
    import org.sumption.sorcerer.view.PartiesMediator;

    public class NextPlayerCommand extends Command
	{
        [Inject]
        public var partiesModel:PartiesModel;
        
        [Inject]
        public var render:Render;

        [Inject]
        public var enableInput:EnableInput;
        
		override public function execute():void
		{
            // TODO (possibly) advance to next party
			var party:PartyVO = partiesModel.advanceAndRetrieveNextParty();
            render.dispatch(party.location);
            enableInput.dispatch();
		}
	}
}