package org.sumption.sorcerer.model.cards
{
	public class HazardCardVO extends CardBase
	{
		public static const TYPE:String = "HAZARD";
		
		public var className:String;

		public function HazardCardVO()
		{
			super(TYPE);
		}
	}
}