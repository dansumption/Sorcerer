package org.sumption.sorcerer.controller
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.cards.CardDeckVO;
	import org.sumption.sorcerer.model.cards.CardsProxy;
	import org.sumption.sorcerer.model.cards.ICard;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.utils.MapUtils;
	import org.sumption.sorcerer.utils.Random;
	
	public class AddTileCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			var location:LocationVectorVO = notification.getBody() as LocationVectorVO;
			var proxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			var tile:TileVO = new TileVO();
			tile.location = location.clone();
			addExits(tile);
			addCards(tile);
			proxy.addTile(tile);
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
			
			tile.up = Random.fiftyFifty();
			tile.down = Random.fiftyFifty();
			
			tile.cavern = Random.fiftyFifty();
		}
		
		private function addCards(tile:TileVO):void
		{
			if (tile.cavern)
			{
				var cardsProxy:CardsProxy = facade.retrieveProxy(CardsProxy.NAME) as CardsProxy;
				tile.cards = new Vector.<ICard>();
				var numCards:uint = MapUtils.getCardsPerRoom(tile.location.z);
				for (var i:uint=0; i< numCards; i++)
				{
					tile.cards.push(cardsProxy.drawRandomCard());
				}
			}
		}
	}
}