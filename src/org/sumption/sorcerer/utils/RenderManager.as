package org.sumption.sorcerer.utils
{
	import flash.display.Sprite;
	
	import maps.Map;
	import org.sumption.sorcerer.model.map.TileVO;
	import org.sumption.sorcerer.view.components.TileSprite;
	
	import org.sumption.sorcerer.model.party.PartyVO;
	
	import utils.Locator;

	public class RenderManager
	{
		private var baseSprite:Sprite;
		private var mapSprite:Sprite;
		private var actorSprite:Sprite;
		private var sizeIndex:uint = 1;
		private var actorOffset:uint = 4;
		
		
		public function get size():uint
		{
			return Scale.SIZES[sizeIndex];
		}
		
		public function zoomIn():void
		{
			if (sizeIndex > 0)
			{
				sizeIndex--;
				renderActor();
				render();
			}
		}
		
		public function zoomOut():void
		{
			if (sizeIndex < Scale.SIZES.length - 1)
			{
				sizeIndex++;
				renderActor();
				render();
			}
		}
		
		public function render():void
		{
			positionActor();
		}
		
		private function positionActor():void
		{
			var party:PartyVO = Locator.party;
			var tile:TileVO = Locator.map.getTile(party.x, party.y, party.z);
			if (!tile.fullyExplored)
			{
				actorSprite.x = 0 + MapUtils.xComponent(party.positionOnTile) * actorOffset * scale;
				actorSprite.y = 0 + MapUtils.yComponent(party.positionOnTile) * actorOffset * scale;
			}
			else
			{
				actorSprite.x = 0;
				actorSprite.y = 0;
			}
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
		
		private function get centreX():Number
		{
			return baseSprite.stage.stageWidth/2;
		}
		
		private function get centreY():Number
		{
			return baseSprite.stage.stageHeight/2;
		}
	}
}