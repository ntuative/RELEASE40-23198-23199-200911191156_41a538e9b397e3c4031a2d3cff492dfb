package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1502:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1384:String = "ROE_MOUSE_ENTER";
      
      public static const const_437:String = "ROE_MOUSE_MOVE";
      
      public static const const_1523:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_189:String = "ROE_MOUSE_CLICK";
      
      public static const const_452:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1897:Boolean;
      
      private var var_1899:Boolean;
      
      private var var_1900:Boolean;
      
      private var var_1901:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1900 = param4;
         var_1901 = param5;
         var_1897 = param6;
         var_1899 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1899;
      }
      
      public function get altKey() : Boolean
      {
         return var_1900;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1901;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1897;
      }
   }
}
