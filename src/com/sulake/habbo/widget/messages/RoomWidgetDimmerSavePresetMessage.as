package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_679:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1804:int;
      
      private var var_1802:int;
      
      private var var_1803:Boolean;
      
      private var var_873:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_679);
         var_1802 = param1;
         var_1804 = param2;
         _color = param3;
         var_873 = param4;
         var_1803 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1804;
      }
      
      public function get presetNumber() : int
      {
         return var_1802;
      }
      
      public function get brightness() : int
      {
         return var_873;
      }
      
      public function get apply() : Boolean
      {
         return var_1803;
      }
   }
}
