package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_921:int = 0;
      
      private var var_1166:int = 0;
      
      private var var_1744:String = "";
      
      private var var_922:int = 0;
      
      private var var_1872:String = "";
      
      private var var_1870:int = 0;
      
      private var var_1355:String = "";
      
      private var var_1871:int = 0;
      
      private var var_1869:int = 0;
      
      private var var_1745:String = "";
      
      private var var_1868:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1871 = param1;
         var_1745 = param2;
         var_1355 = param3;
         var_1744 = param4;
         var_1872 = param5;
         if(param6)
         {
            var_1166 = 1;
         }
         else
         {
            var_1166 = 0;
         }
         var_1870 = param7;
         var_1869 = param8;
         var_922 = param9;
         var_1868 = param10;
         var_921 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1871,var_1745,var_1355,var_1744,var_1872,var_1166,var_1870,var_1869,var_922,var_1868,var_921];
      }
      
      public function dispose() : void
      {
      }
   }
}
