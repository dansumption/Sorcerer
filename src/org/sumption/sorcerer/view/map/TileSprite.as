package org.sumption.sorcerer.view.map
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
        public static const STAIR_PADDING:Number = 0.1;
        public static const STAIR_PADDED_WIDTH:Number = CORRIDOR_WIDTH * 1.8;
        public static const STAIR_WIDTH:Number = STAIR_PADDED_WIDTH - STAIR_PADDING * 4;

        public static const BG_COLOUR:uint = 0x00cc00;
        public static const UNEXPLORED_BG_COLOUR:uint = 0x003300;
        public static const FG_COLOUR:uint = 0x000000;
        public static const STAIRS_COLOUR:uint = 0x00ff00;
        public static const NUMBER_OF_STAIRS:uint = 4;

        public function TileSprite(tile:TileVO)
        {
            this.tile = tile;
            init();
        }

        private function init():void
        {
            // trace ("\n draw tile");
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
            drawForeground((WIDTH - CAVERN_WIDTH) / 2, (HEIGHT - CAVERN_HEIGHT) / 2,
                    CAVERN_WIDTH, CAVERN_HEIGHT);
        }

        private function drawNorth(deadend:Boolean = false):void
        {
            // trace ("Draw north");
            var size:Number = (deadend ? DEAD_END_LENGTH : (HEIGHT + CORRIDOR_WIDTH) / 2);
            drawForeground((WIDTH - CORRIDOR_WIDTH) / 2, 0,
                    CORRIDOR_WIDTH, size, deadend);
        }

        private function drawSouth(deadend:Boolean = false):void
        {
            // trace ("Draw south");
            var size:Number = (deadend ? -DEAD_END_LENGTH : -(HEIGHT + CORRIDOR_WIDTH) / 2);
            drawForeground((WIDTH - CORRIDOR_WIDTH) / 2, HEIGHT,
                    CORRIDOR_WIDTH, size, deadend);
        }

        private function drawEast(deadend:Boolean = false):void
        {
            // trace ("Draw east");
            var size:Number = (deadend ? -DEAD_END_LENGTH : -(WIDTH + CORRIDOR_WIDTH) / 2);
            drawForeground(WIDTH, (HEIGHT - CORRIDOR_WIDTH) / 2,
                    size, CORRIDOR_WIDTH, deadend);
        }

        private function drawWest(deadend:Boolean = false):void
        {
            // trace ("Draw west");
            var size:Number = (deadend ? DEAD_END_LENGTH : (WIDTH + CORRIDOR_WIDTH) / 2);
            drawForeground(0, (HEIGHT - CORRIDOR_WIDTH) / 2,
                    size, CORRIDOR_WIDTH, deadend);
        }

        private function drawStairsUp():void
        {
            var stairs:StairUp = new StairUp();
            addChild(stairs);
            stairs.x = stairs.y = WIDTH/9;
            stairs.width = stairs.height = STAIR_PADDED_WIDTH;
            /*var stairX:Number = 3 * WIDTH / 18;
            var stairY:Number = 3 * HEIGHT / 18;
            drawForeground(stairX, stairY, STAIR_PADDED_WIDTH, STAIR_PADDED_WIDTH);
            graphics.beginFill(STAIRS_COLOUR);
            var i:uint;
            var rectX:Number;
            var rectY:Number;
            var rectW:Number;
            for (i = 0; i < NUMBER_OF_STAIRS; i++)
            {
                rectX = stairX + STAIR_PADDING * ((NUMBER_OF_STAIRS - i - 1) * 5);
                rectY = stairY + STAIR_PADDING * (i * 5);
                rectW = STAIR_WIDTH - STAIR_PADDING * ((NUMBER_OF_STAIRS - i - 1) * 5 + 8);
                graphics.drawRect(rectX, rectY, rectW, STAIR_PADDING * 3);
            }
            graphics.endFill();*/
        }

        private function drawStairsDown():void
        {
            var stairs:StairsDown = new StairsDown();
            addChild(stairs);
            stairs.x = stairs.y = WIDTH/2;
            stairs.width = stairs.height = STAIR_PADDED_WIDTH;
            /*var stairX:Number = WIDTH / 2;
            var stairY:Number = HEIGHT / 2;
            drawForeground(stairX, stairY, STAIR_PADDED_WIDTH, STAIR_PADDED_WIDTH);
            graphics.beginFill(STAIRS_COLOUR);
            var i:uint;
            var rectX:Number;
            var rectY:Number;
            var rectW:Number;
            for (i = 0; i < NUMBER_OF_STAIRS; i++)
            {
                rectX = stairX + STAIR_PADDING * (i * 5 + 10);
                rectY = stairY + STAIR_PADDING * (i * 5 + 10);
                rectW = STAIR_WIDTH - STAIR_PADDING * (i * 5 + 8);
                graphics.drawRect(rectX, rectY, rectW, STAIR_PADDING * 3);
            }
            graphics.endFill();*/
        }

        private function drawForeground(startX:Number, startY:Number, rectWidth:Number, rectHeight:Number, deadend:Boolean = false):void
        {
            graphics.beginFill(FG_COLOUR);
            graphics.drawRect(startX, startY, rectWidth, rectHeight);
            graphics.endFill();
        }
    }
}