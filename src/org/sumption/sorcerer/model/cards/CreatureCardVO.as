package org.sumption.sorcerer.model.cards
{
	import org.sumption.sorcerer.model.cards.CardBase;

	public class CreatureCardVO extends CardBase
	{
		public static const TYPE:String = "CREATURE";
		
		public var strength:int;
        public var magic:int;
		public var carry:int;
		public var hostile:int;
		public var indifferent:int;
        public var friendly:int;
		
		public function CreatureCardVO()
		{
			super(TYPE);
		}
		
		override public function toString():String
		{
			return super.toString() + "\t strength: " + strength + " magic: " + magic + " carry: " + carry
				+ "kg friendly: " + hostile + "indifferent: " + indifferent + " friendly: " + friendly;
		}
	}
}