package org.sumption.sorcerer.model.map
{
	import org.sumption.sorcerer.utils.NumberUtils;

	public class LocationVectorVO
	{
		private var _x:int;
		private var _y:int;
		private var _z:int;
		
		public function LocationVectorVO(x:int, y:int, z:int)
		{
			this._x = x;
			this._y = y;
			this._z = z;
		}
		
		public function add(location:LocationVectorVO):void
		{
			x += location.x;
			y += location.y;
			z += location.z;
		}
		
		public function subtract(location:LocationVectorVO):void
		{
			x -= location.x;
			y -= location.y;
			z -= location.z;
		}
		
		public function getDifference(location:LocationVectorVO):LocationVectorVO
		{
			var xDiff:int = x - location.x;
			var yDiff:int = y - location.y;
			var zDiff:int = z - location.z;
			return new LocationVectorVO(xDiff, yDiff, zDiff);
		}
		
		public function get xMapped():uint
		{
			return NumberUtils.mapIntToUint(x);
		}
		
		public function get yMapped():uint
		{
			return NumberUtils.mapIntToUint(y);
		}

		public function get zMapped():uint
		{
			return NumberUtils.mapIntToUint(z);
		}
		
		public function clone():LocationVectorVO
		{
			return new LocationVectorVO(x, y, z);
		}
		
		public function toString():String
		{
			return "LocationVectorVO: [" + x + ", " + y + ", " + z +
				"] (Mapped to uint --> [" + xMapped + ", " + yMapped + ", " + zMapped + "])";
		}

        public function get x():int
        {
            return _x;
        }

        public function set x(value:int):void
        {
            _x = value;
        }

        public function get y():int
        {
            return _y;
        }

        public function set y(value:int):void
        {
            _y = value;
        }

        public function get z():int
        {
            return _z;
        }

        public function set z(value:int):void
        {
            _z = value;
        }
    }
}