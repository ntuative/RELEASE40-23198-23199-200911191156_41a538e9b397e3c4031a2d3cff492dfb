package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_346:int = 0;
      
      public static const const_120:int = 2;
      
      public static const const_161:int = 1;
      
      public static const const_502:Array = ["open","closed","password"];
       
      
      private var var_2049:int;
      
      private var var_2050:int;
      
      private var var_1553:Array;
      
      private var var_1551:Boolean;
      
      private var var_1124:String;
      
      private var var_1550:Boolean;
      
      private var var_1554:int;
      
      private var var_1552:int;
      
      private var var_1176:int;
      
      private var var_1555:Boolean;
      
      private var _roomId:int;
      
      private var var_1556:Boolean;
      
      private var _name:String;
      
      private var var_572:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1554;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1554 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_572;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1551;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1556;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2049 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1553 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1556 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_572 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2050;
      }
      
      public function get categoryId() : int
      {
         return var_1176;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1551 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1555 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1550 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_2049;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1553;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1555;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1550;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1552 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2050 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1552;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1176 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1124 = param1;
      }
      
      public function get description() : String
      {
         return var_1124;
      }
   }
}
