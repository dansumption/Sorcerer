package org.sumption.sorcerer.model.party
{
	import org.sumption.sorcerer.model.map.LocationVectorVO;

	public class PartyVO
	{
		public var id:uint;
		public var location:LocationVectorVO;
		public var markerColour:uint = 0xff0000;
		public var positionOnTile:uint = 0;
		
	}
}