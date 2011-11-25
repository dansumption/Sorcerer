package org.sumption.sorcerer.utils
{
	public class NumberUtils
	{
		public static function mapUintToInt(input:uint):int
		{
			if (input > uint.MAX_VALUE/2)
				return input - uint.MAX_VALUE;
			return input;
		}
		
		public static function mapIntToUint(input:int):uint
		{
			if (input < 0)
				return uint.MAX_VALUE + input;
			return input;
		}
		
	}
}