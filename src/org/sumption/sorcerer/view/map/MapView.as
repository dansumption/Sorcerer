package org.sumption.sorcerer.view.map
{
    import org.sumption.sorcerer.view.components.*;
    import flash.display.Sprite;

    import org.sumption.sorcerer.model.MapModel;

    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.utils.Scale;

    public class MapView extends Sprite
    {
        public var sizeIndex:uint;

        public function onRender(mapModel:MapModel, centre:LocationVectorVO):void
        {
            trace ("--------------------------------------------------------");
            trace ("RENDER MAP to size index " + sizeIndex);
            trace ("rows: " + rows);
            trace ("cols: " + cols);
            trace ("scale: " + scale);

            var x:int = centre.x;
            var y:int = centre.y;
            var z:int = centre.z;
            trace(this + ".onRender: centre " + x + ", " + y + ", " + z);
            var i:int;
            var j:int;
            var rowDelta:uint = Math.floor(rows/ 2);
            var colDelta:uint = Math.floor(cols / 2);
            var tile:TileVO;
            var tileSprite:TileSprite;
            var tileLocation:LocationVectorVO;
            trace("RENDER: x from " + (x - colDelta) + " to " + (x + colDelta));
            trace("RENDER: y from " + (y - rowDelta) + " to " + (y + rowDelta));
            for (i = y - rowDelta; i <= y + rowDelta; i++)
            {
                for (j = x - colDelta; j <= x + colDelta; j++)
                {
                    tileLocation = new LocationVectorVO(j, i, z);
                    tile = mapModel.getTile(tileLocation);
                    if (tile)
                    {
                        tileSprite = new TileSprite(tile);
                        tileSprite.scaleX = tileSprite.scaleY = scale;
                        tileSprite.x = (j - x - 0.5) * TileSprite.WIDTH * scale;
                        tileSprite.y = (i - y - 0.5) * TileSprite.HEIGHT * scale;
                        addChild(tileSprite);
                    }
                }
            }
            trace ("--------------------------------------------------------");
        }

        public function clearBoard():void
        {
            while (numChildren)
            {
                removeChildAt(0);
            }
        }

        public function get size():uint
        {
            return Scale.SIZES[sizeIndex];
        }

        private function get rows():uint
        {
            return Scale.rows(size);
        }

        private function get cols():uint
        {
            return Scale.cols(size);
        }

        private function get scale():uint
        {
            return Scale.scale(size);
        }
    }
}