package org.sumption.sorcerer
{
	import flash.display.Sprite;

    import org.sumption.sorcerer.view.encounter.EncounterView;

    import org.sumption.sorcerer.view.map.MapView;
    import org.sumption.sorcerer.view.parties.PartiesView;

    [SWF(width="800", height="800", backgroundColor="#FFFFFF")]
	
	public class Sorcerer extends Sprite
	{
		private var context:ApplicationContext;

        private var mapView:MapView;
        private var partiesView:PartiesView;
        private var encounterView:EncounterView;

		public function Sorcerer()
		{
            context = new ApplicationContext(this);
		}

		public function createChildren():void
        {
            mapView = new MapView();
            addChild(mapView);

            partiesView = new PartiesView();
            addChild(partiesView);

            encounterView = new EncounterView();
        }

        public function addEncounterView():void
        {
            addChild(encounterView);
        }

        public function removeEncounterView():void
        {
            removeChild(encounterView);
        }
	}
}