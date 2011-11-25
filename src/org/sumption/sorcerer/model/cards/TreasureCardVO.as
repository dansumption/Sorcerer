package org.sumption.sorcerer.model.cards
{
	import org.sumption.sorcerer.model.cards.CardBase;
	
	public class TreasureCardVO extends CardBase
	{
		public static const TYPE:String = "TREASURE";
		
		public var weight:Number;

		public function TreasureCardVO()
		{
			super(TYPE);
		}
	}
}