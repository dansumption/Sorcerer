package org.sumption.sorcerer.controller.startup
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.sumption.sorcerer.model.cards.CardsProxy;
	
	public class LoadCardsAsyncCommand extends AsyncCommand
	{
		public static const FILENAME:String = "../data/cardDeck.xml";
		
		override public function execute(notification:INotification):void
		{
			var loader:URLLoader= new URLLoader;
			var urlRequest:URLRequest = new URLRequest(FILENAME);
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.load(urlRequest);
		}
		
		private function onComplete(event:Event):void
		{
			var xml:XML = new XML(event.target.data);
			var proxy:CardsProxy = facade.retrieveProxy(CardsProxy.NAME) as CardsProxy;
			proxy.createCardDeckFromXml(xml);
			commandComplete();
		}
		
		private function onError(event:Event):void
		{
			throw new Error("Could not open data file");
		}
	}
}