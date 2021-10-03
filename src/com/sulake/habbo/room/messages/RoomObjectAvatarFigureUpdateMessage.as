package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1749:String;
      
      private var var_546:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_546 = param1;
         var_1749 = param2;
      }
      
      public function get race() : String
      {
         return var_1749;
      }
      
      public function get figure() : String
      {
         return var_546;
      }
   }
}
