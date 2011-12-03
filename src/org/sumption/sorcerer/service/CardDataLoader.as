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
    import org.sumption.sorcerer.model.cards.CardFactory;
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
            var cardFactory:CardFactory = new CardFactory();
            cardDeckVo =  cardFactory.createCardDeck(xml);

            trace (cardDeckVo.cards);

            cardsLoaded.dispatch(cardDeckVo);
        }
    }
}
