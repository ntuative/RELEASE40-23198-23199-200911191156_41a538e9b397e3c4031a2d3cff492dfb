package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1239:int;
      
      private var var_991:String;
      
      private var var_592:Array;
      
      private var var_916:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_592.slice();
      }
      
      public function flush() : Boolean
      {
         var_991 = "";
         var_916 = [];
         var_592 = [];
         var_1239 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1239;
      }
      
      public function get question() : String
      {
         return var_991;
      }
      
      public function get choices() : Array
      {
         return var_916.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_991 = param1.readString();
         var_916 = [];
         var_592 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_916.push(param1.readString());
            var_592.push(param1.readInteger());
            _loc3_++;
         }
         var_1239 = param1.readInteger();
         return true;
      }
   }
}
