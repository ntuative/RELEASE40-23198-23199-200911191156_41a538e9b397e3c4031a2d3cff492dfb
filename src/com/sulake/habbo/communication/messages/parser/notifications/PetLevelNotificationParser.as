package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_546:String;
      
      private var var_1522:int;
      
      private var var_1844:String;
      
      private var var_971:int;
      
      private var var_1043:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1043;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1043 = param1.readInteger();
         var_1844 = param1.readString();
         var_1522 = param1.readInteger();
         var_546 = param1.readString();
         var_971 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1844;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_546;
      }
      
      public function get petType() : int
      {
         return var_971;
      }
      
      public function get level() : int
      {
         return var_1522;
      }
   }
}
