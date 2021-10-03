package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import flash.display.BitmapData;
   
   public class Product extends ProductGridItem implements IProduct, IGetImageListener
   {
       
      
      private var var_1112:IProductData;
      
      private var var_1111:int;
      
      private var var_1114:String;
      
      private var var_1113:int;
      
      private var var_908:String;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_909:int;
      
      public function Product(param1:CatalogPageMessageProductData, param2:IProductData, param3:IFurnitureData)
      {
         super();
         var_1114 = param1.productType;
         var_1113 = param1.furniClassId;
         var_908 = param1.extraParam;
         var_909 = param1.productCount;
         var_1111 = param1.expiration;
         var_1112 = param2;
         _furnitureData = param3;
      }
      
      public function get furnitureData() : IFurnitureData
      {
         return _furnitureData;
      }
      
      public function get productClassId() : int
      {
         return var_1113;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         Logger.log("[Product] Bundle Icon Image Ready!" + param1);
         setIconImage(param2);
      }
      
      public function get productType() : String
      {
         return var_1114;
      }
      
      override public function set view(param1:IWindowContainer) : void
      {
         super.view = param1;
         if(var_909 > 1)
         {
            _view.findChildByName("multiContainer").visible = true;
            ITextWindow(_view.findChildByName("multiCounter")).text = "x" + productCount;
         }
      }
      
      public function get extraParam() : String
      {
         return var_908;
      }
      
      public function get productCount() : int
      {
         return var_909;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_1114 = "";
         var_1113 = 0;
         var_908 = "";
         var_909 = 0;
         var_1111 = 0;
         var_1112 = null;
      }
      
      public function initIcon(param1:IProductContainer, param2:IGetImageListener = null) : BitmapData
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc4_:IRoomEngine = (param1 as ProductContainer).offer.page.viewer.roomEngine;
         var _loc5_:IHabboCatalog = (param1 as ProductContainer).offer.page.viewer.catalog;
         switch(productType)
         {
            case ProductTypeEnum.const_166:
               _loc6_ = _loc4_.getFurnitureIcon(productClassId,param2);
               break;
            case ProductTypeEnum.const_136:
               _loc6_ = _loc4_.getWallItemIcon(productClassId,param2,var_908);
               break;
            case ProductTypeEnum.const_291:
               _loc3_ = _loc5_.getPixelEffectIcon(productClassId);
               break;
            case ProductTypeEnum.const_547:
               _loc3_ = _loc5_.getSubscriptionProductIcon(productClassId);
               break;
            default:
               Logger.log("[Product] Can not yet handle this type of product: " + productType);
         }
         if(_loc6_ != null)
         {
            _loc3_ = _loc6_.data;
            if(param2 == this)
            {
               this.setIconImage(_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function get expiration() : int
      {
         return var_1111;
      }
      
      public function get productData() : IProductData
      {
         return var_1112;
      }
   }
}
