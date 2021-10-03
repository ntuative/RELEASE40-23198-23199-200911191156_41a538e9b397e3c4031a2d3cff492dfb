package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomMessageParser implements IMessageParser
   {
      
      public static const const_1522:int = 0;
      
      public static const const_1394:int = 1;
       
      
      private var var_2192:int;
      
      private var var_1140:int;
      
      public function CanCreateRoomMessageParser()
      {
         super();
      }
      
      public function get roomLimit() : int
      {
         return var_2192;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1140 = param1.readInteger();
         this.var_2192 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_1140;
      }
   }
}
