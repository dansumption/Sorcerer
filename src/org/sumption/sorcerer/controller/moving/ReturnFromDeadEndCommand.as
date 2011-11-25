package org.sumption.sorcerer.controller.moving
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.utils.MapUtils;

	public class ReturnFromDeadEndCommand extends SimpleCommand
	{
		private var partyMoveVo:PartyMoveVO;
		
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			partyMoveVo = notification.getBody() as PartyMoveVO;
			if (partyMoveVo.allowed && partyMoveVo.deadEnd)
			{
				returnFromDeadEnd();
			}
		}
		
		private function returnFromDeadEnd():void
		{
			trace ("return from dead end - TODO");
			// TODO: return
		}
	}
}