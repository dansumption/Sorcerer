package org.sumption.sorcerer.view
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.party.PartyMoveVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.utils.MapUtils;
	import org.sumption.sorcerer.view.components.PartiesView;
	import org.sumption.sorcerer.view.components.PartySprite;
	
	public class PartiesMediator extends InteractiveMediator
	{
		public static const NAME:String = "org.sumption.sorcerer.view.PartiesMediator";
		
		public function PartiesMediator(viewComponent:PartiesView)
		{
			super(NAME, viewComponent);
		}
		
		private function get ui():PartiesView
		{
			return viewComponent as PartiesView;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				SystemNotifcations.RENDER,
				SystemNotifcations.PARTY_ADDED
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case SystemNotifcations.RENDER:
				{
					var mapCentre:LocationVectorVO = notification.getBody() as LocationVectorVO;
					render(mapCentre);
					break;
				}
				case SystemNotifcations.PARTY_ADDED:
				{
					var partyVo:PartyVO = notification.getBody() as PartyVO;
					addParty(partyVo);
					break;
				}
			}
		}
		
		private function addParty(partyVo:PartyVO):void
		{
			var partySprite:PartySprite = new PartySprite(partyVo);
			ui.addChild(partySprite);
			partySprite.draw();
		}
		
		
		private function render(mapCentre:LocationVectorVO):void
		{
			ui.x = centreX;
			ui.y = centreY;
			ui.render(mapCentre);
		}
		
		override protected function onKeyDown(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				case Keyboard.UP:
				{
					moveParty(MapUtils.NORTH);
					break;
				}
				case Keyboard.RIGHT:
				{
					moveParty(MapUtils.EAST);
					break;
				}
				case Keyboard.DOWN:
				{
					moveParty(MapUtils.SOUTH);
					break;
				}
				case Keyboard.LEFT:
				{
					moveParty(MapUtils.WEST);
					break;
				}
				case Keyboard.A:
				{
					moveParty(MapUtils.UP);
					break;
				}
				case Keyboard.Z:
				{
					moveParty(MapUtils.DOWN);
					break;
				}
			}
		}
		
		private function moveParty(direction:uint):void
		{
			var partyMoveVo:PartyMoveVO = new PartyMoveVO();
			partyMoveVo.direction = direction;
			sendNotification(SystemNotifcations.MOVE_PARTY, partyMoveVo);
		}
	}
}