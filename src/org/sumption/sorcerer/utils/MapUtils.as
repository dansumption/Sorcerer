package org.sumption.sorcerer.utils
{
	import org.sumption.sorcerer.model.map.LocationVectorVO;

	public class MapUtils
	{
		public static const NORTH:uint = 1 << 0;
		public static const EAST:uint = 1 << 1;
		public static const SOUTH:uint = 1 << 2;
		public static const WEST:uint = 1 << 3;
		public static const UP:uint = 1 << 4;
		public static const DOWN:uint = 1 << 5;
		public static const CAVERN:uint = 1 << 6;
		
		public static const CARDINAL_DIRECTIONS:uint = NORTH | EAST | SOUTH | WEST;
		
		private static const NORTH_VECTOR:LocationVectorVO = new LocationVectorVO(0, -1, 0);
		private static const EAST_VECTOR:LocationVectorVO = new LocationVectorVO(1, 0, 0);
		private static const SOUTH_VECTOR:LocationVectorVO = new LocationVectorVO(0, 1, 0);
		private static const WEST_VECTOR:LocationVectorVO = new LocationVectorVO(-1, 0, 0);
		private static const UP_VECTOR:LocationVectorVO = new LocationVectorVO(0, 0, -1);
		private static const DOWN_VECTOR:LocationVectorVO = new LocationVectorVO(0, 0, 1);


		
		public static function name(direction:uint):String
		{
			switch (direction)
			{
				case NORTH:
				{
					return "NORTH";
					break;
				}
				case SOUTH:
				{
					return "SOUTH";
					break;
				}
				case EAST:
				{
					return "EAST";
					break;
				}
				case WEST:
				{
					return "WEST";
					break;
				}
				case UP:
				{
					return "UP";
				}
				case DOWN:
				{
					return "DOWN";
				}
			}
			return "UNDEFINED";
		}
		
		public static function opposite(direction:uint):uint
		{
			switch (direction)
			{
				case NORTH:
				{
					return SOUTH;
					break;
				}
				case SOUTH:
				{
					return NORTH;
					break;
				}
				case EAST:
				{
					return WEST;
					break;
				}
				case WEST:
				{
					return EAST;
					break;
				}
				case UP:
				{
					return DOWN;
					break;
				}
				case DOWN:
				{
					return UP;
					break;
				}
			}
			return 0;
		}
		
		public static function vector(direction:uint):LocationVectorVO
		{
			switch (direction)
			{
				case NORTH:
				{
					return NORTH_VECTOR;
					break;
				}
				case SOUTH:
				{
					return SOUTH_VECTOR;
					break;
				}
				case EAST:
				{
					return EAST_VECTOR;
					break;
				}
				case WEST:
				{
					return WEST_VECTOR;
					break;
				}
				case UP:
				{
					return UP_VECTOR;
					break;
				}
				case DOWN:
				{
					return DOWN_VECTOR;
					break;
				}
			}
			return null;
		}
			
		public static function getCardsPerRoom(level:uint):uint
		{
			if (level < 4)
			{
				return level + 1;
			}
			return 4;
		}
	}
}