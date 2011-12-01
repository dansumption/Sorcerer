package org.sumption.sorcerer.utils
{
    public class Scale
    {
        public static const TILE_SIZE:Number = 50;

        public static const SIZES:Vector.<uint> = new <uint>[TINY, SMALL, MEDIUM, LARGE];

        public static const TINY:uint = 0;
        public static const SMALL:uint = 1;
        public static const MEDIUM:uint = 2;
        public static const LARGE:uint = 3;
        public static const DEFAULT:uint = 2;

        private static const ROWS_PART:uint = 0;
        private static const COLS_PART:uint = 1;
        private static const SCALE_PART:uint = 2;

        private static const TINY_VECTOR:Vector.<uint> = new <uint>[79, 79, 1];
        private static const SMALL_VECTOR:Vector.<uint> = new <uint>[19, 19, 4];
        private static const MEDIUM_VECTOR:Vector.<uint> = new <uint>[7, 7, 10];
        private static const LARGE_VECTOR:Vector.<uint> = new <uint>[3, 3, 25];

        private static const VECTOR_MAP:Vector.<Vector.<uint>> =
                new <Vector.<uint>>[TINY_VECTOR, SMALL_VECTOR, MEDIUM_VECTOR, LARGE_VECTOR];

        public static function rows(size:uint):uint
        {
            return VECTOR_MAP[size][ROWS_PART];
        }

        public static function cols(size:uint):uint
        {
            return VECTOR_MAP[size][COLS_PART];
        }

        public static function scale(size:uint):uint
        {
            return VECTOR_MAP[size][SCALE_PART];
        }

        public static function isValidZoom(value:uint):Boolean
        {
            return (value >= 0 && value < SIZES.length);
        }
    }
}