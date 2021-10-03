package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_203:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1907:Boolean = false;
      
      private var var_1906:int = 0;
      
      private var var_1905:int = 0;
      
      private var var_1908:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_203,param5,param6);
         var_1908 = param1;
         var_1905 = param2;
         var_1906 = param3;
         var_1907 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1906;
      }
      
      public function get periodsLeft() : int
      {
         return var_1905;
      }
      
      public function get daysLeft() : int
      {
         return var_1908;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1907;
      }
   }
}
