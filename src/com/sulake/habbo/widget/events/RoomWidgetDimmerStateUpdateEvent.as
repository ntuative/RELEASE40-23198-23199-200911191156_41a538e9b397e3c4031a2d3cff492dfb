package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_56:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_872:int;
      
      private var _color:uint;
      
      private var var_873:int;
      
      private var var_1646:int;
      
      private var _state:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_56,param6,param7);
         _state = param1;
         var_1646 = param2;
         var_872 = param3;
         _color = param4;
         var_873 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_873;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_872;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get presetId() : int
      {
         return var_1646;
      }
   }
}
