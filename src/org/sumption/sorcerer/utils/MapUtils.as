package org.sumption.sorcerer.utils
{
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.StaticLocationVectorVO;

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

        public static const ALL_DIRECTIONS:Vector.<uint> = Vector.<uint>([NORTH, EAST, SOUTH, WEST, UP,  DOWN]);

        private static const NORTH_VECTOR:LocationVectorVO = new StaticLocationVectorVO(0, -1, 0);
        private static const EAST_VECTOR:LocationVectorVO = new StaticLocationVectorVO(1, 0, 0);
        private static const SOUTH_VECTOR:LocationVectorVO = new StaticLocationVectorVO(0, 1, 0);
        private static const WEST_VECTOR:LocationVectorVO = new StaticLocationVectorVO(-1, 0, 0);
        private static const UP_VECTOR:LocationVectorVO = new StaticLocationVectorVO(0, 0, -1);
        private static const DOWN_VECTOR:LocationVectorVO = new StaticLocationVectorVO(0, 0, 1);


        public static function name(direction:uint):String
        {
            switch (direction)
            {
                case NORTH:
                {
                    return "NORTH";
                }
                case SOUTH:
                {
                    return "SOUTH";
                }
                case EAST:
                {
                    return "EAST";
                }
                case WEST:
                {
                    return "WEST";
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
                }
                case SOUTH:
                {
                    return NORTH;
                }
                case EAST:
                {
                    return WEST;
                }
                case WEST:
                {
                    return EAST;
                }
                case UP:
                {
                    return DOWN;
                }
                case DOWN:
                {
                    return UP;
                }
            }
            return 0;
        }

        public static function directionToVector(direction:uint):LocationVectorVO
        {
            switch (direction)
            {
                case NORTH:
                {
                    return NORTH_VECTOR;
                }
                case SOUTH:
                {
                    return SOUTH_VECTOR;
                }
                case EAST:
                {
                    return EAST_VECTOR;
                }
                case WEST:
                {
                    return WEST_VECTOR;
                }
                case UP:
                {
                    return UP_VECTOR;
                }
                case DOWN:
                {
                    return DOWN_VECTOR;
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