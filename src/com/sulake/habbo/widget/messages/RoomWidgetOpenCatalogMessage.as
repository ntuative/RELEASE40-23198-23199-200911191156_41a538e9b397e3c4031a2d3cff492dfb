package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_676:String = "RWOCM_CLUB_MAIN";
      
      public static const const_513:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_2001:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_513);
         var_2001 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_2001;
      }
   }
}
