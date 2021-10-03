package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1635:Number = 0;
      
      private var var_1633:Number = 0;
      
      private var var_1632:Number = 0;
      
      private var var_1634:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1633 = param1;
         var_1632 = param2;
         var_1635 = param3;
         var_1634 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1633;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1635;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1632;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1634;
      }
   }
}
