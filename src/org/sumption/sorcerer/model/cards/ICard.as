package org.sumption.sorcerer.model.cards
{
	public interface ICard
	{
		function get type():String;
		function get name():String;
		function set name(value:String):void;
		function get numberInDeck():uint;
		function set numberInDeck(value:uint):void;
		function get points():uint;
		function set points(value:uint):void;
	}
}