package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PlacePetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_90:int;
      
      private var _y:int;
      
      private var var_1043:int;
      
      public function PlacePetMessageComposer(param1:int, param2:int, param3:int, param4:int = 0, param5:int = 0)
      {
         super();
         var_1043 = param1;
         var_90 = param2;
         _y = param3;
         _roomId = param4;
         _roomCategory = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1043,var_90,_y];
      }
      
      public function dispose() : void
      {
      }
   }
}
