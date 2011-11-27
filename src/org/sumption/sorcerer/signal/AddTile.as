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
    import org.sumption.sorcerer.model.map.LocationVectorVO;

    public class AddTile extends Signal
    {
        public function AddTile()
        {
            super (LocationVectorVO);
            trace("AddTime created")
        }
    }
}
