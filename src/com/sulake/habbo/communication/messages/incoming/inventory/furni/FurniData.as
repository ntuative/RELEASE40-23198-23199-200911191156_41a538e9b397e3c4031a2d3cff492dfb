package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1619:String;
      
      private var var_984:String;
      
      private var var_1622:Boolean;
      
      private var var_1618:int;
      
      private var var_1621:Boolean;
      
      private var var_1617:String = "";
      
      private var _category:int;
      
      private var var_1244:int;
      
      private var var_1620:Boolean;
      
      private var var_1623:int = -1;
      
      private var _objId:int;
      
      private var var_1624:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:int)
      {
         super();
         var_1618 = param1;
         var_984 = param2;
         _objId = param3;
         var_1244 = param4;
         _category = param5;
         var_1619 = param6;
         var_1622 = param7;
         var_1621 = param8;
         var_1620 = param9;
         var_1624 = param10;
      }
      
      public function get classId() : int
      {
         return var_1244;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1622;
      }
      
      public function get stripId() : int
      {
         return var_1618;
      }
      
      public function get stuffData() : String
      {
         return var_1619;
      }
      
      public function get songId() : int
      {
         return var_1623;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1617 = param1;
         var_1623 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1624;
      }
      
      public function get itemType() : String
      {
         return var_984;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get slotId() : String
      {
         return var_1617;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1620;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1621;
      }
   }
}
