package org.sumption.sorcerer.controller.startup
{
    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.utils.MapUtils;

    public class PrepareMapCommand extends Command
	{
        [Inject]
        public var mapModel:MapModel;

		override public function execute():void
		{
			var tile:TileVO = new TileVO();
			tile.location = new LocationVectorVO(0, 0, 0);
			tile.exitData = MapUtils.CARDINAL_DIRECTIONS | MapUtils.UP | MapUtils.CAVERN;
			tile.fullyExplored = true;
			mapModel.addTile(tile);
		}
	}
}