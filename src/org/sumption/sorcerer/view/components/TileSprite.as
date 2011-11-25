package org.sumption.sorcerer.view.components
{
	import flash.display.Sprite;
	
	import org.sumption.sorcerer.model.map.TileVO;
	
	public class TileSprite extends Sprite
	{
		private var tile:TileVO;
		public static const WIDTH:Number = 10;
		public static const HEIGHT:Number = 10;
		public static const CORRIDOR_WIDTH:Number = 2;
		public static const CAVERN_WIDTH:Number = 7;
		public static const CAVERN_HEIGHT:Number = 7;
		public static const DEAD_END_LENGTH:Number = 0.5;
		
		public static const BG_COLOUR:uint = 0x443300;
		public static const UNEXPLORED_BG_COLOUR:uint = 0x883300;
		public static const FG_COLOUR:uint = 0xeeeeff;
		public static const STAIRS_COLOUR:uint = 0x0000cc;
		
		public function TileSprite(tile:TileVO)
		{
			this.tile = tile;
			init();
		}
		
		private function init():void
		{
			// trace ("\ndraw tile");
			drawBackground();
			if (tile.exploredNorth)
			{
				// trace ("draw north, deadend: " + !tile.north);
				drawNorth(!tile.north);
			}
			else
			{
				// trace (tile.explored + " excludes North");
			}
			if (tile.exploredSouth)
			{
				// trace ("draw south, deadend: " + !tile.south);
				drawSouth(!tile.south);
			}
			else
			{
				// trace (tile.explored + " excludes South");
			}
			if (tile.exploredEast)
			{
				// trace ("draw east, deadend: " + !tile.east);
				drawEast(!tile.east);
			}
			else
			{
				// trace (tile.explored + " excludes East");
			}
			if (tile.exploredWest)
			{
				// trace ("draw west, deadend: " + !tile.west);
				drawWest(!tile.west);
			}
			else
			{
				// trace (tile.explored + " excludes West");
			}
			if (tile.cavern && tile.fullyExplored)
			{
				drawCavern();
			}
			if (tile.up && tile.fullyExplored)
			{
				drawStairsUp();
			}
			if (tile.down && tile.fullyExplored)
			{
				drawStairsDown();
			}
		}
		
		private function drawBackground():void
		{
			graphics.beginFill(tile.fullyExplored ? BG_COLOUR : UNEXPLORED_BG_COLOUR);
			graphics.drawRect(0, 0, WIDTH, HEIGHT);
			graphics.endFill();
		}
		
		private function drawCavern():void
		{
			drawForeground((WIDTH - CAVERN_WIDTH)/2, (HEIGHT - CAVERN_HEIGHT)/2,
				CAVERN_WIDTH, CAVERN_HEIGHT);
		}

		private function drawNorth(deadend:Boolean = false):void
		{
			// trace ("Draw north");
			var size:Number = (deadend ? DEAD_END_LENGTH : (HEIGHT + CORRIDOR_WIDTH)/2);
			drawForeground((WIDTH - CORRIDOR_WIDTH)/2, 0,
				CORRIDOR_WIDTH, size, deadend); 
		}
		
		private function drawSouth(deadend:Boolean = false):void
		{
			// trace ("Draw south");
			var size:Number = (deadend ? -DEAD_END_LENGTH : -(HEIGHT + CORRIDOR_WIDTH)/2);
			drawForeground((WIDTH - CORRIDOR_WIDTH)/2, HEIGHT,
				CORRIDOR_WIDTH, size, deadend);
		}
		
		private function drawEast(deadend:Boolean = false):void
		{
			// trace ("Draw east");
			var size:Number = (deadend ? -DEAD_END_LENGTH : -(WIDTH + CORRIDOR_WIDTH)/2);
			drawForeground(WIDTH, (HEIGHT - CORRIDOR_WIDTH)/2,
				size, CORRIDOR_WIDTH, deadend);
		}
		
		private function drawWest(deadend:Boolean = false):void
		{
			// trace ("Draw west");
			var size:Number = (deadend ? DEAD_END_LENGTH : (WIDTH + CORRIDOR_WIDTH)/2);
			drawForeground(0, (HEIGHT - CORRIDOR_WIDTH)/2,
				size, CORRIDOR_WIDTH, deadend);
		}
		
		private function drawStairsUp():void
		{
			drawForeground(2 * WIDTH/9, 2 * HEIGHT/9, CORRIDOR_WIDTH * 1.5, CORRIDOR_WIDTH * 1.5);
			graphics.lineStyle(0.5, STAIRS_COLOUR);
			graphics.drawCircle(WIDTH/3, HEIGHT/3, CORRIDOR_WIDTH/2);
			graphics.lineStyle();
		}
		
		private function drawStairsDown():void
		{
			drawForeground(WIDTH/2, HEIGHT/2, CORRIDOR_WIDTH * 1.5, CORRIDOR_WIDTH * 1.5);
			graphics.beginFill(STAIRS_COLOUR);
			graphics.drawCircle(WIDTH/3 * 2, HEIGHT/3 * 2, CORRIDOR_WIDTH/2);
			graphics.endFill();
		}
		
		private function drawForeground(startX:Number, startY:Number, rectWidth:Number, rectHeight:Number, deadend:Boolean = false):void
		{
			graphics.beginFill(FG_COLOUR);
			graphics.drawRect(startX, startY, rectWidth, rectHeight);
			graphics.endFill();
		}
	}
}