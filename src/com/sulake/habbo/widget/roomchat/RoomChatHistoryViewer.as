package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryViewer implements IDisposable
   {
      
      private static const const_1046:int = 18;
      
      private static const const_477:int = 20;
      
      public static const const_964:int = 3;
       
      
      private var var_1420:Boolean = false;
      
      private var _isDisposed:Boolean = false;
      
      private var var_1182:Boolean = false;
      
      private var var_1102:Boolean = false;
      
      private var var_328:Number = 1;
      
      private var _widget:RoomChatWidget;
      
      private var var_290:Boolean = false;
      
      private var var_225:Number = -1;
      
      private var var_156:RoomChatHistoryPulldown;
      
      private var var_49:IScrollbarWindow;
      
      public function RoomChatHistoryViewer(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _isDisposed = false;
         _widget = param1;
         var_156 = new RoomChatHistoryPulldown(param1,param2,param3,param4);
         var_156.state = RoomChatHistoryPulldown.const_205;
         var _loc5_:IItemListWindow = param3.getChildByName("chat_contentlist") as IItemListWindow;
         if(_loc5_ == null)
         {
            return;
         }
         param3.removeChild(_loc5_);
         param3.addChild(_loc5_);
         var_49 = param2.createWindow("chatscroller","",HabboWindowType.const_798,HabboWindowStyle.const_39,0 | 0,new Rectangle(param3.rectangle.right - const_477,param3.y,const_477,param3.height - 0),null,0) as IScrollbarWindow;
         param3.addChild(var_49);
         var_49.visible = false;
         var_49.scrollable = _loc5_ as IScrollableWindow;
      }
      
      public function get scrollbarWidth() : Number
      {
         return !!var_290 ? Number(const_477) : Number(0);
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         cancelDrag();
         if(_widget != null)
         {
            _widget.mouseUp();
         }
      }
      
      private function processDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         if(var_225 > 0 && param2)
         {
            if(var_1182)
            {
               if(Math.abs(param1 - var_225) <= const_964)
               {
                  return;
               }
               var_1182 = false;
            }
            if(!var_290)
            {
               _widget.resizeContainerToLowestItem();
               showHistoryViewer();
               moveHistoryScroll();
            }
            if(var_290)
            {
               moveHistoryScroll();
               _loc4_ = var_49.scrollable.scrollableRegion.height / var_49.scrollable.visibleRegion.height;
               _loc5_ = (param1 - var_225) / 0;
               _loc3_ = var_328 - _loc5_ / _loc4_;
               _loc3_ = Math.max(0,_loc3_);
               _loc3_ = Math.min(1,_loc3_);
               _loc6_ = param1 - var_225;
               _loc7_ = true;
               _loc8_ = true;
               if(var_49.scrollV < 1 - const_1046 / var_49.scrollable.scrollableRegion.height)
               {
                  _loc8_ = false;
               }
               if(_loc8_ || var_1420)
               {
                  _widget.stretchAreaBottomBy(_loc6_);
                  _loc7_ = false;
                  var_49.scrollV = 1;
               }
               if(_loc7_)
               {
                  var_328 = _loc3_;
               }
               var_225 = param1;
            }
         }
         else
         {
            var_225 = -1;
         }
      }
      
      public function beginDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_225 = param1;
         var_1420 = param2;
         var_1182 = true;
         if(var_49 != null)
         {
            var_328 = var_49.scrollV;
         }
         if(var_49 != null)
         {
            _loc3_ = var_49.context.getDesktopWindow().getDisplayObject();
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.stage;
               if(_loc4_ != null)
               {
                  _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  _loc4_.addEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
               }
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         if(var_156 != null)
         {
            var_156.update(param1);
         }
         moveHistoryScroll();
      }
      
      public function get active() : Boolean
      {
         return var_290;
      }
      
      public function showHistoryViewer() : void
      {
         if(!var_290 && !var_1102)
         {
            var_290 = true;
            setHistoryViewerScrollbar(true);
            var_156.state = RoomChatHistoryPulldown.const_322;
            if(_widget != null)
            {
               _widget.reAlignItemsToHistoryContent();
               _widget.disableDragTooltips();
            }
         }
      }
      
      private function setHistoryViewerScrollbar(param1:Boolean) : void
      {
         if(var_49 != null)
         {
            var_49.visible = param1;
            if(param1)
            {
               var_49.scrollV = 1;
               var_328 = 1;
            }
            else
            {
               var_290 = false;
               var_225 = -1;
            }
         }
      }
      
      public function toggleHistoryViewer() : void
      {
         if(var_290)
         {
            hideHistoryViewer();
         }
         else
         {
            showHistoryViewer();
         }
      }
      
      public function cancelDrag() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var_225 = -1;
         if(var_49 != null)
         {
            _loc1_ = var_49.context.getDesktopWindow().getDisplayObject();
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.stage;
               if(_loc2_ != null)
               {
                  _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  _loc2_.removeEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
               }
            }
         }
      }
      
      public function dispose() : void
      {
         hideHistoryViewer();
         if(var_49 != null)
         {
            var_49.dispose();
            var_49 = null;
         }
         if(var_156 != null)
         {
            var_156.dispose();
            var_156 = null;
         }
         _isDisposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(var_156 == null)
         {
            return;
         }
         var_156.state = param1 == true ? 0 : int(RoomChatHistoryPulldown.const_205);
      }
      
      public function containerResized(param1:Rectangle, param2:Boolean = false) : void
      {
         if(var_49 != null)
         {
            var_49.x = param1.x + param1.width - 0;
            var_49.y = param1.y;
            var_49.height = param1.height - 0;
            if(param2)
            {
               var_49.scrollV = var_328;
            }
         }
         if(var_156 != null)
         {
            var_156.containerResized(param1);
         }
      }
      
      private function moveHistoryScroll() : void
      {
         if(!var_290)
         {
            return;
         }
         if(var_225 == -1)
         {
            return;
         }
         if(var_1420)
         {
            return;
         }
         var _loc1_:Number = var_328 - 0;
         if(_loc1_ == 0)
         {
            return;
         }
         if(Math.abs(_loc1_) < 0.01)
         {
            var_49.scrollV = var_328;
         }
         else
         {
            var_49.scrollV += _loc1_ / 2;
         }
      }
      
      public function get pulldownBarHeight() : Number
      {
         return RoomChatHistoryPulldown.const_70;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         var_1102 = param1;
      }
      
      public function get visible() : Boolean
      {
         if(var_156 == null)
         {
            return false;
         }
         return true || true;
      }
      
      public function hideHistoryViewer() : void
      {
         var_328 = 1;
         cancelDrag();
         var_290 = false;
         setHistoryViewerScrollbar(false);
         var_156.state = RoomChatHistoryPulldown.const_205;
         if(_widget != null)
         {
            _widget.resetArea();
            _widget.enableDragTooltips();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         processDrag(param1.stageY,param1.buttonDown);
      }
   }
}
