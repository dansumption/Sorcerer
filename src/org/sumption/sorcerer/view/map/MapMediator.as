package org.sumption.sorcerer.view.map
{
    import org.sumption.sorcerer.view.*;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.signal.Render;
    import org.sumption.sorcerer.utils.Scale;
    import org.sumption.sorcerer.view.map.TileSprite;

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
            viewComponent.clearBoard();
            viewComponent.sizeIndex = mapModel.sizeIndex;
            viewComponent.x = centreX;
            viewComponent.y = centreY;
            viewComponent.onRender(mapModel, centre);
        }
    }
}