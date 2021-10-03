package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1514:Array;
      
      private var var_1512:String;
      
      private var var_1513:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1512 = param1;
         var_1514 = param2;
         var_1513 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1512;
      }
      
      public function get yieldList() : Array
      {
         return var_1514;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1513;
      }
   }
}
