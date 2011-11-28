package org.sumption.sorcerer.controller
{
    import org.robotlegs.mvcs.SignalCommand;
    import org.sumption.sorcerer.model.CardsModel;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.cards.ICard;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.utils.MapUtils;
    import org.sumption.sorcerer.utils.Random;

    public class AddTileCommand extends SignalCommand
	{
        [Inject]
        public var location:LocationVectorVO;

        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var cardsModel:CardsModel;

		override public function execute():void
		{
			trace (this + ".execute()");
			var tile:TileVO = new TileVO();
			tile.location = location.clone();
			addExits(tile);
			addCards(tile);
			mapModel.addTile(tile);
		}
		
		private function addExits(tile:TileVO):void
		{
			while (tile.numCardinalExits < 2)
			{
				tile.north = Random.twoThirds();
				tile.south = Random.twoThirds();
				tile.east = Random.twoThirds();
				tile.west = Random.twoThirds();
			}
			
			tile.up = Random.oneTwentieth();
			tile.down = Random.oneTenth();
			
			tile.cavern = Random.fiftyFifty();
		}
		
		private function addCards(tile:TileVO):void
		{
			if (tile.cavern)
			{
				tile.cards = new Vector.<ICard>();
				var numCards:uint = MapUtils.getCardsPerRoom(tile.location.z);
				for (var i:uint=0; i< numCards; i++)
				{
					tile.cards.push(cardsModel.drawRandomCard());
				}
			}
		}
	}
}