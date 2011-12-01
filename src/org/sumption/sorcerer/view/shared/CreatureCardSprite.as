/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 28/11/11
 * Time: 23:07
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.view.shared
{
    import flash.text.TextField;

    import org.sumption.sorcerer.model.cards.CreatureCardVO;
    import org.sumption.sorcerer.model.cards.ICard;

    public class CreatureCardSprite extends CardSprite
    {
        private var _strength:TextField;
        private var _magic:TextField;
        private var _weight:TextField;
        private var _reactions:TextField;



        public function CreatureCardSprite(cardVo:CreatureCardVO)
        {
            super(cardVo);
        }

        override protected function init():void
        {
            super.init();
            _strength = new TextField();
            _strength.text = "STRENGTH: " + creatureData.strength.toString();
            addChild(_strength);

            _magic = new TextField();
            _magic.text = "MAGIC: " + creatureData.magic.toString();
            addChild(_magic);
            
            _weight = new TextField();
            _weight.text = "CARRY: " + creatureData.carry.toString() + "kg";
            addChild(_weight);

            _reactions = new TextField();
            _reactions.text = buildReactionsText();
            addChild(_reactions);
        }

        override protected function layout():void
        {
            super.layout();

            _strength.x = 5;
            _strength.y = 45;

            _magic.x = 5;
            _magic.y = 65;

            _weight.x = 5;
            _weight.y = 85;

            _reactions.x = 5;
            _reactions.y = 105;
        }

        private function buildReactionsText():String
        {
            var returnValue:String = "";
            var nextValue:uint = 1;
            returnValue += addReactionLine("Friendly", nextValue, creatureData.friendly);
            nextValue += creatureData.friendly;
            returnValue += addReactionLine("Indifferent", nextValue, creatureData.indifferent);
            nextValue += creatureData.indifferent;
            returnValue += addReactionLine("Hostile", nextValue, creatureData.hostile);
            nextValue += creatureData.hostile;
            return returnValue;
        }
        
        private function addReactionLine(description:String,  startValue:int, chance:uint):String
        {
            var returnValue:String = "";
            if (chance > 0)
            {
                var maxValue:int = startValue + chance - 1;
                returnValue += description + ":\t" + startValue.toString();
                if (chance > 1)
                    returnValue += "-" + maxValue.toString();
                returnValue += "\n";
            }
            return returnValue;
        }

        private function get creatureData():CreatureCardVO
        {
            return data as CreatureCardVO;
        }
    }
}
