package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2055:XML;
      
      private var var_1479:ITextWindow;
      
      private var var_1478:ITextWindow;
      
      private var var_2053:XML;
      
      private var var_831:IWindowContainer;
      
      private var var_2191:ITextWindow;
      
      private var var_2052:String = "";
      
      private var var_2240:IButtonWindow;
      
      private var var_2054:XML;
      
      private var var_1480:ITextWindow;
      
      private var var_2051:XML;
      
      private var var_832:IButtonWindow;
      
      private var var_164:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_287:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2053) as IWindowContainer;
               break;
            case Offer.const_428:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2051) as IWindowContainer;
               break;
            case Offer.const_343:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2055) as IWindowContainer;
               break;
            case Offer.const_548:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2054) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_831 != null)
            {
               _window.removeChild(var_831);
               var_831.dispose();
            }
            var_831 = _loc2_;
            _window.addChild(_loc2_);
            var_831.x = 0;
            var_831.y = 0;
         }
         var_1480 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1478 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1479 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2191 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_832 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_832 != null)
         {
            var_832.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_832.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_164 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_164,page,var_2052);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2053 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2051 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2055 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2054 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_791,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2052 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_164 = param1.offer;
         attachStub(var_164.priceType);
         if(var_1480 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_164.priceInCredits));
            var_1480.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1478 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_164.priceInPixels));
            var_1478.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1479 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_164.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_164.priceInPixels));
            var_1479.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_832 != null)
         {
            var_832.enable();
         }
      }
   }
}
