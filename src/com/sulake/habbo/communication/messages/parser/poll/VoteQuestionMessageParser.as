package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteQuestionMessageParser implements IMessageParser
   {
       
      
      private var var_916:Array;
      
      private var var_991:String;
      
      public function VoteQuestionMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_991 = param1.readString();
         var_916 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_916.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get choices() : Array
      {
         return var_916.slice();
      }
      
      public function flush() : Boolean
      {
         var_991 = "";
         var_916 = [];
         return true;
      }
      
      public function get question() : String
      {
         return var_991;
      }
   }
}
