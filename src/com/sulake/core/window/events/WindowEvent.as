package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_300:String = "WE_CHILD_RESIZED";
      
      public static const const_1173:String = "WE_CLOSE";
      
      public static const const_1182:String = "WE_DESTROY";
      
      public static const const_251:String = "WE_CHANGE";
      
      public static const const_1280:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1403:String = "WE_PARENT_RESIZE";
      
      public static const const_83:String = "WE_UPDATE";
      
      public static const const_1093:String = "WE_MAXIMIZE";
      
      public static const const_425:String = "WE_DESTROYED";
      
      public static const const_960:String = "WE_UNSELECT";
      
      public static const const_1092:String = "WE_MAXIMIZED";
      
      public static const const_1497:String = "WE_UNLOCKED";
      
      public static const const_388:String = "WE_CHILD_REMOVED";
      
      public static const const_207:String = "WE_OK";
      
      public static const const_46:String = "WE_RESIZED";
      
      public static const const_1199:String = "WE_ACTIVATE";
      
      public static const const_237:String = "WE_ENABLED";
      
      public static const const_434:String = "WE_CHILD_RELOCATED";
      
      public static const const_1265:String = "WE_CREATE";
      
      public static const const_627:String = "WE_SELECT";
      
      public static const const_158:String = "";
      
      public static const const_1382:String = "WE_LOCKED";
      
      public static const const_1370:String = "WE_PARENT_RELOCATE";
      
      public static const const_1521:String = "WE_CHILD_REMOVE";
      
      public static const const_1469:String = "WE_CHILD_RELOCATE";
      
      public static const const_1520:String = "WE_LOCK";
      
      public static const const_311:String = "WE_FOCUSED";
      
      public static const const_675:String = "WE_UNSELECTED";
      
      public static const const_779:String = "WE_DEACTIVATED";
      
      public static const const_1154:String = "WE_MINIMIZED";
      
      public static const const_1373:String = "WE_ARRANGED";
      
      public static const const_1378:String = "WE_UNLOCK";
      
      public static const const_1516:String = "WE_ATTACH";
      
      public static const const_1240:String = "WE_OPEN";
      
      public static const const_1180:String = "WE_RESTORE";
      
      public static const const_1418:String = "WE_PARENT_RELOCATED";
      
      public static const const_1185:String = "WE_RELOCATE";
      
      public static const const_1417:String = "WE_CHILD_RESIZE";
      
      public static const const_1399:String = "WE_ARRANGE";
      
      public static const const_1187:String = "WE_OPENED";
      
      public static const const_1267:String = "WE_CLOSED";
      
      public static const const_1507:String = "WE_DETACHED";
      
      public static const const_1482:String = "WE_UPDATED";
      
      public static const const_1224:String = "WE_UNFOCUSED";
      
      public static const const_370:String = "WE_RELOCATED";
      
      public static const const_1255:String = "WE_DEACTIVATE";
      
      public static const const_185:String = "WE_DISABLED";
      
      public static const const_556:String = "WE_CANCEL";
      
      public static const const_514:String = "WE_ENABLE";
      
      public static const const_1177:String = "WE_ACTIVATED";
      
      public static const const_1301:String = "WE_FOCUS";
      
      public static const const_1376:String = "WE_DETACH";
      
      public static const const_1165:String = "WE_RESTORED";
      
      public static const const_1113:String = "WE_UNFOCUS";
      
      public static const const_55:String = "WE_SELECTED";
      
      public static const const_1158:String = "WE_PARENT_RESIZED";
      
      public static const const_1146:String = "WE_CREATED";
      
      public static const const_1437:String = "WE_ATTACHED";
      
      public static const const_1308:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1503:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1281:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1503 = param3;
         var_1281 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1281;
      }
      
      public function get related() : IWindow
      {
         return var_1503;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1281 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
