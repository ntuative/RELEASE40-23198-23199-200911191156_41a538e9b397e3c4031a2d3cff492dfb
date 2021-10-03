package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1476:int = 9;
      
      public static const const_1533:int = 4;
      
      public static const const_1458:int = 1;
      
      public static const const_1325:int = 10;
      
      public static const const_1398:int = 2;
      
      public static const const_1166:int = 7;
      
      public static const const_1313:int = 11;
      
      public static const const_1430:int = 3;
      
      public static const const_1160:int = 8;
      
      public static const const_1111:int = 5;
      
      public static const const_1526:int = 6;
      
      public static const const_1295:int = 12;
       
      
      private var var_1811:String;
      
      private var _roomId:int;
      
      private var var_1084:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1811;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1084 = param1.readInteger();
         var_1811 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1084;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
