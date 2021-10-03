package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserInfoFrameCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_837:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var _userId:int;
      
      private var var_55:IFrameWindow;
      
      private var var_54:ModerationManager;
      
      public function UserInfoFrameCtrl(param1:ModerationManager, param2:int)
      {
         super();
         var_54 = param1;
         _userId = param2;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_55 != null)
         {
            var_55.destroy();
            var_55 = null;
         }
         if(var_837 != null)
         {
            var_837.dispose();
            var_837 = null;
         }
         var_54 = null;
      }
      
      public function getId() : String
      {
         return "" + _userId;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1217;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function show() : void
      {
         var_55 = IFrameWindow(var_54.getXmlWindow("user_info_frame"));
         var_55.caption = "User Info";
         var _loc1_:IWindow = var_55.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_837 = new UserInfoCtrl(var_55,var_54,true);
         var_837.load(var_55.content,_userId);
         var_55.visible = true;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_55;
      }
   }
}
