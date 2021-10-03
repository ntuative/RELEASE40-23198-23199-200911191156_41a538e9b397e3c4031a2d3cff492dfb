package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetApproveNameResultEvent extends Event
   {
       
      
      private var var_612:int;
      
      public function CatalogWidgetApproveNameResultEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(WidgetEvent.const_938,param2,param3);
         var_612 = param1;
      }
      
      public function get result() : int
      {
         return var_612;
      }
   }
}
