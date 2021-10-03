package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_656:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_656 = new ByteArray();
         var_656.writeShort(param1);
         var_656.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_656.position = 0;
         if(false)
         {
            _loc1_ = var_656.readShort();
            var_656.position = 0;
         }
         return _loc1_;
      }
   }
}
