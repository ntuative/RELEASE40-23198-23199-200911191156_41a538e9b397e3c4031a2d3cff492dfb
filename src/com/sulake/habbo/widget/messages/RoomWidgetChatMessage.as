package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_112:int = 0;
      
      public static const const_119:int = 1;
      
      public static const const_94:int = 2;
      
      public static const const_571:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1219:int = 0;
      
      private var var_1958:String = "";
      
      private var var_204:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_204 = param2;
         var_1219 = param3;
         var_1958 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1958;
      }
      
      public function get chatType() : int
      {
         return var_1219;
      }
      
      public function get text() : String
      {
         return var_204;
      }
   }
}
