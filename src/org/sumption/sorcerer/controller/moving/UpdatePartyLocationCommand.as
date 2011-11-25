package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.utils.MapUtils;
	
	public class UpdatePartyLocationCommand extends SimpleCommand
	{
		private var partyMoveVo:PartyMoveVO;
		
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			partyMoveVo = notification.getBody() as PartyMoveVO;
			if (partyMoveVo.allowed)
			{
				updatePartyLocation();
			}
		}
		
		private function updatePartyLocation():void
		{
			trace ("update party location");
			var party:PartyVO = partyMoveVo.party;
			var moveVector:LocationVectorVO = MapUtils.vector(partyMoveVo.direction);
			
			party.location.add(moveVector);
			trace ("Party location now " + party.location); 
			party.positionOnTile = MapUtils.opposite(partyMoveVo.direction);
			
			if (party.location.z < 0)
			{
				partyMoveVo.leavingCavern = true;
				sendNotification(SystemNotifcations.LEAVE_CAVERN, party);
			}
		}
	}
}