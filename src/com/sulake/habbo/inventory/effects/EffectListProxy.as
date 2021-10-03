package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_455:int;
      
      private var var_87:EffectsModel;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         var_87 = param1;
         var_455 = param2;
      }
      
      public function getDrawableList() : Array
      {
         return var_87.getEffects(var_455);
      }
      
      public function dispose() : void
      {
         var_87 = null;
      }
   }
}
