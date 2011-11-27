package org.sumption.sorcerer.model
{
    import org.sumption.sorcerer.model.map.*;

	public class MapModel
	{
		private var data:MapVO;

		public function MapModel()
		{
			data = new MapVO();
            trace(this + " create");
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