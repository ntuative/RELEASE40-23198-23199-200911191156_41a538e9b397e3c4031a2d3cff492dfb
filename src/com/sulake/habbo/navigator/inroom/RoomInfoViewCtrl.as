package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_662:IWindowContainer;
      
      private var var_982:ITextWindow;
      
      private var var_201:RoomSettingsCtrl;
      
      private var var_1213:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_464:Timer;
      
      private var var_1212:ITextWindow;
      
      private var var_333:IWindowContainer;
      
      private var var_1968:IWindowContainer;
      
      private var var_1965:ITextWindow;
      
      private var var_796:IWindowContainer;
      
      private var var_1450:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_588:ITextWindow;
      
      private var var_1446:IWindowContainer;
      
      private var var_1208:IWindowContainer;
      
      private var var_798:ITextWindow;
      
      private var var_981:ITextFieldWindow;
      
      private var var_294:IWindowContainer;
      
      private var var_797:ITextWindow;
      
      private var var_1449:IButtonWindow;
      
      private var var_983:ITextWindow;
      
      private var var_2182:int;
      
      private var var_1209:IContainerButtonWindow;
      
      private var var_795:IWindowContainer;
      
      private var var_1210:ITextWindow;
      
      private var var_1207:IContainerButtonWindow;
      
      private var var_1447:ITextWindow;
      
      private var var_1448:IButtonWindow;
      
      private var var_944:TagRenderer;
      
      private var var_1966:ITextWindow;
      
      private var var_334:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_661:ITextWindow;
      
      private var var_266:RoomThumbnailCtrl;
      
      private var var_1211:IContainerButtonWindow;
      
      private var var_1967:IWindowContainer;
      
      private var var_267:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_334 = new RoomEventViewCtrl(_navigator);
         var_201 = new RoomSettingsCtrl(_navigator,this,true);
         var_266 = new RoomThumbnailCtrl(_navigator);
         var_944 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_201);
         var_464 = new Timer(6000,1);
         var_464.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_201.active = true;
         this.var_334.active = false;
         this.var_266.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1450.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1448.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1446.visible = Util.hasVisibleChildren(var_1446);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_588.text = param1.roomName;
         var_588.height = NaN;
         _ownerName.text = param1.ownerName;
         var_798.text = param1.description;
         var_944.refreshTags(var_333,param1.tags);
         var_798.visible = false;
         if(param1.description != "")
         {
            var_798.height = NaN;
            var_798.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_333,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_333,"thumb_down",_loc3_,onThumbDown,0);
         var_1965.visible = _loc3_;
         var_797.visible = !_loc3_;
         var_1447.visible = !_loc3_;
         var_1447.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_333,"home",param2,null,0);
         _navigator.refreshButton(var_333,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_333,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_588.y,0);
         var_333.visible = true;
         var_333.height = Util.getLowestPoint(var_333);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_375,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1449.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1213.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1211.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1209.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1207.visible = _navigator.data.canEditRoomSettings && param1;
         var_1208.visible = Util.hasVisibleChildren(var_1208);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_464.reset();
         this.var_334.active = false;
         this.var_201.active = false;
         this.var_266.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_464.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_464.reset();
         this.var_334.active = false;
         this.var_201.active = false;
         this.var_266.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_375,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_294);
         var_294.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_201.refresh(var_294);
         this.var_266.refresh(var_294);
         Util.moveChildrenToColumn(var_294,["room_details","room_buttons"],0,2);
         var_294.height = Util.getLowestPoint(var_294);
         var_294.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_981.setSelection(0,var_981.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_267);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_334.refresh(var_267);
         if(Util.hasVisibleChildren(var_267) && !this.var_266.active)
         {
            Util.moveChildrenToColumn(var_267,["event_details","event_buttons"],0,2);
            var_267.height = Util.getLowestPoint(var_267);
            var_267.visible = true;
         }
         else
         {
            var_267.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_464.reset();
         this.var_334.active = true;
         this.var_201.active = false;
         this.var_266.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_464.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_982.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_982.height = NaN;
         var_1212.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1212.height = NaN;
         Util.moveChildrenToColumn(var_662,["public_space_name","public_space_desc"],var_982.y,0);
         var_662.visible = true;
         var_662.height = Math.max(86,Util.getLowestPoint(var_662));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","HeadView") == "true";
         if(_loc1_ && true && true && true)
         {
            var_795.visible = true;
            var_981.text = this.getEmbedData();
         }
         else
         {
            var_795.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_464.reset();
         this.var_201.load(param1);
         this.var_201.active = true;
         this.var_334.active = false;
         this.var_266.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_464.reset();
         this.var_201.active = false;
         this.var_334.active = false;
         this.var_266.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_65,false);
         _window.setParamFlag(HabboWindowParam.const_1223,true);
         var_294 = IWindowContainer(find("room_info"));
         var_333 = IWindowContainer(find("room_details"));
         var_662 = IWindowContainer(find("public_space_details"));
         var_1967 = IWindowContainer(find("owner_name_cont"));
         var_1968 = IWindowContainer(find("rating_cont"));
         var_1208 = IWindowContainer(find("room_buttons"));
         var_588 = ITextWindow(find("room_name"));
         var_982 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_798 = ITextWindow(find("room_desc"));
         var_1212 = ITextWindow(find("public_space_desc"));
         var_983 = ITextWindow(find("owner_caption"));
         var_797 = ITextWindow(find("rating_caption"));
         var_1965 = ITextWindow(find("rate_caption"));
         var_1447 = ITextWindow(find("rating_txt"));
         var_267 = IWindowContainer(find("event_info"));
         var_796 = IWindowContainer(find("event_details"));
         var_1446 = IWindowContainer(find("event_buttons"));
         var_1966 = ITextWindow(find("event_name"));
         var_661 = ITextWindow(find("event_desc"));
         var_1213 = IContainerButtonWindow(find("add_favourite_button"));
         var_1211 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1209 = IContainerButtonWindow(find("make_home_button"));
         var_1207 = IContainerButtonWindow(find("unmake_home_button"));
         var_1449 = IButtonWindow(find("room_settings_button"));
         var_1450 = IButtonWindow(find("create_event_button"));
         var_1448 = IButtonWindow(find("edit_event_button"));
         var_795 = IWindowContainer(find("embed_info"));
         var_1210 = ITextWindow(find("embed_info_txt"));
         var_981 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1213,onAddFavouriteClick);
         Util.setProcDirectly(var_1211,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1449,method_8);
         Util.setProcDirectly(var_1209,onMakeHomeClick);
         Util.setProcDirectly(var_1207,onUnmakeHomeClick);
         Util.setProcDirectly(var_1450,onEventSettingsClick);
         Util.setProcDirectly(var_1448,onEventSettingsClick);
         Util.setProcDirectly(var_981,onEmbedSrcClick);
         _navigator.refreshButton(var_1213,"favourite",true,null,0);
         _navigator.refreshButton(var_1211,"favourite",true,null,0);
         _navigator.refreshButton(var_1209,"home",true,null,0);
         _navigator.refreshButton(var_1207,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_294,onHover);
         Util.setProcDirectly(var_267,onHover);
         var_983.width = var_983.textWidth;
         Util.moveChildrenToRow(var_1967,["owner_caption","owner_name"],var_983.x,var_983.y,3);
         var_797.width = var_797.textWidth;
         Util.moveChildrenToRow(var_1968,["rating_caption","rating_txt"],var_797.x,var_797.y,3);
         var_1210.height = NaN;
         Util.moveChildrenToColumn(var_795,["embed_info_txt","embed_src_txt"],var_1210.y,2);
         var_795.height = Util.getLowestPoint(var_795) + 5;
         var_2182 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1966.text = param1.eventName;
         var_661.text = param1.eventDescription;
         var_944.refreshTags(var_796,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_661.visible = false;
         if(param1.eventDescription != "")
         {
            var_661.height = NaN;
            var_661.y = Util.getLowestPoint(var_796) + 2;
            var_661.visible = true;
         }
         var_796.visible = true;
         var_796.height = Util.getLowestPoint(var_796);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function method_8(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_851,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
