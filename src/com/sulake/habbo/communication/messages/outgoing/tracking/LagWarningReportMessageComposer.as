package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LagWarningReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2084:int;
      
      private var var_2085:int;
      
      public function LagWarningReportMessageComposer(param1:int, param2:int)
      {
         super();
         var_2084 = param1;
         var_2085 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_2084,var_2085];
      }
   }
}
