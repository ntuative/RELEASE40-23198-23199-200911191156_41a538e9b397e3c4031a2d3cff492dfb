package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1363:int = 10;
       
      
      private var var_1458:NavigatorSettingsMessageParser;
      
      private var var_1224:int;
      
      private var var_1998:Boolean;
      
      private var var_1996:int;
      
      private var var_807:Dictionary;
      
      private var var_2183:int;
      
      private var var_1999:int;
      
      private var var_1665:int;
      
      private var var_318:Array;
      
      private var var_1995:int;
      
      private var var_1251:Array;
      
      private var var_558:PublicRoomShortData;
      
      private var var_401:RoomEventData;
      
      private var var_141:MsgWithRequestId;
      
      private var var_1997:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1994:Boolean;
      
      private var var_203:GuestRoomData;
      
      private var var_667:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_318 = new Array();
         var_807 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1996;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1994;
      }
      
      public function startLoading() : void
      {
         this.var_667 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1994 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_401 != null)
         {
            var_401.dispose();
         }
         var_401 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_141 != null && var_141 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_141 != null && var_141 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_141 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_203;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_558 = null;
         var_203 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_558 = param1.publicSpace;
            var_401 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_401 != null)
         {
            var_401.dispose();
            var_401 = null;
         }
         if(var_558 != null)
         {
            var_558.dispose();
            var_558 = null;
         }
         if(var_203 != null)
         {
            var_203.dispose();
            var_203 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_141 = param1;
         var_667 = false;
         if(var_1251 == null)
         {
            var_1251 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1458;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_141 = param1;
         var_667 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_318.length > param1)
         {
            return var_318[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2183 = param1.limit;
         this.var_1224 = param1.favouriteRoomIds.length;
         this.var_807 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_807[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_141 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_318;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_558;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1665 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1998;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_141 = param1;
         var_667 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_318.length)
         {
            if((var_318[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_203 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_667;
      }
      
      public function set categories(param1:Array) : void
      {
         var_318 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_1999;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1995;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1458 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_141 == null)
         {
            return;
         }
         var_141.dispose();
         var_141 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_401;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_807[param1] = !!param2 ? "yes" : null;
         var_1224 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_141 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1251;
      }
      
      public function get avatarId() : int
      {
         return var_1665;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_141 != null && var_141 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1998 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1999 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1997 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_203 != null)
         {
            var_203.dispose();
         }
         var_203 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_318)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_203 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1458.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1224 >= var_2183;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1995 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1997;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_203 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1996 = param1;
      }
   }
}
