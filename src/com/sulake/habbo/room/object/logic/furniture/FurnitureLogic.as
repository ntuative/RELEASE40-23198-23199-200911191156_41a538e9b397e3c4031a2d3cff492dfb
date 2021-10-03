package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
       
      
      private var var_980:Number = 0;
      
      private var var_660:Boolean = false;
      
      private var var_1961:Number = 0;
      
      private var var_1960:Number = 0;
      
      private var var_1206:Number = 0;
      
      private var var_978:Number = 0;
      
      private var var_979:Number = 0;
      
      private var var_209:Array;
      
      public function FurnitureLogic()
      {
         var_209 = [];
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            object.setState(_loc3_.state,0);
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_146,_loc3_.data);
            }
            return;
         }
         var _loc4_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc4_ != null)
         {
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_954,_loc4_.itemData);
            }
            return;
         }
         var_660 = false;
         super.processUpdateMessage(param1);
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var_978 = 0;
         var_979 = 0;
         var_980 = 0;
         var_209 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            var_978 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            var_979 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            var_980 = Number(_loc3_);
         }
         var_1961 = var_978 / 2;
         var_1960 = var_979 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            var_1206 = Number(_loc3_);
         }
         else
         {
            var_1206 = var_980 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               var_209.push(_loc8_);
            }
            _loc6_++;
         }
         var_209.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_272,var_978,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_444,var_979,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_614,var_980,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1144,var_1961,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1175,var_1960,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_973,var_1206,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_659,var_209,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_168,1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_209 = null;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!var_660)
               {
                  _loc3_ = object.getModel() as IRoomObjectModelController;
                  if(_loc3_ == null)
                  {
                     return;
                  }
                  _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_216);
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_315,_loc6_,_loc7_));
                  }
                  var_660 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(var_660)
               {
                  _loc3_ = object.getModel() as IRoomObjectModelController;
                  if(_loc3_ == null)
                  {
                     return;
                  }
                  _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_216);
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_277,_loc6_,_loc7_));
                  }
                  var_660 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               _loc3_ = object.getModel() as IRoomObjectModelController;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_216);
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_368,_loc6_,_loc7_));
               }
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_189,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
               _loc3_ = object.getModel() as IRoomObjectModelController;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_216);
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_244,_loc6_,_loc7_));
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_452,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
   }
}
