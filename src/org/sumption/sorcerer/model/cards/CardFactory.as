/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 03/12/11
 * Time: 01:52
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.model.cards
{
    public class CardFactory
    {
        public function CardFactory()
        {
        }

        public function createCardDeck(xml:XML):CardDeckVO
        {
            var cardDeckVo:CardDeckVO =  new CardDeckVO();

            for each (var creature:XML in xml.creature)
            {
                cardDeckVo.add(createCreatureCardFromXml(creature));
            }

            for each (var treasure:XML in xml.treasure)
            {
                cardDeckVo.add(createTreasureCardFromXml(treasure));
            }

            for each (var hazard:XML in xml.hazard)
            {
                cardDeckVo.add(createHazardCardFromXml(hazard));
            }

            return cardDeckVo;
        }

        private function createCreatureCardFromXml(xml:XML):ICard
        {
            var card:CreatureCardVO = new CreatureCardVO();
            addSharedCardProperties(card, xml);
            card.strength = xml.@strength;
            card.magic = xml.@magic;
            card.carry = xml.@carry;
            card.hostile = xml.@hostile;
            card.indifferent = xml.@indifferent;
            card.friendly = xml.@friendly;
            return card;
        }

        private function createTreasureCardFromXml(xml:XML):ICard
        {
            var card:TreasureCardVO = new TreasureCardVO();
            addSharedCardProperties(card, xml);
            trace("Treasure card original " + card);
            trace("Treasure card cloned would be " + card.clone());
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
            card.unique = (String(xml.@unique).toLowerCase() == 'true');
        }
    }
}
