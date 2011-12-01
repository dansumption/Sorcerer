package org.sumption.sorcerer.model
{
    import org.sumption.sorcerer.model.cards.*;

    public class CardsModel
    {
        private var _data:CardDeckVO;

        public function CardsModel()
        {
            _data = new CardDeckVO();
            trace(this + " create");
        }

        private function get vo():CardDeckVO
        {
            return _data as CardDeckVO;
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
            card.hostile = xml.@friendly;
            card.indifferent = xml.@neutral;
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
            card.numberInPack = xml.@number;
            card.points = xml.@points;
            vo.add(card);
        }

        public function set data(value:CardDeckVO):void
        {
            _data = value;
        }
    }
}