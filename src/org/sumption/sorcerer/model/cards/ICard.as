package org.sumption.sorcerer.model.cards
{
	public interface ICard
	{
		function get type():String;
		function get name():String;
		function set name(value:String):void;
		function get numberInPack():uint;
		function set numberInPack(value:uint):void;
		function get points():uint;
		function set points(value:uint):void;
        function get unique():Boolean;
        function set unique(value:Boolean):void;
        function clone():ICard;
	}
}