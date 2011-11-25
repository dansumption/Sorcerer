package org.sumption.sorcerer.model.map
{
	import org.sumption.sorcerer.utils.MapUtils;
	import org.sumption.sorcerer.model.cards.ICard;

	public class TileVO
	{
		public var exitData:int;
		public var location:LocationVectorVO;

		public var explored:int = 0;
		
		public var cards:Vector.<ICard> = new Vector.<ICard>();
		
		
		// ----------------------------------------------------------------------------
		
		public function get north():Boolean
		{
			return hasExitInDirection(MapUtils.NORTH);
		}
		
		public function set north(value:Boolean):void
		{
			setExitInDirection(MapUtils.NORTH, value);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get south():Boolean
		{
			return hasExitInDirection(MapUtils.SOUTH);
		}
		
		public function set south(value:Boolean):void
		{
			setExitInDirection(MapUtils.SOUTH, value);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get east():Boolean
		{
			return hasExitInDirection(MapUtils.EAST);
		}
		
		public function set east(value:Boolean):void
		{
			setExitInDirection(MapUtils.EAST, value);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get west():Boolean
		{
			return hasExitInDirection(MapUtils.WEST);
		}
		
		public function set west(value:Boolean):void
		{
			setExitInDirection(MapUtils.WEST, value);
		}
		
		// ----------------------------------------------------------------------------
		
		
		// ----------------------------------------------------------------------------
		
		public function get up():Boolean
		{
			return hasExitInDirection(MapUtils.UP);
		}
		
		public function set up(value:Boolean):void
		{
			setExitInDirection(MapUtils.UP, value);
		}
		
		// ----------------------------------------------------------------------------
		
		
		// ----------------------------------------------------------------------------
		
		public function get down():Boolean
		{
			return hasExitInDirection(MapUtils.DOWN);
		}
		
		public function set down(value:Boolean):void
		{
			setExitInDirection(MapUtils.DOWN, value);
		}
		
		// ----------------------------------------------------------------------------
		
		// ----------------------------------------------------------------------------
		
		public function get exploredNorth():Boolean
		{
			return getExploredFlag(MapUtils.NORTH);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get exploredSouth():Boolean
		{
			return getExploredFlag(MapUtils.SOUTH);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get exploredEast():Boolean
		{
			return getExploredFlag(MapUtils.EAST);
		}
				
		// ----------------------------------------------------------------------------
		
		public function get exploredWest():Boolean
		{
			return getExploredFlag(MapUtils.WEST);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get cavern():Boolean
		{
			return hasExitInDirection(MapUtils.CAVERN);
		}
		
		public function set cavern(value:Boolean):void
		{
			setExitInDirection(MapUtils.CAVERN, value);
		}
		
		// ----------------------------------------------------------------------------
		
		public function hasExitInDirection(flag:uint):Boolean
		{
			return Boolean (exitData & flag);
		}
		
		private function setExitInDirection(flag:uint, value:Boolean):void
		{
			if (value)
			{
				exitData = exitData | flag;
			}
			else
			{
				exitData = hasExitInDirection(flag) ? exitData ^ flag : exitData;
			}
		}
		
		// ----------------------------------------------------------------------------
		
		public function getExploredFlag(flag:uint):Boolean
		{
			return Boolean (explored & flag);
		}
		
		// ----------------------------------------------------------------------------
		
		public function get fullyExplored():Boolean
		{
			return explored == MapUtils.CARDINAL_DIRECTIONS;
		}
		
		public function set fullyExplored(value:Boolean):void
		{
			explored = value ? MapUtils.CARDINAL_DIRECTIONS : 0;
		}
		
		// ----------------------------------------------------------------------------
		
		public function get numCardinalExits():uint
		{
			var returnValue:uint = 0;
			if (north) returnValue++;
			if (east) returnValue++;
			if (south) returnValue++;
			if (west) returnValue++;
			return returnValue;
		}
		
		public function toString():String
		{
			var details:String = cavern ? "CAVERN" : "CORRIDOR";
			details += " at " + LocationVectorVO;
			details += " with exits: ";
			if (north) details += "north | ";
			if (east) details += "east | ";
			if (south) details += "south | ";
			if (west) details += "west | ";
			if (up) details += "up | ";
			if (down) details += "down ";

			return details;
		}
	}
}