package org.sumption.sorcerer.controller.startup
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.utils.MapUtils;
	
	public class PrepareMapCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var proxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			var tile:TileVO = new TileVO();
			tile.location = new LocationVectorVO(0, 0, 0);
			tile.exitData = MapUtils.CARDINAL_DIRECTIONS | MapUtils.UP | MapUtils.CAVERN;
			tile.fullyExplored = true;
			proxy.addTile(tile);
		}
	}
}