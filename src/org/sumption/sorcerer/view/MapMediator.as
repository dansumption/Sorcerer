package org.sumption.sorcerer.view
{
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.signal.Render;
    import org.sumption.sorcerer.utils.Scale;
    import org.sumption.sorcerer.view.components.TileSprite;

    public class MapMediator extends InteractiveMediator
    {
        [Inject]
        public var render:Render;

        [Inject]
        public var mapModel:MapModel;

        override public function onRegister():void
        {
            trace(this + ".onRegister");
            render.add(onRender);
        }

        public function onRender(centre:LocationVectorVO):void
        {
            var x:int = centre.x;
            var y:int = centre.y;
            var z:int = centre.z;
            var scale:Number = 10;
            trace(this + ".onRender: centre " + x + ", " + y + ", " + z);
            clearBoard();
            var i:int;
            var j:int;
            var rowDelta:uint = Math.floor(Scale.ROWS / 2);
            var colDelta:uint = Math.floor(Scale.COLS / 2);
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
                        tileSprite.x = centreX + (j - x - 0.5) * TileSprite.WIDTH * scale;
                        tileSprite.y = centreY + (i - y - 0.5) * TileSprite.HEIGHT * scale;
                        getViewComponent().addChild(tileSprite);
                    }
                }
            }
        }

        private function clearBoard():void
        {
            while (getViewComponent().numChildren)
            {
                getViewComponent().removeChildAt(0);
            }
        }
    }
}