/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 28/11/11
 * Time: 15:11
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.view.encounter
{
    import flash.display.Sprite;

    public class EncounterView extends Sprite
    {
        private static const CARD_SPACING:uint = 150;
        private static const CARD_Y:uint = 580;
        private static const CARD_X:uint = 20;
        
        public function addCard(card:Sprite):void
        {
            card.x = CARD_X + numChildren * CARD_SPACING;
            card.y = CARD_Y;
            addChild(card);
        }

        public function clearDisplay():void
        {
            while (numChildren)
                removeChildAt(0);
        }
    }
}
