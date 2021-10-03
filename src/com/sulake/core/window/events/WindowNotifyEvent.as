package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1220:String = "WN_CREATED";
      
      public static const const_888:String = "WN_DISABLE";
      
      public static const const_902:String = "WN_DEACTIVATED";
      
      public static const const_946:String = "WN_OPENED";
      
      public static const const_808:String = "WN_CLOSED";
      
      public static const const_913:String = "WN_DESTROY";
      
      public static const const_1509:String = "WN_ARRANGED";
      
      public static const const_421:String = "WN_PARENT_RESIZED";
      
      public static const const_966:String = "WN_ENABLE";
      
      public static const const_801:String = "WN_RELOCATE";
      
      public static const const_903:String = "WN_FOCUS";
      
      public static const const_765:String = "WN_PARENT_RELOCATED";
      
      public static const const_413:String = "WN_PARAM_UPDATED";
      
      public static const const_597:String = "WN_PARENT_ACTIVATED";
      
      public static const const_257:String = "WN_RESIZED";
      
      public static const const_864:String = "WN_CLOSE";
      
      public static const const_875:String = "WN_PARENT_REMOVED";
      
      public static const const_259:String = "WN_CHILD_RELOCATED";
      
      public static const const_489:String = "WN_ENABLED";
      
      public static const const_267:String = "WN_CHILD_RESIZED";
      
      public static const const_909:String = "WN_MINIMIZED";
      
      public static const const_590:String = "WN_DISABLED";
      
      public static const const_208:String = "WN_CHILD_ACTIVATED";
      
      public static const const_382:String = "WN_STATE_UPDATED";
      
      public static const const_652:String = "WN_UNSELECTED";
      
      public static const const_419:String = "WN_STYLE_UPDATED";
      
      public static const const_1512:String = "WN_UPDATE";
      
      public static const const_377:String = "WN_PARENT_ADDED";
      
      public static const const_536:String = "WN_RESIZE";
      
      public static const const_491:String = "WN_CHILD_REMOVED";
      
      public static const const_1515:String = "";
      
      public static const const_889:String = "WN_RESTORED";
      
      public static const const_292:String = "WN_SELECTED";
      
      public static const const_873:String = "WN_MINIMIZE";
      
      public static const const_784:String = "WN_FOCUSED";
      
      public static const const_1305:String = "WN_LOCK";
      
      public static const const_313:String = "WN_CHILD_ADDED";
      
      public static const const_914:String = "WN_UNFOCUSED";
      
      public static const const_453:String = "WN_RELOCATED";
      
      public static const const_836:String = "WN_DEACTIVATE";
      
      public static const const_1208:String = "WN_CRETAE";
      
      public static const const_857:String = "WN_RESTORE";
      
      public static const const_308:String = "WN_ACTVATED";
      
      public static const const_1141:String = "WN_LOCKED";
      
      public static const const_430:String = "WN_SELECT";
      
      public static const const_923:String = "WN_MAXIMIZE";
      
      public static const const_908:String = "WN_OPEN";
      
      public static const const_665:String = "WN_UNSELECT";
      
      public static const const_1535:String = "WN_ARRANGE";
      
      public static const const_1156:String = "WN_UNLOCKED";
      
      public static const const_1470:String = "WN_UPDATED";
      
      public static const const_879:String = "WN_ACTIVATE";
      
      public static const const_1284:String = "WN_UNLOCK";
      
      public static const const_956:String = "WN_MAXIMIZED";
      
      public static const const_862:String = "WN_DESTROYED";
      
      public static const const_840:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1503,cancelable);
      }
   }
}
