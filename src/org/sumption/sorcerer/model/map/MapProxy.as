package org.sumption.sorcerer.model.map
{
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class MapProxy extends Proxy
	{
		public static const NAME:String = "org.sumption.sorcerer.model.MapProxy";
		
		public function MapProxy()
		{
			super(NAME, new MapVO());
		}
		
		private function get vo():MapVO
		{
			return data as MapVO;
		}
		
		public function addTile(tile:TileVO):void
		{
			vo.addTile(tile);
		}
		
		public function getTile(locationVectorVo:LocationVectorVO):TileVO
		{
			return vo.getTile(locationVectorVo);
		}
	}
}