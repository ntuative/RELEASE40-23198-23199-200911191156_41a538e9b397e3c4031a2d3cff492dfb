package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2091:Class;
      
      private var var_2092:Class;
      
      private var var_2090:String;
      
      private var var_1263:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2090 = param1;
         var_2092 = param2;
         var_2091 = param3;
         if(rest == null)
         {
            var_1263 = new Array();
         }
         else
         {
            var_1263 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2091;
      }
      
      public function get assetClass() : Class
      {
         return var_2092;
      }
      
      public function get mimeType() : String
      {
         return var_2090;
      }
      
      public function get fileTypes() : Array
      {
         return var_1263;
      }
   }
}
