package org.sumption.sorcerer.model.cards
{
	import org.sumption.sorcerer.model.cards.ICard;

	public class CardBase implements ICard
	{
		
		private var _type:String;
		private var _name:String;
		private var _numberInPack:uint = 0;
		private var _points:uint = 0;
		
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
		
		public function get numberInDeck():uint
		{
			return _numberInPack;
		}
		
		public function set numberInDeck(value:uint):void
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
			return "\nICard " + type + " name: " + name + " number in pack: " + numberInDeck + " points " + points + "\n";
		}
	}
}