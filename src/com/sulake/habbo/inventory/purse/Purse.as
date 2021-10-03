package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1566:Boolean = false;
      
      private var var_1564:int = 0;
      
      private var var_1563:int = 0;
      
      private var var_1567:int = 0;
      
      private var var_1565:int = 0;
      
      private var var_1562:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1565 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1564;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1566;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1566 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1564 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1563 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1565;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1567 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1563;
      }
      
      public function get pixelBalance() : int
      {
         return var_1567;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1562 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1562;
      }
   }
}
