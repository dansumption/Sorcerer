package org.sumption.sorcerer.model.map
{

	public class MapVO
	{
		public var tileData:Array = new Array();
		public var centre:LocationVectorVO;
		
		
		public function addTile(tile:TileVO):void
		{
			var x:uint = tile.location.xMapped;
			var y:uint = tile.location.yMapped;
			var z:uint = tile.location.zMapped;
			
			
			if (!tileData[z]) tileData[z] = new Array();
			if (tileData[z][y] == undefined) tileData[z][y] = new Array();
			tileData[z][y][x] = tile;
		}
		
		public function getTile(locationVo:LocationVectorVO):TileVO
		{
			var tile:TileVO;
			if (tileData[locationVo.zMapped] == undefined)
			{
				// trace ("null: no z array");
				tile = null;
			}
			else if (tileData[locationVo.zMapped][locationVo.yMapped] == undefined)
			{
				// trace ("null: no y array");
				tile = null;
			}
			else if (tileData[locationVo.zMapped][locationVo.yMapped][locationVo.xMapped] == undefined)
			{
				// trace ("null: no x member");
				tile = null;
			}
			else
			{
				tile = tileData[locationVo.zMapped][locationVo.yMapped][locationVo.xMapped] as TileVO;
				// trace ("Will return: " + tile);
			}
			return tile;
		}
	}
}