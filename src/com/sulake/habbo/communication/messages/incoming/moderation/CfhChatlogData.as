package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_912:int;
      
      private var var_1597:int;
      
      private var var_1312:int;
      
      private var var_119:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1312 = param1.readInteger();
         var_1597 = param1.readInteger();
         var_912 = param1.readInteger();
         var_119 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1312);
      }
      
      public function get reportedUserId() : int
      {
         return var_912;
      }
      
      public function get callerUserId() : int
      {
         return var_1597;
      }
      
      public function get callId() : int
      {
         return var_1312;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_119;
      }
   }
}
