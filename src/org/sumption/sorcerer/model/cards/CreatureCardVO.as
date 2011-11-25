package org.sumption.sorcerer.model.cards
{
	import org.sumption.sorcerer.model.cards.CardBase;

	public class CreatureCardVO extends CardBase
	{
		public static const TYPE:String = "CREATURE";
		
		public var strength:int;
		public var carry:int;
		public var friendly:int;
		public var neutral:int;
		
		public function CreatureCardVO()
		{
			super(TYPE);
		}
		
		override public function toString():String
		{
			return super.toString() + "\tstrength: " + strength + " carry: " + carry
				+ "kg friendly: " + friendly + " neutral: " + neutral;
		}
	}
}