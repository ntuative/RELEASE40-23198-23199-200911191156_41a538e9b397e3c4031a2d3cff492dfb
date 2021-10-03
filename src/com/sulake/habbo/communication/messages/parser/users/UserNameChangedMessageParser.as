package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserNameChangedMessageParser implements IMessageParser
   {
       
      
      private var var_1095:String;
      
      private var var_1094:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      public function UserNameChangedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1094 = param1.readInteger();
         _id = param1.readInteger();
         var_1095 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1094 = -1;
         _id = -1;
         var_1095 = "";
         return true;
      }
      
      public function get newName() : String
      {
         return var_1095;
      }
      
      public function get webId() : int
      {
         return var_1094;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
