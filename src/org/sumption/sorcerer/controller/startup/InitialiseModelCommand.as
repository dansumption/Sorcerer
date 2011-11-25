package org.sumption.sorcerer.controller.startup
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.sumption.sorcerer.model.cards.CardsProxy;
	import org.sumption.sorcerer.model.map.MapProxy;
	import org.sumption.sorcerer.model.party.PartiesProxy;
	
	public class InitialiseModelCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			trace (this + ".execute()");
			facade.registerProxy(new MapProxy());
			facade.registerProxy(new PartiesProxy());
			facade.registerProxy(new CardsProxy());
		}
	}
}