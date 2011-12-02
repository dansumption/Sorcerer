package org.sumption.sorcerer.controller.moving
{
    import flash.utils.getTimer;

    import org.robotlegs.mvcs.Command;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.map.LocationVectorVO;
    import org.sumption.sorcerer.model.map.TileVO;
    import org.sumption.sorcerer.model.party.PartyMoveVO;
    import org.sumption.sorcerer.signal.AddTile;
    import org.sumption.sorcerer.utils.MapUtils;
    import org.sumption.sorcerer.utils.MapUtils;

    public class RetrieveNewTileCommand extends Command
    {
        [Inject]
        public var partyMoveVo:PartyMoveVO;

        [Inject]
        public var mapModel:MapModel;

        [Inject]
        public var addTile:AddTile;

        private var toTile:TileVO;

        private static const REQUIRED_FREE_EXITS:uint = 4;

        private var tilesToCheckStack:Vector.<TileVO>;
        private var tilesCheckedStack:Vector.<TileVO>;
        private var freeExits:int;
        private var tilesChecked:int;
        private var startTime:int;

        override public function execute():void
        {
            trace(this + ".execute()");
            if (partyMoveVo.allowed && !partyMoveVo.leavingGame)
            {
                retrieveNewTile();
            }
        }

        private function retrieveNewTile():void
        {
            trace("Check if new tile needed at location " + partyMoveVo.party.location);
            assignTargetTile();
            if (toTile == null)
            {
                addTile.dispatch(partyMoveVo.party.location);
                assignTargetTile();
                trace ("\tAdded new tile " + toTile);
            }
            addStairsToTargetTile();
            checkFreeExitsInWholeDungeon();
        }

        private function assignTargetTile():void
        {
            toTile = mapModel.getTile(partyMoveVo.party.location);
        }

        private function addStairsToTargetTile():void
        {
            // Stairs never lead to dead ends
            if (partyMoveVo.direction == MapUtils.UP || partyMoveVo.direction == MapUtils.DOWN)
            {
                toTile.addExitOpposite(partyMoveVo.direction)
            }
        }

        private function checkFreeExitsInWholeDungeon():void
        {
            var fromLocation:LocationVectorVO = partyMoveVo.party.location.clone();
            fromLocation.add(MapUtils.directionToVector(MapUtils.opposite(partyMoveVo.direction)));
            var tile:TileVO = mapModel.getTile(fromLocation);
            freeExits = 0;
            tilesChecked = 0;
            tilesToCheckStack = new Vector.<TileVO>();
            tilesCheckedStack = new Vector.<TileVO>();
            startTime = getTimer();
            checkFreeExits(tile);
            trace ("Checked " + tilesChecked + " tiles in " + (getTimer() - startTime) + "ms and found " + freeExits + " exits.");
            tilesToCheckStack = null;
            tilesCheckedStack = null;

            if (freeExits < REQUIRED_FREE_EXITS)
            {
                trace("**********************");
                trace("NOT ENOUGH EXITS");
                if (!toTile.hasExitInDirection(MapUtils.opposite(partyMoveVo.direction)))
                {
                    trace("UNBLOCKING DEAD END");
                    toTile.addExitOpposite(partyMoveVo.direction);
                }
                if (freeExits < REQUIRED_FREE_EXITS - 1)
                {
                    trace("ADDING STAIRS DOWN");
                    toTile.down = true;
                }
                if (freeExits < REQUIRED_FREE_EXITS - 2)
                {
                    trace("ADDING CARDINAL EXITS");
                    // TODO - possibly some wizardry around newly appeared exits.
                    toTile.north = toTile.south = toTile.east = toTile.west = true;
                }
                trace("**********************");
            }
        }

        private function checkFreeExits(tile:TileVO):void
        {
            tilesChecked++;
            var exitTile:TileVO;
            var exitLocation:LocationVectorVO;
            trace("\t checking " + tile.location);
            for each (var direction:uint in MapUtils.ALL_DIRECTIONS)
            {
                if (tile.hasExitInDirection(direction))
                {
                    exitLocation = tile.location.clone();
                    exitLocation.add(MapUtils.directionToVector(direction));
                    trace ("\t\tCheck " + MapUtils.name(direction) + " = " + exitLocation);
                    exitTile = mapModel.getTile(exitLocation);
                    if (exitTile)
                    {
                        if (exitTile.hasExitInDirection(MapUtils.opposite(direction))
                                && tilesToCheckStack.indexOf(exitTile) == -1
                                && tilesCheckedStack.indexOf(exitTile) == -1)
                        {
                            trace("\t\t\t push on stack");
                            tilesToCheckStack.push(exitTile);
                        }
                        else
                        {
                            trace ("\t\t\t no matching exit on this tile");
                        }
                    }
                    else
                    {
                        trace("\t\t\t add free exit");
                        freeExits++;
                    }
                }
            }
            tilesCheckedStack.push(tile);
            if (freeExits < REQUIRED_FREE_EXITS && tilesToCheckStack.length)
            {
                checkFreeExits(tilesToCheckStack.shift());
            }
        }
    }
}