/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 27/11/11
 * Time: 10:02
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.service
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    public class XMLLoader
    {
        protected function load(filename:String):void
        {
            var loader:URLLoader= new URLLoader();
            var urlRequest:URLRequest = new URLRequest(filename);
            loader.addEventListener(Event.COMPLETE, onComplete);
            loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
            loader.load(urlRequest);
        }

        private function onError(event:Event):void
        {
            throw new Error("Could not open data file");
        }
        
        private function onComplete(event:Event):void
        {
            var xml:XML = new XML(event.target.data);
            processXML(xml);
        }
        
        protected function processXML(xml:XML):void
        {
            throw new Error("method must be overridden");
        }
    }
}
