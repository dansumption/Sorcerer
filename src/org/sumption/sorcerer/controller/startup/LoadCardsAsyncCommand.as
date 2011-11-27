package org.sumption.sorcerer.controller.startup
{
    import org.robotlegs.mvcs.SignalCommand;
    import org.robotlegs.utilities.macrobot.AsyncCommand;
    import org.sumption.sorcerer.model.CardsModel;
    import org.sumption.sorcerer.model.cards.CardDeckVO;
    import org.sumption.sorcerer.service.CardDataLoader;
    import org.sumption.sorcerer.signal.CardsLoaded;

    public class LoadCardsAsyncCommand extends AsyncCommand
    {
        private static const FILENAME:String = "../data/cardDeck.xml";

        [Inject]
        public var cardDataLoader:CardDataLoader;

        [Inject]
        public var cardsModel:CardsModel;

        [Inject]
        public var cardsLoaded:CardsLoaded;

        override public function execute():void
        {
            trace(this + ".execute");
            cardsLoaded.add(onCardsLoaded);
            cardDataLoader.loadData(FILENAME);
        }

        private function onCardsLoaded(cardDeckVo:CardDeckVO):void
        {
            trace(this + ".onCardsLoaded");
            cardsModel.data = cardDeckVo;
            dispatchComplete(true);
        }
    }
}