package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_56:String = "RODSUE_DIMMER_STATE";
       
      
      private var var_872:int;
      
      private var _color:uint;
      
      private var var_873:int;
      
      private var var_1646:int;
      
      private var _state:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:int, param2:String, param3:int, param4:int, param5:int, param6:uint, param7:int, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_56,param1,param2,param8,param9);
         _state = param3;
         var_1646 = param4;
         var_872 = param5;
         _color = param6;
         var_873 = param7;
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
