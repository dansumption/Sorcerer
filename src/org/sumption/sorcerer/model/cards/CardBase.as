package org.sumption.sorcerer.model.cards
{
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;

    import org.sumption.sorcerer.model.cards.ICard;
    import org.sumption.sorcerer.view.map.TileSprite;

    public class CardBase implements ICard
	{
		
		private var _type:String;
		private var _name:String;
		private var _numberInPack:uint = 0;
		private var _points:uint = 0;
        private var _unique:Boolean;
		
		public function CardBase(type:String)
		{
			_type = type;
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get numberInPack():uint
		{
			return _numberInPack;
		}
		
		public function set numberInPack(value:uint):void
		{
			_numberInPack = value;
		}
		
		public function get points():uint
		{
			return _points;
		}
		
		public function set points(value:uint):void
		{
			_points = value;
		}
		
		public function toString():String
		{
			return "\nICard " + type + " name: " + name + " number in pack: " + numberInPack + " unique " + unique + " points " + points + "\n";
		}

        public function decorateRoom(room:TileSprite):void
        {
            // to be overridden
        }

        public function get unique():Boolean
        {
            return _unique;
        }

        public function set unique(value:Boolean):void
        {
            _unique = value;
        }

        public function clone():ICard
        {
            var classOfICard:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
            var newCard:ICard = new classOfICard();
            newCard.name = name;
            newCard.points = points;
            newCard.numberInPack = numberInPack;
            newCard.unique = unique;
            return newCard;
        }
    }
}