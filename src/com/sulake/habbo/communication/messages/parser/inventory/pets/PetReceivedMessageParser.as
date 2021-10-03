package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1012:PetData;
      
      private var var_1492:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1492 = param1.readBoolean();
         var_1012 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1492 + ", " + var_1012.id + ", " + var_1012.name + ", " + pet.figure + ", " + var_1012.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1492;
      }
      
      public function get pet() : PetData
      {
         return var_1012;
      }
   }
}
