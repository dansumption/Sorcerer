/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 28/11/11
 * Time: 15:10
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.view.encounter
{
    import org.sumption.sorcerer.model.cards.CreatureCardVO;
    import org.sumption.sorcerer.model.cards.ICard;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.signal.EnterCavern;
    import org.sumption.sorcerer.signal.MoveParty;
    import org.sumption.sorcerer.view.*;
    import org.sumption.sorcerer.view.shared.CardSprite;
    import org.sumption.sorcerer.view.shared.CreatureCardSprite;

    public class EncounterMediator extends InteractiveMediator
    {
        [Inject]
        public var moveParty:MoveParty;

        [Inject]
        public var enterCavern:EnterCavern;

        override public function onRegister():void
        {
            trace(this + ".onRegister");
            moveParty.add(onMoveParty);
            enterCavern.add(onEnterCavern);
        }

        private function onEnterCavern(tileVo:TileVO):void
        {
            var cardSprite:CardSprite;

            for each (var card:ICard in tileVo.cards)
            {
                if (card.type == CreatureCardVO.TYPE)
                {
                    cardSprite = new CreatureCardSprite(card as CreatureCardVO);
                }
                else
                {
                    cardSprite = new CardSprite(card)
                }
                viewComponent.addCard(cardSprite);
            }
        }

        private function onMoveParty(partyMoveVo:PartyMoveVO):void
        {
            viewComponent.clearDisplay();
        }
    }
}
