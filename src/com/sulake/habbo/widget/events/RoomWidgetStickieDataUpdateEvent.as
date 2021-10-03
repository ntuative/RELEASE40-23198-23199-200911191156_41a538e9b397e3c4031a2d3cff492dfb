package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_512:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_204:String;
      
      private var var_596:String;
      
      private var var_1319:String;
      
      private var var_161:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_161 = param2;
         var_1319 = param3;
         var_204 = param4;
         var_596 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1319;
      }
      
      public function get colorHex() : String
      {
         return var_596;
      }
      
      public function get text() : String
      {
         return var_204;
      }
      
      public function get objectId() : int
      {
         return var_161;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
