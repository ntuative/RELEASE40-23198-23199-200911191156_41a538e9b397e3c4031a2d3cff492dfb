package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_304:Timer;
      
      protected var var_853:String;
      
      protected var var_854:uint;
      
      protected var var_1025:Point;
      
      protected var var_237:IToolTipWindow;
      
      protected var var_1026:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1025 = new Point();
         var_1026 = new Point(20,20);
         var_854 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_304 != null)
         {
            var_304.stop();
            var_304.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_304 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1025);
            if(var_237 != null && true)
            {
               var_237.x = param1 + var_1026.x;
               var_237.y = param2 + var_1026.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_304 != null)
         {
            var_304.reset();
         }
         if(_window && true)
         {
            if(var_237 == null || false)
            {
               var_237 = _window.context.create("undefined::ToolTip",var_853,WindowType.WINDOW_TYPE_TOOLTIP,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_237.x = _loc2_.x + var_1025.x + var_1026.x;
            var_237.y = _loc2_.y + var_1025.y + var_1026.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_853 = IInteractiveWindow(param1).toolTipCaption;
               var_854 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_853 = param1.caption;
               var_854 = 500;
            }
            _mouse.x = var_122.mouseX;
            _mouse.y = var_122.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1025);
            if(var_853 != null && var_853 != "")
            {
               if(var_304 == null)
               {
                  var_304 = new Timer(var_854,1);
                  var_304.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_304.reset();
               var_304.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_237 != null && true)
         {
            var_237.destroy();
            var_237 = null;
         }
      }
   }
}
