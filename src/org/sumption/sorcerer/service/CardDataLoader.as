/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 27/11/11
 * Time: 10:06
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.service
{
    import org.sumption.sorcerer.model.CardsModel;
    import org.sumption.sorcerer.model.cards.CardDeckVO;
    import org.sumption.sorcerer.model.cards.CreatureCardVO;
    import org.sumption.sorcerer.model.cards.HazardCardVO;
    import org.sumption.sorcerer.model.cards.ICard;
    import org.sumption.sorcerer.model.cards.TreasureCardVO;
    import org.sumption.sorcerer.signal.CardsLoaded;

    public class CardDataLoader extends XMLLoader implements DataLoader
    {
        [Inject]
        public var cardsLoaded:CardsLoaded;

        private var cardDeckVo:CardDeckVO;

        public function loadData(filename:String):void
        {
            load(filename);
        }

        override protected function processXML(xml:XML):void
        {
            cardDeckVo =  new CardDeckVO();

            for each (var creature:XML in xml.creature)
            {
                createCreatureCardFromXml(creature);
            }

            for each (var treasure:XML in xml.treasure)
            {
                createTreasureCardFromXml(treasure);
            }

            for each (var hazard:XML in xml.hazard)
            {
                createHazardCardFromXml(hazard);
            }
            trace (cardDeckVo.cards);

            cardsLoaded.dispatch(cardDeckVo);
        }

        private function createCreatureCardFromXml(xml:XML):ICard
        {
            var card:CreatureCardVO = new CreatureCardVO();
            addSharedCardProperties(card, xml);
            card.strength = xml.@strength;
            card.magic = xml.@magic;
            card.carry = xml.@carry;
            card.friendly = xml.@friendly;
            card.indifferent = xml.@indifferent;
            card.hostile = xml.@hostile;
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
            card.numberInPack = xml.@inPack;
            card.points = xml.@value;
            cardDeckVo.add(card);
        }
    }
}
