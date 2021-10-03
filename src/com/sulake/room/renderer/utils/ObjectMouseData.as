package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1902:String = "";
      
      private var var_161:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1902 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_161 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1902;
      }
      
      public function get objectId() : String
      {
         return var_161;
      }
   }
}
