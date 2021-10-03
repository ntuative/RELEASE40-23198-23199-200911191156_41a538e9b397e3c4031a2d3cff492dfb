package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1520:int;
      
      private var var_546:String;
      
      private var var_1522:int;
      
      private var var_1523:int;
      
      private var var_1528:int;
      
      private var var_1539:int;
      
      private var _nutrition:int;
      
      private var var_1043:int;
      
      private var var_1538:int;
      
      private var var_1537:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1521:int;
      
      private var var_1540:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1522;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1539;
      }
      
      public function flush() : Boolean
      {
         var_1043 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1538;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1537;
      }
      
      public function get maxNutrition() : int
      {
         return var_1540;
      }
      
      public function get figure() : String
      {
         return var_546;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1523;
      }
      
      public function get petId() : int
      {
         return var_1043;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1043 = param1.readInteger();
         _name = param1.readString();
         var_1522 = param1.readInteger();
         var_1538 = param1.readInteger();
         var_1528 = param1.readInteger();
         var_1537 = param1.readInteger();
         _energy = param1.readInteger();
         var_1539 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1540 = param1.readInteger();
         var_546 = param1.readString();
         var_1523 = param1.readInteger();
         var_1521 = param1.readInteger();
         _ownerName = param1.readString();
         var_1520 = param1.readInteger();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1528;
      }
      
      public function get ownerId() : int
      {
         return var_1521;
      }
      
      public function get age() : int
      {
         return var_1520;
      }
   }
}
