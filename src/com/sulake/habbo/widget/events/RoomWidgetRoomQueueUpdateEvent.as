package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_361:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_299:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_792:int;
      
      private var var_255:Boolean;
      
      private var var_1746:Boolean;
      
      private var var_1373:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_792 = param2;
         var_1746 = param3;
         var_255 = param4;
         var_1373 = param5;
      }
      
      public function get position() : int
      {
         return var_792;
      }
      
      public function get isActive() : Boolean
      {
         return var_255;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1373;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1746;
      }
   }
}
