package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
   
   public class RoomSettingsDataMessageParser implements IMessageParser
   {
       
      
      private var var_109:RoomSettingsData;
      
      public function RoomSettingsDataMessageParser()
      {
         super();
      }
      
      public function get data() : RoomSettingsData
      {
         return var_109;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_109 = new RoomSettingsData();
         var_109.roomId = param1.readInteger();
         var_109.name = param1.readString();
         var_109.description = param1.readString();
         var_109.doorMode = param1.readInteger();
         var_109.categoryId = param1.readInteger();
         var_109.maximumVisitors = param1.readInteger();
         var_109.maximumVisitorsLimit = param1.readInteger();
         var_109.showOwnerName = param1.readInteger() == 1 ? true : false;
         var_109.allowFurniMoving = param1.readInteger() == 1 ? true : false;
         var_109.allowTrading = param1.readInteger() == 1 ? true : false;
         var_109.tags = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_109.tags.push(param1.readString());
            _loc3_++;
         }
         var_109.controllers = [];
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            var_109.controllers.push(new FlatControllerData(param1));
            _loc5_++;
         }
         var_109.controllerCount = param1.readInteger();
         var_109.allowPets = param1.readInteger() == 1 ? true : false;
         return true;
      }
      
      public function flush() : Boolean
      {
         var_109 = null;
         return true;
      }
   }
}
