package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_635:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_923:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_635);
         var_923 = param1;
      }
      
      public function get groupId() : int
      {
         return var_923;
      }
   }
}
