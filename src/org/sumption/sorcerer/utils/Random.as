package org.sumption.sorcerer.utils
{
	public class Random
	{
		public static function fiftyFifty():Boolean
		{
			return (Math.random() < 0.5);
		}
		
		public static function twoThirds():Boolean
		{
			return (Math.random() < 0.66);
		}
		
		public static function oneTwentieth():Boolean
		{
			return (Math.random() < 0.05);
		}
		
		public static function oneTenth():Boolean
		{
			return (Math.random() < 0.1);
		}
	}
}