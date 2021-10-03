package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_114:String = "RWPUW_CONTENT";
      
      public static const const_107:String = "RWPUW_OFFER";
      
      public static const const_57:String = "RWPUW_ERROR";
       
      
      private var var_975:Array = null;
      
      private var var_1202:String = "";
      
      private var var_1181:String;
      
      private var var_1201:String = "";
      
      private var var_976:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         _id = param1;
         super(param2,param3,param4);
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
