package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_582:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1529:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_582);
         var_1529 = param1;
      }
      
      public function get tag() : String
      {
         return var_1529;
      }
   }
}
