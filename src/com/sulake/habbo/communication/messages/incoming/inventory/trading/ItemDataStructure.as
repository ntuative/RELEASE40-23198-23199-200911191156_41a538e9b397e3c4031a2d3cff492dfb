package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1607:int;
      
      private var var_1608:int;
      
      private var var_984:String;
      
      private var var_1571:int;
      
      private var var_1603:String;
      
      private var var_1604:int;
      
      private var var_1605:int;
      
      private var _category:int;
      
      private var var_1610:int;
      
      private var var_1606:int;
      
      private var var_1609:int;
      
      private var var_1602:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1571 = param1;
         var_984 = param2;
         var_1608 = param3;
         var_1609 = param4;
         _category = param5;
         var_1603 = param6;
         var_1604 = param7;
         var_1607 = param8;
         var_1606 = param9;
         var_1605 = param10;
         var_1602 = param11;
         var_1610 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1609;
      }
      
      public function get groupable() : Boolean
      {
         return var_1602;
      }
      
      public function get creationMonth() : int
      {
         return var_1606;
      }
      
      public function get roomItemID() : int
      {
         return var_1608;
      }
      
      public function get itemType() : String
      {
         return var_984;
      }
      
      public function get itemID() : int
      {
         return var_1571;
      }
      
      public function get itemSpecificData() : String
      {
         return var_1603;
      }
      
      public function get songID() : int
      {
         return var_1610;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1604;
      }
      
      public function get creationYear() : int
      {
         return var_1605;
      }
      
      public function get creationDay() : int
      {
         return var_1607;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
