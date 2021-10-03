package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_922:String = "select_outfit";
       
      
      private var var_1930:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_922);
         var_1930 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1930;
      }
   }
}
