package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_440:ToolbarIconGroup;
      
      private var var_919:Boolean = false;
      
      private var var_1731:String;
      
      private var var_792:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_920:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var _state:String = "-1";
      
      private var var_100:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_741:String;
      
      private var var_1732:int;
      
      private var var_618:Timer;
      
      private var var_1352:Array;
      
      private var var_917:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2167:Array;
      
      private var var_321:ToolbarBarMenuAnimator;
      
      private var var_367:ToolbarIconAnimator;
      
      private var var_523:Array;
      
      private var var_743:Array;
      
      private var var_742:String = "-1";
      
      private var var_2226:Boolean = true;
      
      private var var_918:Array;
      
      private var var_1117:Timer;
      
      private var var_1730:int;
      
      private var var_90:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_523 = new Array();
         var_743 = new Array();
         var_2167 = new Array();
         var_917 = new ToolbarIconBouncer(0.8,1);
         super();
         var_440 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_741 = param4;
         _events = param5;
         var_321 = param6;
         var_1117 = new Timer(40,40);
         var_1117.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_100 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_439,HabboWindowStyle.const_39,HabboWindowParam.const_33,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_100.background = true;
         var_100.alphaTreshold = 0;
         var_100.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_39,HabboWindowParam.const_39,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_100.addChild(_window);
         _window.addEventListener(WindowEvent.const_46,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1352[var_918.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1730;
      }
      
      public function get iconId() : String
      {
         return var_741;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_792 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         _state = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_100 == null || _window == null)
         {
            return;
         }
         var_100.width = _window.width;
         var_100.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_90 = (0 - 0) / 2;
            _y = var_792 + (0 - 0) / 2;
         }
         else
         {
            var_90 = var_792 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_100.x = var_90;
         var_100.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_100 != null)
         {
            var_100.dispose();
            var_100 = null;
         }
         var_523 = null;
         var_743 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_321 = null;
         var_367 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_523.indexOf(param1) < 0)
         {
            var_523.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_743.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_919)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_61);
                  _loc4_.iconId = var_741;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_920;
                  }
               }
               break;
            case WindowMouseEvent.const_28:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_742;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_523.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_743[var_523.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_919 = param1;
         if(var_100 != null)
         {
            var_100.visible = var_919;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_100 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_100.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_100.toolTipCaption = "${toolbar.icon.tooltip." + var_1731.toLowerCase() + "}";
         }
         var_100.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_321 != null)
         {
            var_321.animateWindowIn(this,param1,param2,var_741,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_367 != null && _window != null)
         {
            var_367.update(_window);
            if(var_367.hasNextState())
            {
               state = var_367.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1352 = new Array();
         var_918 = new Array();
         var_1731 = param1.@id;
         var_1730 = int(param1.@window_offset_from_icon);
         var_1732 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_920 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_742 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_918.push(_loc5_.id);
               var_1352.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_920 == "-1")
                  {
                     var_920 = _loc5_.id;
                  }
                  if(var_742 == "-1")
                  {
                     var_742 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         _state = var_742;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_321 != null)
         {
            var_321.hideWindow(param1,param2,var_741,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_321 != null)
         {
            var_321.positionWindow(this,param1,param2,var_741,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_321 != null)
         {
            var_321.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_919;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_917 != null && _window != null)
         {
            var_917.update();
            _window.y = var_917.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_618 != null)
         {
            var_618.stop();
            var_618 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_919)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_367 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_90,_y,_bitmapData);
            if(false)
            {
               var_618 = new Timer(_loc1_.timer);
               var_618.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_618.start();
            }
            if(_loc1_.bounce)
            {
               var_917.reset(-7);
               var_1117.reset();
               var_1117.start();
            }
         }
         else
         {
            var_367 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1732 + var_440.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(_state);
      }
      
      public function get window() : IWindow
      {
         return var_100;
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_743[var_523.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_440;
      }
   }
}
