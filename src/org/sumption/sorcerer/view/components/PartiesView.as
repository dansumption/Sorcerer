package org.sumption.sorcerer.view.components
{
    import flash.display.Sprite;

    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.party.PartyVO;
    import org.sumption.sorcerer.utils.MapUtils;
    import org.sumption.sorcerer.utils.Scale;

    public class PartiesView extends Sprite
    {
        public function render(centre:LocationVectorVO, scale:uint):void
        {
            var partySprite:PartySprite;
            var partyVo:PartyVO;
            var locationOffset:LocationVectorVO;
            for (var i:uint = 0; i < numChildren; i++)
            {
                partySprite = getChildAt(i) as PartySprite;
                partyVo = partySprite.party;
                locationOffset = partyVo.location.getDifference(centre);
                if (locationOffset.z != 0)
                {
                    partySprite.visible = false;
                }
                else
                {
                    var positionOffset:LocationVectorVO = partyVo.positionOnTile ? MapUtils.vector(partyVo.positionOnTile) : new LocationVectorVO(0,0,0);
                    partySprite.x = locationOffset.x * Scale.TILE_SIZE + positionOffset.x * Scale.TILE_SIZE/2;
                    partySprite.y = locationOffset.y * Scale.TILE_SIZE + positionOffset.y * Scale.TILE_SIZE/2;
                    partySprite.scaleX = partySprite.scaleY = scale;
                }
            }
        }
    }
}