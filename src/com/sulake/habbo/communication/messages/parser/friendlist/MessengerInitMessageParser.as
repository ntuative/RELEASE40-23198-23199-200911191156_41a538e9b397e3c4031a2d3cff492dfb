package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2151:int;
      
      private var var_2153:int;
      
      private var var_2152:int;
      
      private var var_212:Array;
      
      private var var_2154:int;
      
      private var var_2150:int;
      
      private var var_318:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_318 = new Array();
         this.var_212 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2151;
      }
      
      public function get friends() : Array
      {
         return this.var_212;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2152;
      }
      
      public function get categories() : Array
      {
         return this.var_318;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2153;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2150;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2150 = param1.readInteger();
         this.var_2152 = param1.readInteger();
         this.var_2151 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_318.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_212.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2153 = param1.readInteger();
         this.var_2154 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2154;
      }
   }
}
