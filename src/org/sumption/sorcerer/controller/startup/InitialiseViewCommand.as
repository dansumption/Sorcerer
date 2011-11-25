package org.sumption.sorcerer.controller.startup
{
	import flash.display.Sprite;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.view.MapMediator;
	import org.sumption.sorcerer.view.PartiesMediator;
	import org.sumption.sorcerer.view.StageMediator;
	import org.sumption.sorcerer.view.components.MapView;
	import org.sumption.sorcerer.view.components.PartiesView;
	
	public class InitialiseViewCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			var parent:Sprite = notification.getBody() as Sprite;
			
			facade.registerMediator(new StageMediator(parent.stage));
			
			var mapView:MapView = new MapView();
			parent.addChild(mapView);
			facade.registerMediator(new MapMediator(mapView));
			
			var partiesView:PartiesView = new PartiesView();
			parent.addChild(partiesView);
			facade.registerMediator(new PartiesMediator(partiesView));
		}
	}
}