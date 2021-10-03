package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_984:int;
      
      private var var_1214:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_984 = param1;
         var_1214 = param2;
      }
      
      public function get itemType() : int
      {
         return var_984;
      }
      
      public function get itemName() : String
      {
         return var_1214;
      }
   }
}
