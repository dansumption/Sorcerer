/**
 * Created by IntelliJ IDEA.
 * User: Dan Sumption
 * Date: 02/12/11
 * Time: 20:43
 * To change this template use File | Settings | File Templates.
 */
package org.sumption.sorcerer.model.map
{
    public class StaticLocationVectorVO extends LocationVectorVO
    {
        public function StaticLocationVectorVO(x:int, y:int, z:int)
        {
            super(x, y, z);
        }

        override public function set x(value:int):void
        {
            throw new Error("Cannot alter a static LocationVectorVO");
        }

        override public function set y(value:int):void
        {
            throw new Error("Cannot alter a static LocationVectorVO");
        }

        override public function set z(value:int):void
        {
            throw new Error("Cannot alter a static LocationVectorVO");
        }
    }
}
