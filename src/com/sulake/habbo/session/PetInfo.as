package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1522:int;
      
      private var var_1523:int;
      
      private var var_1528:int;
      
      private var var_1526:int;
      
      private var _nutrition:int;
      
      private var var_1043:int;
      
      private var var_1525:int;
      
      private var var_1524:int;
      
      private var _energy:int;
      
      private var var_1520:int;
      
      private var var_1527:int;
      
      private var _ownerName:String;
      
      private var var_1521:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         var_1523 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1522 = param1;
      }
      
      public function get petId() : int
      {
         return var_1043;
      }
      
      public function get experienceMax() : int
      {
         return var_1524;
      }
      
      public function get nutritionMax() : int
      {
         return var_1526;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1525 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1521;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1043 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1527;
      }
      
      public function get respect() : int
      {
         return var_1523;
      }
      
      public function get levelMax() : int
      {
         return var_1525;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1524 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1528 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1526 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1521 = param1;
      }
      
      public function get experience() : int
      {
         return var_1528;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1527 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1520 = param1;
      }
      
      public function get age() : int
      {
         return var_1520;
      }
   }
}
