package org.sumption.sorcerer.model.cards
{
	public class CardDeckVO
	{
		public var cards:Vector.<ICard> = new Vector.<ICard>();
		
		public function add(card:ICard):void
		{
			for (var i:uint = 0; i < card.numberInPack; i++)
			{
				cards.push(card);
			}
		}
		
		public function get numberInDeck():uint
		{
			return cards.length;
		}
		
		public function drawRandomCard():ICard
		{
			var index:uint = Math.floor(Math.random() * numberInDeck);
			return cards[index];
		}
	}
}