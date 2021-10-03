package com.sulake.habbo.communication.messages.parser.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ChangeUserNameResultMessageParser implements IMessageParser
   {
       
      
      private var var_938:Array;
      
      private var var_1140:int = -1;
      
      private var _name:String;
      
      public function ChangeUserNameResultMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1140 = param1.readInteger();
         _name = param1.readString();
         var _loc2_:int = param1.readInteger();
         var_938 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_938.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get nameSuggestions() : Array
      {
         return var_938;
      }
      
      public function flush() : Boolean
      {
         var_1140 = -1;
         _name = "";
         var_938 = null;
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_1140;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}
