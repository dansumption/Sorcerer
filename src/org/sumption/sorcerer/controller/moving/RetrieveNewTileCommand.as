package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.model.map.TileVO;
	
	public class RetrieveNewTileCommand extends SimpleCommand
	{
		private var partyMoveVo:PartyMoveVO;
		
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			partyMoveVo = notification.getBody() as PartyMoveVO;
			if (partyMoveVo.allowed && !partyMoveVo.leavingCavern)
			{
				retrieveNewTile();
			}
		}
		
		private function retrieveNewTile():void
		{
			trace ("retrieve new tile");
			var mapProxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			
			var toTile:TileVO = mapProxy.getTile(partyMoveVo.party.location);
			if (toTile == null)
			{
				sendNotification(SystemNotifcations.ADD_TILE, partyMoveVo.party.location);
			}
		}
	}
}