package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModAlertMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModBanMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ModActionCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_143:Array;
       
      
      private var _disposed:Boolean;
      
      private var var_1305:String;
      
      private var var_820:IButtonWindow;
      
      private var var_1233:int;
      
      private var var_54:ModerationManager;
      
      private var var_673:OffenceCategoryData;
      
      private var var_404:ITextFieldWindow;
      
      private var var_822:IButtonWindow;
      
      private var var_55:IFrameWindow;
      
      private var var_821:IDropMenuWindow;
      
      private var var_276:Boolean = true;
      
      private var var_672:OffenceData;
      
      public function ModActionCtrl(param1:ModerationManager, param2:int, param3:String)
      {
         super();
         var_54 = param1;
         var_1233 = param2;
         var_1305 = param3;
         if(var_143 == null)
         {
            var_143 = new Array();
            var_143.push(new BanDefinition("2 hours",2));
            var_143.push(new BanDefinition("4 hours",4));
            var_143.push(new BanDefinition("12 hours",12));
            var_143.push(new BanDefinition("24 hours",24));
            var_143.push(new BanDefinition("2 days",48));
            var_143.push(new BanDefinition("3 days",72));
            var_143.push(new BanDefinition("1 week",168));
            var_143.push(new BanDefinition("2 weeks",336));
            var_143.push(new BanDefinition("3 weeks",504));
            var_143.push(new BanDefinition("1 month",720));
            var_143.push(new BanDefinition("2 months",1440));
            var_143.push(new BanDefinition("1 year",8760));
            var_143.push(new BanDefinition("2 years",17520));
            var_143.push(new BanDefinition("Permanent",100000));
         }
         var_820 = IButtonWindow(var_54.getXmlWindow("modact_offence"));
         var_822 = IButtonWindow(var_54.getXmlWindow("modact_offencectg"));
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      private function getBanLength() : int
      {
         var _loc1_:int = this.var_821.selection;
         var _loc2_:BanDefinition = var_143[_loc1_];
         return _loc2_.banLengthHours;
      }
      
      private function onBanButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Ban...");
         if(!isMsgGiven())
         {
            return;
         }
         if(this.var_821.selection < 0)
         {
            var_54.windowManager.alert("Alert","You must select ban lenght",0,onAlertClose);
            return;
         }
         var_54.connection.send(new ModBanMessageComposer(var_1233,var_404.text,getBanLength()));
         this.dispose();
      }
      
      private function onSendCautionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         if(!isMsgGiven())
         {
            return;
         }
         var_54.connection.send(new ModAlertMessageComposer(var_1233,var_404.text));
         this.dispose();
      }
      
      private function onChangeCategorizationButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_672 != null)
         {
            var_672 = null;
         }
         else
         {
            var_673 = null;
         }
         this.refreshCategorization();
      }
      
      public function getId() : String
      {
         return var_1305;
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function onOffenceCtgButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_673 = var_54.initMsg.offenceCategories[_loc3_];
         this.refreshCategorization();
      }
      
      public function show() : void
      {
         var_55 = IFrameWindow(var_54.getXmlWindow("modact_summary"));
         var_55.caption = "Mod action on: " + var_1305;
         var_55.findChildByName("send_caution_but").procedure = onSendCautionButton;
         var_55.findChildByName("kick_but").procedure = onKickButton;
         var_55.findChildByName("ban_but").procedure = onBanButton;
         var_55.findChildByName("change_categorization_but").procedure = onChangeCategorizationButton;
         var_54.disableButton(var_54.initMsg.alertPermission,var_55,"send_caution_but");
         var_54.disableButton(var_54.initMsg.kickPermission,var_55,"kick_but");
         var_54.disableButton(var_54.initMsg.banPermission,var_55,"ban_but");
         var_404 = ITextFieldWindow(var_55.findChildByName("message_input"));
         var_404.procedure = onInputClick;
         var_821 = IDropMenuWindow(var_55.findChildByName("banLengthSelect"));
         prepareBanSelect(var_821);
         var _loc1_:IWindow = var_55.findChildByTag("close");
         _loc1_.procedure = onClose;
         refreshCategorization();
         var_55.visible = true;
      }
      
      private function onKickButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Kick...");
         if(!isMsgGiven())
         {
            return;
         }
         var_54.connection.send(new ModKickMessageComposer(var_1233,var_404.text));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_311)
         {
            return;
         }
         if(!var_276)
         {
            return;
         }
         var_404.text = "";
         var_276 = false;
      }
      
      private function isMsgGiven() : Boolean
      {
         if(var_276 || false)
         {
            var_54.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return false;
         }
         return true;
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
         if(var_820 != null)
         {
            var_820.destroy();
            var_820 = null;
         }
         if(var_822 != null)
         {
            var_822.destroy();
            var_822 = null;
         }
         var_821 = null;
         var_404 = null;
         var_54 = null;
      }
      
      public function refreshCategorization() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_55.findChildByName("categorization_cont"));
         hideChildren(_loc1_);
         _loc1_.findChildByName("categorization_caption_txt").visible = true;
         _loc1_.findChildByName("change_categorization_but").visible = var_673 != null;
         if(this.var_672 != null)
         {
            var_55.findChildByName("offence_txt").caption = this.var_672.name;
            var_55.findChildByName("offence_category").visible = true;
         }
         else if(this.var_673 != null)
         {
            this.refreshButtons("offences_cont",2,var_673.offences,var_820,onOffenceButton);
         }
         else
         {
            this.refreshButtons("offence_categories_cont",3,var_54.initMsg.offenceCategories,var_822,onOffenceCtgButton);
            _loc1_.height = RoomToolCtrl.getLowestPoint(_loc1_);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function refreshButtons(param1:String, param2:int, param3:Array, param4:IWindow, param5:Function) : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc6_:IWindowContainer = IWindowContainer(var_55.findChildByName(param1));
         hideChildren(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for each(_loc11_ in param3)
         {
            _loc12_ = "" + _loc7_;
            _loc13_ = IButtonWindow(_loc6_.findChildByName(_loc12_));
            if(_loc13_ == null)
            {
               _loc13_ = IButtonWindow(param4.clone());
               _loc13_.procedure = param5;
               _loc13_.x = _loc9_ * (param4.width + 5);
               _loc13_.y = _loc8_ * (param4.height + 5);
               _loc13_.name = _loc12_;
               _loc6_.addChild(_loc13_);
            }
            _loc13_.caption = _loc11_.name;
            _loc13_.visible = true;
            _loc7_++;
            _loc9_++;
            if(_loc9_ >= param2)
            {
               _loc9_ = 0;
               _loc8_++;
            }
         }
         _loc6_.height = RoomToolCtrl.getLowestPoint(_loc6_);
         _loc6_.visible = true;
      }
      
      private function prepareBanSelect(param1:IDropMenuWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_143)
         {
            _loc2_.push(_loc3_.name);
         }
         param1.populate(_loc2_);
      }
      
      private function onOffenceButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_672 = var_673.offences[_loc3_];
         var_404.text = var_672.msg;
         var_276 = false;
         this.refreshCategorization();
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_55;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1297;
      }
   }
}
