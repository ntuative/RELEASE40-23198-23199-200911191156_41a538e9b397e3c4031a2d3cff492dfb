package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_168:String;
      
      private var var_394:int;
      
      private var var_204:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_168 = param1;
         var_204 = param2;
         var_394 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_204.text = var_168.substring(0,param1) + "...";
         return var_204.textHeight > var_394;
      }
   }
}
