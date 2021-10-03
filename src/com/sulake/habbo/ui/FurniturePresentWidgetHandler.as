package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenedMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class FurniturePresentWidgetHandler implements IRoomWidgetHandler, IGetImageListener
   {
      
      private static const const_170:String = "landscape";
      
      private static const const_171:String = "floor";
      
      private static const const_1063:String = "poster";
      
      private static const const_172:String = "wallpaper";
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_161:int = -1;
      
      private var _name:String = "";
      
      public function FurniturePresentWidgetHandler()
      {
         super();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:RoomWidgetPresentDataUpdateEvent = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_71,0,_name,false,param2);
         _container.events.dispatchEvent(_loc3_);
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function update() : void
      {
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionPresentEvent.const_219];
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_553,RoomWidgetPresentOpenMessage.const_516,RoomWidgetPresentOpenedMessage.const_1310];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(_container != null && false && param1 != null)
         {
            switch(param1.type)
            {
               case RoomSessionPresentEvent.const_219:
                  _loc2_ = param1 as RoomSessionPresentEvent;
                  if(_loc2_ != null)
                  {
                     _name = "";
                     _loc4_ = null;
                     _loc3_ = _container.sessionDataManager.getFurnitureData(_loc2_.classId);
                     switch(_loc2_.itemType)
                     {
                        case ProductTypeEnum.const_136:
                           if(_loc3_ != null && _loc3_.name == const_171)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_420,0,_container.localization.getKey("inventory.furni.item.floor.name"),false,null);
                           }
                           else if(_loc3_ != null && _loc3_.name == const_170)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_351,0,_container.localization.getKey("inventory.furni.item.landscape.name"),false,null);
                           }
                           else if(_loc3_ != null && _loc3_.name == const_172)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_357,0,_container.localization.getKey("inventory.furni.item.wallpaper.name"),false,null);
                           }
                           else
                           {
                              if(_loc3_ != null && _loc3_.name == const_1063)
                              {
                                 break;
                              }
                              _loc4_ = _container.roomEngine.getWallItemIcon(_loc2_.classId,this);
                              if(_loc3_ != null)
                              {
                                 _name = _loc3_.title;
                              }
                              if(_loc4_ != null)
                              {
                                 _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_71,0,_name,false,_loc4_.data);
                              }
                           }
                           break;
                        case ProductTypeEnum.const_547:
                           _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_402,0,_container.localization.getKey("widget.furni.present.hc"),false,null);
                           break;
                        default:
                           _loc4_ = _container.roomEngine.getFurnitureIcon(_loc2_.classId,this);
                           if(_loc3_ != null)
                           {
                              _name = _loc3_.title;
                           }
                           if(_loc4_ != null)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_71,0,_name,false,_loc4_.data);
                           }
                     }
                     if(_loc5_ != null)
                     {
                        _container.events.dispatchEvent(_loc5_);
                        break;
                     }
                     break;
                  }
            }
         }
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_347;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_553:
               _loc2_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = _container.roomEngine.getRoomObject(_loc2_.roomId,_loc2_.roomCategory,_loc2_.id,_loc2_.category);
               if(_loc3_ != null)
               {
                  _loc5_ = _loc3_.getModel();
                  if(_loc5_ != null)
                  {
                     var_161 = _loc2_.id;
                     _loc6_ = _loc5_.getString(RoomObjectVariableEnum.const_146);
                     if(_loc6_ == null)
                     {
                        _loc6_ = "";
                     }
                     _loc6_ = _loc6_.substr(1);
                     _loc7_ = _container.roomSession.isRoomOwner || _container.sessionDataManager.isAnyRoomController;
                     _loc8_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_60,_loc2_.id,_loc6_,_loc7_);
                     _container.events.dispatchEvent(_loc8_);
                  }
               }
               break;
            case RoomWidgetPresentOpenMessage.const_516:
               _loc4_ = param1 as RoomWidgetPresentOpenMessage;
               if(_loc4_.objectId != var_161)
               {
                  return null;
               }
               if(_container != null && false)
               {
                  _container.roomSession.sendPresentOpenMessage(_loc4_.objectId);
               }
               break;
         }
         return null;
      }
   }
}
