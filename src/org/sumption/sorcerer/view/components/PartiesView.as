package org.sumption.sorcerer.view.components
{
	import flash.display.Sprite;
	
	import org.sumption.sorcerer.model.map.LocationVectorVO;
	import org.sumption.sorcerer.model.party.PartyVO;
	import org.sumption.sorcerer.utils.Scale;
	
	public class PartiesView extends Sprite
	{
		public function PartiesView()
		{
			super();
		}
		
		public function render(centre:LocationVectorVO):void
		{
			var partySprite:PartySprite;
			var partyVo:PartyVO;
			var locationOffset:LocationVectorVO;
			for (var i:uint=0; i< numChildren; i++)
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
					partySprite.x = locationOffset.x * Scale.TILE_SIZE;
					partySprite.y = locationOffset.y * Scale.TILE_SIZE;
				}
			}
		}
	}
}