package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1789:int;
      
      private var var_376:Boolean;
      
      private var var_1790:Boolean;
      
      private var var_754:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1790 = param1.readBoolean();
         if(var_1790)
         {
            var_1789 = param1.readInteger();
            var_376 = param1.readBoolean();
         }
         else
         {
            var_754 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_754 != null)
         {
            var_754.dispose();
            var_754 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1789;
      }
      
      public function get owner() : Boolean
      {
         return var_376;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1790;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_754;
      }
   }
}
