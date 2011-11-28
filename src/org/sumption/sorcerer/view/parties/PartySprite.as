package org.sumption.sorcerer.view.parties
{
	import flash.display.Sprite;
	
	import org.sumption.sorcerer.model.party.PartyVO;
	
	public class PartySprite extends Sprite
	{
		private static const SIZE:Number = 1;
		
		public var party:PartyVO;
		
		public function PartySprite(party:PartyVO)
		{
			this.party = party;
		}
		
		public function draw():void
		{
			graphics.clear();
			graphics.beginFill(party.markerColour);
			graphics.drawCircle(0, 0, SIZE);
		}
	}
}