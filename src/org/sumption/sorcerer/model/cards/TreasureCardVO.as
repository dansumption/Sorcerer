package org.sumption.sorcerer.model.cards
{
    import org.sumption.sorcerer.model.cards.CardBase;
    import org.sumption.sorcerer.model.cards.TreasureCardVO;

    public class TreasureCardVO extends CardBase
    {
        public static const TYPE:String = "TREASURE";

        public var weight:Number;

        public function TreasureCardVO()
        {
            super(TYPE);
        }


        override public function clone():ICard
        {
            var newCard:TreasureCardVO = super.clone() as TreasureCardVO;
            newCard.weight = weight;
            return newCard;
        }
    }
}