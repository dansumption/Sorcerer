package org.sumption.sorcerer.view
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.utils.Scale;
	import org.sumption.sorcerer.view.components.MapView;
	import org.sumption.sorcerer.view.components.TileSprite;
	
	public class MapMediator extends InteractiveMediator
	{
		public static const NAME:String = "org.sumption.sorcerer.view.MapMediator";
		
		public function MapMediator(viewComponent:MapView)
		{
			super(NAME, viewComponent);
		}
		
		private function get ui():MapView
		{
			return viewComponent as MapView;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				SystemNotifcations.RENDER
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
			}
		}
		
		public function render(centre:LocationVectorVO):void
		{
			var x:int = centre.x;
			var y:int = centre.y;
			var z:int = centre.z;
			var scale:Number = 10;
			var proxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			trace ("\nRENDER: centre " + x + ", " + y + ", " + z);
			clearBoard();
			var i:int;
			var j:int;
			var rowDelta:uint = Math.floor(Scale.ROWS/2); 
			var colDelta:uint = Math.floor(Scale.COLS/2);
			var tile:TileVO;
			var tileSprite:TileSprite;
			var tileLocation:LocationVectorVO;
			trace ("RENDER: x from " + (x - colDelta) + " to " + (x + colDelta));
			trace ("RENDER: y from " + (y - rowDelta) + " to " + (y + rowDelta));
			for (i = y-rowDelta; i <= y + rowDelta; i ++)
			{
				for (j = x-colDelta; j <= x+colDelta; j++)
				{
					tileLocation = new LocationVectorVO(j, i, z);
					tile = proxy.getTile(tileLocation);
					if (tile)
					{
						tileSprite = new TileSprite(tile);
						tileSprite.scaleX = tileSprite.scaleY = scale;
						tileSprite.x = centreX + (j - x - 0.5) * TileSprite.WIDTH * scale;
						tileSprite.y = centreY + (i - y - 0.5) * TileSprite.HEIGHT * scale;
						ui.addChild(tileSprite);
					}							
				}
			}
		}
		
		
		private function clearBoard():void
		{
			while (ui.numChildren)
			{
				ui.removeChildAt(0);
			}
		}

	}
}