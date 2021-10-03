package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2180:Boolean;
      
      private var var_2178:int;
      
      private var var_2177:Boolean;
      
      private var var_1357:String;
      
      private var var_1177:String;
      
      private var var_1665:int;
      
      private var var_1748:String;
      
      private var var_2179:String;
      
      private var var_1747:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1665 = param1.readInteger();
         this.var_1357 = param1.readString();
         this.var_1748 = param1.readString();
         this.var_2180 = param1.readBoolean();
         this.var_2177 = param1.readBoolean();
         param1.readString();
         this.var_2178 = param1.readInteger();
         this.var_1747 = param1.readString();
         this.var_2179 = param1.readString();
         this.var_1177 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1177;
      }
      
      public function get avatarName() : String
      {
         return this.var_1357;
      }
      
      public function get avatarId() : int
      {
         return this.var_1665;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2180;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2179;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1747;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2177;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1748;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2178;
      }
   }
}
