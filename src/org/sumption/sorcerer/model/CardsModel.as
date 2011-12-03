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


        public function set data(value:CardDeckVO):void
        {
            _data = value;
        }
    }
}