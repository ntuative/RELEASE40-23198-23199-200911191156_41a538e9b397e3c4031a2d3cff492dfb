package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class WardrobeView implements IAvatarEditorCategoryView
   {
       
      
      private var var_1293:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _window:IWindowContainer;
      
      private var var_579:IItemListWindow;
      
      private var var_496:IItemListWindow;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_695:IItemListWindow;
      
      private var var_87:WardrobeModel;
      
      private var var_694:int = 0;
      
      private var var_495:Array;
      
      public function WardrobeView(param1:WardrobeModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         var_495 = [];
         super();
         var_87 = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_wardrobe_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         var_579 = _window.findChildByName("mylooks") as IItemListWindow;
         var_496 = _window.findChildByName("hotlooks") as IItemListWindow;
         var_695 = _window.findChildByName("selector") as IItemListWindow;
         var_1293 = _window.findChildByName("habboClubNotificationContainer") as IWindowContainer;
         _window.findChildByName("hotlooksMore").alphaTreshold = 0;
         _window.findChildByName("habboClubLink").alphaTreshold = 0;
         _window.visible = false;
         _window.procedure = windowEventProc;
         initSelector();
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "hotlooksMore":
                  Logger.log("More hot looks");
                  ++var_694;
                  updateHotLooks();
                  break;
               case "habboClubLink":
                  Logger.log("Open Catalog Habbo Club");
                  var_87.controller.catalog.openCatalogPage(CatalogPageName.const_294,true);
            }
         }
         else if(param1.type == WindowEvent.const_55)
         {
         }
      }
      
      private function myLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            var_87.selectMyLook(var_579.getListItemIndex(param2.parent));
         }
      }
      
      private function initSelector() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_495)
         {
            var_695.removeListItem(_loc1_.window);
            _loc1_.dispose();
         }
         var_495 = [];
         while(true)
         {
            _loc1_ = new Selector(var_87.controller);
            var_695.addListItem(_loc1_.window);
            _loc1_.window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,myLooksSelectorEventProc);
            var_495.push(_loc1_);
         }
      }
      
      public function updateHotLooks() : void
      {
         var _loc3_:* = null;
         while(false)
         {
            var_496.removeListItemAt(0);
         }
         var _loc1_:int = 0;
         if(var_87.hotLooks.length < 8)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = var_694 * 8;
         }
         if(_loc1_ > var_87.hotLooks.length)
         {
            var_694 = 0;
            _loc1_ = 0;
         }
         var _loc2_:int = 0;
         for each(_loc3_ in var_87.hotLooks)
         {
            if(_loc2_ >= _loc1_ && true)
            {
               var_496.addListItem(_loc3_.view.window);
               _loc3_.view.window.procedure = hotLooksEventProc;
            }
            _loc2_++;
         }
      }
      
      public function updateMyLooks(param1:int) : void
      {
         var _loc2_:* = null;
         if(!var_87.controller.isHabboClubMember)
         {
            var_1293.visible = true;
            _window.findChildByName("myLooksContainer").visible = false;
            _window.findChildByName("myLooksChooser").visible = false;
         }
         else
         {
            var_1293.visible = false;
            _window.findChildByName("myLooksContainer").visible = true;
            _window.findChildByName("myLooksChooser").visible = true;
            while(false)
            {
               var_579.removeListItemAt(0);
            }
            for each(_loc2_ in var_87.myLooks)
            {
               var_579.addListItem(_loc2_.view.window);
               _loc2_.view.window.procedure = myLooksEventProc;
            }
         }
      }
      
      private function myLooksSelectorEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_695.getListItemIndex(param2);
            var_87.storeNewMyLook(_loc3_);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_495)
         {
            var_695.removeListItem(_loc1_.window);
            _loc1_.dispose();
         }
         var_495 = [];
         while(false)
         {
            var_579.removeListItemAt(0);
         }
         while(false)
         {
            var_496.removeListItemAt(0);
         }
         _window.dispose();
         _window = null;
      }
      
      private function hotLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_694 * 8 + var_496.getListItemIndex(param2.parent);
            var_87.selectHotLook(_loc3_);
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
   }
}
