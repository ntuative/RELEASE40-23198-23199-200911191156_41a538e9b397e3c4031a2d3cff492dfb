package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1618:int;
      
      private var var_1621:Boolean;
      
      private var var_1623:int;
      
      private var var_1619:String;
      
      private var var_1706:Boolean = false;
      
      private var var_1624:int;
      
      private var var_408:int;
      
      private var var_984:String;
      
      private var var_1617:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1244:int;
      
      private var var_1620:Boolean;
      
      private var var_1705:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1618 = param1;
         var_984 = param2;
         _objId = param3;
         var_1244 = param4;
         var_1619 = param5;
         var_1621 = param6;
         var_1620 = param7;
         var_1624 = param8;
         var_1617 = param9;
         var_1623 = param10;
         var_408 = -1;
      }
      
      public function get songId() : int
      {
         return var_1623;
      }
      
      public function get iconCallbackId() : int
      {
         return var_408;
      }
      
      public function get expiryTime() : int
      {
         return var_1624;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1705 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1706 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_408 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1620;
      }
      
      public function get slotId() : String
      {
         return var_1617;
      }
      
      public function get classId() : int
      {
         return var_1244;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1621;
      }
      
      public function get stuffData() : String
      {
         return var_1619;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1618;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1706;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1705;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_984;
      }
   }
}
