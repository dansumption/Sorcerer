package org.sumption.sorcerer.controller.startup
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.core.SystemNotifcations;
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	
	public class RenderCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var mapCentre:LocationVectorVO = notification.getBody() as LocationVectorVO;
			if (mapCentre == null)
			{
				mapCentre = new LocationVectorVO(0, 0, 0);
			}
			
		}
	}
}