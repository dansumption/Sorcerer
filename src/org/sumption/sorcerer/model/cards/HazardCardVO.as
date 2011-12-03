package org.sumption.sorcerer.model.cards
{
    import org.sumption.sorcerer.model.cards.HazardCardVO;

    public class HazardCardVO extends CardBase
    {
        public static const TYPE:String = "HAZARD";

        public var className:String;

        public function HazardCardVO()
        {
            super(TYPE);
        }


        override public function clone():ICard
        {
            var newCard:HazardCardVO = super.clone() as HazardCardVO;
            return newCard;
        }
    }
}