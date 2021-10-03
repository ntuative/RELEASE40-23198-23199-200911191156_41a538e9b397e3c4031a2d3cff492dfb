package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_291:String = "e";
      
      public static const const_136:String = "i";
      
      public static const const_166:String = "s";
       
      
      private var var_908:String;
      
      private var var_1114:String;
      
      private var var_1111:int;
      
      private var var_1576:int;
      
      private var var_909:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1114 = param1.readString();
         var_1576 = param1.readInteger();
         var_908 = param1.readString();
         var_909 = param1.readInteger();
         var_1111 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_909;
      }
      
      public function get productType() : String
      {
         return var_1114;
      }
      
      public function get expiration() : int
      {
         return var_1111;
      }
      
      public function get furniClassId() : int
      {
         return var_1576;
      }
      
      public function get extraParam() : String
      {
         return var_908;
      }
   }
}
