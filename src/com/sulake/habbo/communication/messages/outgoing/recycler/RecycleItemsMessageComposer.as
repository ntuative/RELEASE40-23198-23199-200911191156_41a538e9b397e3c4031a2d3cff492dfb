package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_784:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_784 = new Array();
         var_784.push(param1.length);
         var_784 = var_784.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_784;
      }
   }
}
