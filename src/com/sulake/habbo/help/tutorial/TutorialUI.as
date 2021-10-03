package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI
   {
      
      public static const const_248:String = "TUI_NAME_VIEW";
      
      public static const const_87:String = "TUI_MAIN_VIEW";
      
      public static const const_401:String = "TUI_CLOTHES_VIEW";
      
      public static const const_365:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_915:Boolean = false;
      
      private var var_914:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_1397:int = 0;
      
      private var var_54:HabboHelp;
      
      private var var_913:Boolean = false;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1396:int = 0;
      
      private var var_40:ITutorialUIView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         var_54 = param1;
         var_54.events.addEventListener(HabboHelpTutorialEvent.const_686,onTaskDoneEvent);
      }
      
      public function prepareForTutorial() : void
      {
         if(var_54 == null || true)
         {
            return;
         }
         var_54.hideUI();
         var_54.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_91));
      }
      
      public function get help() : HabboHelp
      {
         return var_54;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_915;
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var_913 = param1;
         var_914 = param2;
         var_915 = param3;
         if(var_40 == null || var_40.id == const_87)
         {
            prepareForTutorial();
            showView(const_87);
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return var_54.assets;
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            disposeWindow();
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         var_914 = true;
         if(var_40 != null && (var_40.id == const_248 || var_40.id == const_87))
         {
            showView(const_87);
         }
         var_54.localization.registerParameter("help.tutorial.name.changed","name",name);
         var_54.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(hasTasksDone)
         {
            dispose();
            return;
         }
         var _loc3_:Boolean = false;
         if(_window == null)
         {
            _window = buildXmlWindow("tutorial_frame") as IWindowContainer;
            if(_window == null)
            {
               return;
            }
            _window.procedure = windowProcedure;
            _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            var_1396 = 0 - _loc2_.width;
            var_1397 = _window.height;
            _loc3_ = true;
         }
         _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(var_40 != null)
         {
            var_40.dispose();
         }
         switch(param1)
         {
            case const_87:
               var_40 = new TutorialMainView(_loc2_,this);
               break;
            case const_248:
               var_40 = new TutorialNameChangeView(_loc2_,this);
               break;
            case const_401:
               var_40 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_365:
               var_40 = new TutorialCallGuideBotView(_loc2_,this);
         }
         _window.height = _loc2_.height + var_1397;
         _window.width = _loc2_.width + var_1396;
         if(_loc3_)
         {
            if(_window == null)
            {
               return;
            }
            _window.x = _window.context.getDesktopWindow().width / 2 - 0;
            _window.y = 0;
         }
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  disposeWindow();
               }
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_54.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_913;
      }
      
      public function dispose() : void
      {
         disposeWindow();
         var_54 = null;
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(var_54 == null || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(var_54.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(var_54.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function changeName(param1:String) : void
      {
         disposeWindow();
         var_54.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_686:
               var_915 = true;
               if(var_40 != null && var_40.id == const_365)
               {
                  showView(const_87);
               }
         }
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode != ChangeUserNameResultMessageEvent.var_847)
         {
            showView(const_248);
            (var_40 as TutorialNameChangeView).setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_914;
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         showView(const_248);
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_847)
         {
            (var_40 as TutorialNameChangeView).setNameAvailableView(_loc2_.name);
         }
         else
         {
            (var_40 as TutorialNameChangeView).setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onUserChanged() : void
      {
         var_913 = true;
         if(var_40 != null && (var_40.id == const_401 || var_40.id == const_87))
         {
            showView(const_87);
         }
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(var_40 != null)
         {
            var_40.dispose();
            var_40 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function checkName(param1:String) : void
      {
         disposeWindow();
         var_54.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function get hasTasksDone() : Boolean
      {
         return var_913 && var_914 && var_915;
      }
   }
}
