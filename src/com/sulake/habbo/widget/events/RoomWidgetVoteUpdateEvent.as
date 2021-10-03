package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_109:String = "RWPUE_VOTE_RESULT";
      
      public static const const_113:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1239:int;
      
      private var var_991:String;
      
      private var var_592:Array;
      
      private var var_916:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_991 = param2;
         var_916 = param3;
         var_592 = param4;
         if(var_592 == null)
         {
            var_592 = [];
         }
         var_1239 = param5;
      }
      
      public function get votes() : Array
      {
         return var_592.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1239;
      }
      
      public function get question() : String
      {
         return var_991;
      }
      
      public function get choices() : Array
      {
         return var_916.slice();
      }
   }
}
