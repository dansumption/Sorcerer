package org.sumption.sorcerer.model.cards
{
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class CardsProxy extends Proxy
	{
		public static const NAME:String = "org.sumption.sorcerer.model.CardProxy";
		
		public function CardsProxy()
		{
			super(NAME, new CardDeckVO());
		}
		
		private function get vo():CardDeckVO
		{
			return data as CardDeckVO;
		}
		
		public function createCardDeckFromXml(cardData:XML):void
		{
			for each (var creature:XML in cardData.creature)
			{
				createCreatureCardFromXml(creature);
			}
			
			for each (var treasure:XML in cardData.treasure)
			{
				createTreasureCardFromXml(treasure);
			}
			
			for each (var hazard:XML in cardData.hazard)
			{
				createHazardCardFromXml(hazard);
			}
			trace (vo.cards);
		}
		
		public function drawRandomCard():ICard
		{
			return vo.drawRandomCard();
		}
		
		private function createCreatureCardFromXml(xml:XML):ICard
		{
			var card:CreatureCardVO = new CreatureCardVO();
			addSharedCardProperties(card, xml);
			card.strength = xml.@strength;
			card.carry = xml.@carry;
			card.friendly = xml.@friendly;
			card.neutral = xml.@neutral;
			return card;
		}
		
		private function createTreasureCardFromXml(xml:XML):ICard
		{
			var card:TreasureCardVO = new TreasureCardVO();
			addSharedCardProperties(card, xml);
			return card;
		}
		
		private function createHazardCardFromXml(xml:XML):ICard
		{
			var card:HazardCardVO = new HazardCardVO();
			addSharedCardProperties(card, xml);
			return card;
		}
		
		private function addSharedCardProperties(card:ICard, xml:XML):void
		{
			card.name = xml.@name;
			card.numberInDeck = xml.@number;
			card.points = xml.@points;
			vo.add(card);
		}
	}
}