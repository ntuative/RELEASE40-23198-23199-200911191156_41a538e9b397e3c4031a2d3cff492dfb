package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1623:int;
      
      private var var_2106:int = 0;
      
      private var var_2105:String;
      
      private var var_2107:int;
      
      private var var_2104:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1623 = param1;
         var_2107 = param2;
         var_2104 = param3;
         var_2105 = param4;
      }
      
      public function get length() : int
      {
         return var_2107;
      }
      
      public function get name() : String
      {
         return var_2104;
      }
      
      public function get creator() : String
      {
         return var_2105;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2106;
      }
      
      public function get id() : int
      {
         return var_1623;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2106 = param1;
      }
   }
}
