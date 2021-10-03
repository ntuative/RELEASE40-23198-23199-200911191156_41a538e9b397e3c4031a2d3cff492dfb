package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1523:int;
      
      private var var_1135:PetData;
      
      private var var_1795:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1523;
      }
      
      public function get petData() : PetData
      {
         return var_1135;
      }
      
      public function flush() : Boolean
      {
         var_1135 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1795;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1523 = param1.readInteger();
         var_1795 = param1.readInteger();
         var_1135 = new PetData(param1);
         return true;
      }
   }
}
