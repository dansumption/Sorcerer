package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.model.map.TileVO;
	
	public class CheckExitDirectionCommand extends SimpleCommand
	{
		private var partyMoveVo:PartyMoveVO;
		
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			partyMoveVo = notification.getBody() as PartyMoveVO;
			checkExitDirection();
		}
		
		private function checkExitDirection():void
		{
			trace ("check exit direction");
			var mapProxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			var fromTile:TileVO = mapProxy.getTile(partyMoveVo.party.location);
			if (!fromTile.hasExitInDirection(partyMoveVo.direction))
			{
				trace ("Invalid move");
				partyMoveVo.allowed = false;
			}
		}
			
	}
}