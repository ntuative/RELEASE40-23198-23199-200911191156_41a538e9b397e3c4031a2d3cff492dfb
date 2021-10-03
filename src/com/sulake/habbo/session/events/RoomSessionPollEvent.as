package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_114:String = "RSPE_POLL_CONTENT";
      
      public static const const_107:String = "RSPE_POLL_OFFER";
      
      public static const const_57:String = "RSPE_POLL_ERROR";
       
      
      private var var_975:Array = null;
      
      private var var_1202:String = "";
      
      private var var_1181:String;
      
      private var var_1201:String = "";
      
      private var var_976:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_975;
      }
      
      public function get startMessage() : String
      {
         return var_1202;
      }
      
      public function get summary() : String
      {
         return var_1181;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1202 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_976 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1181 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_976;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1201 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1201;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_975 = param1;
      }
   }
}
