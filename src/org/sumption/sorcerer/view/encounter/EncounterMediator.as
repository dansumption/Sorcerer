/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 28/11/11
 * Time: 15:10
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.view.encounter
{
    import org.sumption.sorcerer.view.*;
    public class EncounterMediator extends InteractiveMediator
    {
        override public function onRegister():void
        {
            trace(this + ".onRegister");
        }
    }
}
