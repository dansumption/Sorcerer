package org.sumption.sorcerer.model
{
    import org.sumption.sorcerer.model.map.*;
    import org.sumption.sorcerer.utils.Scale;

    public class MapModel
	{
		private var data:MapVO;

        private var _sizeIndex:int;

		public function MapModel()
		{
			data = new MapVO();
            _sizeIndex = Scale.DEFAULT;
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

        public function get sizeIndex():int
        {
            return _sizeIndex;
        }

        public function zoomIn():void
        {
            _sizeIndex++;
            if (!Scale.isValidZoom(_sizeIndex))
                _sizeIndex--;
            trace("Zoomed to size index " + _sizeIndex);
        }

        public function zoomOut():void
        {
            _sizeIndex--;
            if (!Scale.isValidZoom(_sizeIndex))
                _sizeIndex++;
            trace("Zoomed to size index " + _sizeIndex);
        }
    }
}