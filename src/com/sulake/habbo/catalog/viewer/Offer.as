package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_874:String = "price_type_none";
      
      public static const const_456:String = "pricing_model_multi";
      
      public static const const_287:String = "price_type_credits";
      
      public static const const_343:String = "price_type_credits_and_pixels";
      
      public static const const_441:String = "pricing_model_bundle";
      
      public static const const_445:String = "pricing_model_single";
      
      public static const const_548:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1319:String = "pricing_model_unknown";
      
      public static const const_428:String = "price_type_pixels";
       
      
      private var var_693:int;
      
      private var var_1037:int;
      
      private var var_692:int;
      
      private var var_353:String;
      
      private var var_494:String;
      
      private var var_1515:int;
      
      private var var_615:ICatalogPage;
      
      private var var_1038:String;
      
      private var var_352:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         var_1037 = param1.offerId;
         var_1038 = param1.localizationId;
         var_693 = param1.priceInCredits;
         var_692 = param1.priceInPixels;
         var_615 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_353;
      }
      
      public function get page() : ICatalogPage
      {
         return var_615;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1515 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_352;
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
      
      public function dispose() : void
      {
         var_1037 = 0;
         var_1038 = "";
         var_693 = 0;
         var_692 = 0;
         var_615 = null;
         if(var_352 != null)
         {
            var_352.dispose();
            var_352 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_494;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1515;
      }
      
      public function get priceInCredits() : int
      {
         return var_693;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_353 = const_445;
            }
            else
            {
               var_353 = const_456;
            }
         }
         else if(param1.length > 1)
         {
            var_353 = const_441;
         }
         else
         {
            var_353 = const_1319;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_353)
         {
            case const_445:
               var_352 = new SingleProductContainer(this,param1);
               break;
            case const_456:
               var_352 = new MultiProductContainer(this,param1);
               break;
            case const_441:
               var_352 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_353);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_693 > 0 && var_692 > 0)
         {
            var_494 = const_343;
         }
         else if(var_693 > 0)
         {
            var_494 = const_287;
         }
         else if(var_692 > 0)
         {
            var_494 = const_428;
         }
         else
         {
            var_494 = const_874;
         }
      }
   }
}
