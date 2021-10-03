package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.utils.IIterable;
   import com.sulake.core.window.utils.IIterator;
   import flash.geom.Rectangle;
   
   public class TabContextController extends WindowController implements ITabContextWindow, IIterable
   {
      
      private static const TAB_CONTEXT_CONTENT_TAG:String = "content";
      
      private static const TAB_CONTEXT_SELECTOR_TAG:String = "selector";
       
      
      private var var_1222:Boolean = false;
      
      protected var var_852:ITabSelectorWindow;
      
      private var var_725:Boolean = false;
      
      protected var var_1500:IWindowContainer;
      
      public function TabContextController(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:IWindow, param9:Function = null, param10:Array = null, param11:Array = null, param12:uint = 0)
      {
         var _loc14_:* = null;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
         var _loc13_:Array = new Array();
         groupChildrenWithTag(WindowController.INTERNAL_CHILD_TAG,_loc13_,true);
         for each(_loc14_ in _loc13_)
         {
            _loc14_.style = var_86;
            _loc14_.procedure = selectorEventProc;
         }
         var_725 = true;
      }
      
      public function get container() : IWindowContainer
      {
         if(var_1500 == null)
         {
            var_1500 = findChildByTag(TabContextController.TAB_CONTEXT_CONTENT_TAG) as IWindowContainer;
         }
         return var_1500;
      }
      
      public function addTabItemAt(param1:ITabButtonWindow, param2:uint) : ITabButtonWindow
      {
         return selector.addSelectableAt(param1,param2) as ITabButtonWindow;
      }
      
      public function get numTabItems() : uint
      {
         return var_852.numSelectables;
      }
      
      public function getTabItemIndex(param1:ITabButtonWindow) : uint
      {
         return selector.getSelectableIndex(param1);
      }
      
      public function getTabItemAt(param1:uint) : ITabButtonWindow
      {
         return selector.getSelectableAt(param1) as ITabButtonWindow;
      }
      
      public function get selector() : ITabSelectorWindow
      {
         if(var_852 == null)
         {
            var_852 = findChildByTag(TabContextController.TAB_CONTEXT_SELECTOR_TAG) as ITabSelectorWindow;
            if(var_852 != null)
            {
               var_852.procedure = selectorEventProc;
            }
         }
         return var_852;
      }
      
      public function removeTabItem(param1:ITabButtonWindow) : void
      {
         selector.removeSelectable(param1);
      }
      
      public function get iterator() : IIterator
      {
         return !!var_725 ? selector.iterator : null;
      }
      
      public function getTabItemByName(param1:String) : ITabButtonWindow
      {
         return selector.getSelectableByName(param1) as ITabButtonWindow;
      }
      
      public function addTabItem(param1:ITabButtonWindow) : ITabButtonWindow
      {
         return selector.addSelectable(param1) as ITabButtonWindow;
      }
      
      private function selectorEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowEvent.const_55)
         {
            notifyEventListeners(param1);
         }
      }
      
      public function getTabItemByID(param1:uint) : ITabButtonWindow
      {
         return selector.getSelectableByID(param1) as ITabButtonWindow;
      }
   }
}
