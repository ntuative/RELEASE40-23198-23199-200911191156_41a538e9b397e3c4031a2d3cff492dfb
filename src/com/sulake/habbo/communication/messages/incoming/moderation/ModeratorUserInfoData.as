package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1546:int;
      
      private var var_1543:int;
      
      private var var_1545:int;
      
      private var _userName:String;
      
      private var var_1542:int;
      
      private var var_1541:int;
      
      private var var_1544:int;
      
      private var _userId:int;
      
      private var var_619:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1541 = param1.readInteger();
         var_1542 = param1.readInteger();
         var_619 = param1.readBoolean();
         var_1545 = param1.readInteger();
         var_1543 = param1.readInteger();
         var_1546 = param1.readInteger();
         var_1544 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1544;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_619;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1542;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1543;
      }
      
      public function get cautionCount() : int
      {
         return var_1546;
      }
      
      public function get cfhCount() : int
      {
         return var_1545;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1541;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
