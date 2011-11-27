package org.sumption.sorcerer
{
	import flash.display.Sprite;

    import org.sumption.sorcerer.view.components.MapView;
    import org.sumption.sorcerer.view.components.PartiesView;

    [SWF(width="800", height="800", backgroundColor="#FFFFFF")]
	
	public class Sorcerer extends Sprite
	{
		private var context:ApplicationContext;
        private var mapView:MapView;
        private var partiesView:PartiesView;

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
        }
	}
}