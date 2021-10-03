package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_161:int;
      
      private var var_224:int = 0;
      
      private var _roomId:int;
      
      private var var_90:int = 0;
      
      private var _y:int = 0;
      
      private var var_1888:int;
      
      private var var_1887:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_161 = param1;
         var_1888 = param2;
         var_1887 = param3;
         var_90 = param4;
         _y = param5;
         var_224 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1888)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
               return [var_161 + " " + var_90 + " " + _y + " " + var_224];
            case RoomObjectCategoryEnum.const_29:
               return [var_161 + " " + var_1887];
            default:
               return [];
         }
      }
   }
}
