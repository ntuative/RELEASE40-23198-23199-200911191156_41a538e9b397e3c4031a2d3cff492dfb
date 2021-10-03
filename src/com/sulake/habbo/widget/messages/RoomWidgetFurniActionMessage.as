package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_229:String = "RWFAM_MOVE";
      
      public static const const_660:String = "RWFUAM_ROTATE";
      
      public static const const_653:String = "RWFAM_PICKUP";
       
      
      private var var_1951:int = 0;
      
      private var var_1950:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1951 = param2;
         var_1950 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1951;
      }
      
      public function get furniCategory() : int
      {
         return var_1950;
      }
   }
}
