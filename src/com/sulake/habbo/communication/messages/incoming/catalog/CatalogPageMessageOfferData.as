package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_731:Array;
      
      private var var_693:int;
      
      private var var_1038:String;
      
      private var var_1037:int;
      
      private var var_692:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         var_1037 = param1.readInteger();
         var_1038 = param1.readString();
         var_693 = param1.readInteger();
         var_692 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_731 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_731.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_731;
      }
      
      public function get priceInCredits() : int
      {
         return var_693;
      }
      
      public function get localizationId() : String
      {
         return var_1038;
      }
      
      public function get offerId() : int
      {
         return var_1037;
      }
      
      public function get priceInPixels() : int
      {
         return var_692;
      }
   }
}
