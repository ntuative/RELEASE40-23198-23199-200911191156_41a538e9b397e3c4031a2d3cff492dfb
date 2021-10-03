package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1764:Number;
      
      private var var_528:Number = 0;
      
      private var var_1763:Number;
      
      private var var_529:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1764 = param1;
         var_1763 = param2;
      }
      
      public function update() : void
      {
         var_529 += var_1763;
         var_528 += var_529;
         if(var_528 > 0)
         {
            var_528 = 0;
            var_529 = var_1764 * -1 * var_529;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_529 = param1;
         var_528 = 0;
      }
      
      public function get location() : Number
      {
         return var_528;
      }
   }
}
