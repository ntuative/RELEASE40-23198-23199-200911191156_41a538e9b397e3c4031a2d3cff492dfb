package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_698:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_482:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_698);
         var_482 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_482;
      }
   }
}
