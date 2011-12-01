/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 01/12/11
 * Time: 22:38
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.view.shared
{
    import flash.display.Sprite;
    import flash.text.TextField;

    import org.sumption.sorcerer.model.cards.ICard;

    public class CardSprite extends Sprite
    {
        protected var data:ICard;

        protected var _image:Sprite;
        protected var _name:TextField;
        protected var _points:TextField;

        public function CardSprite(cardData:ICard)
        {
            data = cardData;
            init();
            layout();
        }

        protected function init():void
        {
            drawBackground();

            _name = new TextField();
            _name.text = data.name;
            addChild(_name);

            _points = new TextField();
            _points.text = "VALUE: " + data.points.toString();
            addChild(_points);
        }

        protected function layout():void
        {
            _name.x = 5;
            _name.y = 5;

            _points.x = 5;
            _points.y = 25;
        }

        protected function drawBackground():void
        {
            graphics.beginFill(0xFFFFFF);
            graphics.lineStyle(1, 0x000000);
            graphics.drawRoundRect(0, 0, 100, 155, 8, 8);
            graphics.endFill();
        }
    }
}
