package org.sumption.sorcerer.model.party
{
	import org.sumption.sorcerer.model.map.LocationVectorVO;

	public class PartyVO
	{
		public var id:uint;
		private var _location:LocationVectorVO;
		public var markerColour:uint = 0xff0000;
		public var positionOnTile:uint = 0;

        public function get location():LocationVectorVO
        {
            return _location;
        }

        public function set location(value:LocationVectorVO):void
        {
            trace('PARTYVO LOCATION changed to ' + value);
            _location = value;
        }
    }
}