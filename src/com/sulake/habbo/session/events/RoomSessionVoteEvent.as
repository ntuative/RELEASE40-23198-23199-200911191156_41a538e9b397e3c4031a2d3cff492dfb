package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_109:String = "RSPE_VOTE_RESULT";
      
      public static const const_113:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1239:int = 0;
      
      private var var_991:String = "";
      
      private var var_592:Array;
      
      private var var_916:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_916 = [];
         var_592 = [];
         super(param1,param2,param7,param8);
         var_991 = param3;
         var_916 = param4;
         var_592 = param5;
         if(var_592 == null)
         {
            var_592 = [];
         }
         var_1239 = param6;
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
