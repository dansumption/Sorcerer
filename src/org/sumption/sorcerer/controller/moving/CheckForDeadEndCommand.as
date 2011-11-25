package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.utils.MapUtils;
	
	public class CheckForDeadEndCommand extends SimpleCommand
	{
		private var partyMoveVo:PartyMoveVO;
		
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			partyMoveVo = notification.getBody() as PartyMoveVO;
			if (partyMoveVo.allowed && !partyMoveVo.leavingCavern)
			{
				checkForDeadEnd();
			}
		}
		
		private function checkForDeadEnd():void
		{
			trace ("check for dead end");
			var party:PartyVO = partyMoveVo.party;
			var mapProxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			var toTile:TileVO = mapProxy.getTile(party.location);
			
			if (!toTile.hasExitInDirection(party.positionOnTile) &&
				partyMoveVo.direction != MapUtils.UP &&
				partyMoveVo.direction != MapUtils.DOWN)
			{
				partyMoveVo.deadEnd = true;
				toTile.explored = party.positionOnTile | toTile.explored;
			}

		}
	}
}