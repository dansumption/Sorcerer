/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 27/11/11
 * Time: 06:41
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.signal
{
    import org.osflash.signals.Signal;
    import org.sumption.sorcerer.model.map.TileVO;

    public class EnterCavern extends Signal
    {
        public function EnterCavern()
        {
            super (TileVO);
            trace("AddTime created")
        }
    }
}
