/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 27/11/11
 * Time: 08:51
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.signal
{
    import org.osflash.signals.Signal;
    import org.sumption.sorcerer.model.party.PartyVO;

    public class PartyAdded extends Signal
    {
        public function PartyAdded()
        {
            super(PartyVO);
            trace("PartyAdded created");
        }
    }
}