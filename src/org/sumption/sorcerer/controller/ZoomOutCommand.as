/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 28/11/11
 * Time: 12:35
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.controller
{
    public class ZoomOutCommand extends ZoomCommand
    {
        override public function execute():void
        {
            mapModel.zoomOut();
            reRender();
        }
    }
}
