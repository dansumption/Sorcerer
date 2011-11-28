/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 28/11/11
 * Time: 12:35
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.controller
{
    import org.robotlegs.mvcs.Command;
    import org.robotlegs.mvcs.SignalCommand;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.PartiesModel;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.signal.Render;

    public class ZoomCommand extends SignalCommand
    {
        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var partiesModel:PartiesModel;

        [Inject]
        public var render:Render;

        protected function reRender():void
        {
            var party:PartyVO = partiesModel.currentParty;
            render.dispatch(party.location);
        }
    }
}
