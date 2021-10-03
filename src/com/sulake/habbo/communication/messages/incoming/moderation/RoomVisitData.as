package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_588:String;
      
      private var var_1815:int;
      
      private var var_1365:Boolean;
      
      private var _roomId:int;
      
      private var var_1816:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1365 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_588 = param1.readString();
         var_1816 = param1.readInteger();
         var_1815 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1365;
      }
      
      public function get roomName() : String
      {
         return var_588;
      }
      
      public function get enterMinute() : int
      {
         return var_1815;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1816;
      }
   }
}
