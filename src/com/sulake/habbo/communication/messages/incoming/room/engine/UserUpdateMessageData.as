package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      private var var_224:int = 0;
      
      private var var_1737:int = 0;
      
      private var var_1740:Number = 0;
      
      private var var_1739:Number = 0;
      
      private var var_1735:Number = 0;
      
      private var var_1736:Number = 0;
      
      private var var_1738:Boolean = false;
      
      private var var_90:Number = 0;
      
      private var _id:int = 0;
      
      private var var_198:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_198 = [];
         super();
         _id = param1;
         var_90 = param2;
         _y = param3;
         var_89 = param4;
         var_1736 = param5;
         var_224 = param6;
         var_1737 = param7;
         var_1740 = param8;
         var_1739 = param9;
         var_1735 = param10;
         var_1738 = param11;
         var_198 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function get localZ() : Number
      {
         return var_1736;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1738;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1737;
      }
      
      public function get targetX() : Number
      {
         return var_1740;
      }
      
      public function get targetY() : Number
      {
         return var_1739;
      }
      
      public function get targetZ() : Number
      {
         return var_1735;
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      public function get actions() : Array
      {
         return var_198.slice();
      }
   }
}
