package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1913:Boolean;
      
      private var var_1418:Array;
      
      private var var_1914:Boolean;
      
      private var var_1916:Boolean;
      
      private var var_1920:Boolean;
      
      private var var_153:Array;
      
      private var var_1919:Boolean;
      
      private var var_1915:Boolean;
      
      private var var_1419:Array;
      
      private var var_1918:Boolean;
      
      private var var_1917:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1917;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1913;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1914;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1919;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1915;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1418;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_153 = [];
         var_1418 = [];
         _roomMessageTemplates = [];
         var_1419 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_153.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1418.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1419.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1919 = param1.readBoolean();
         var_1920 = param1.readBoolean();
         var_1914 = param1.readBoolean();
         var_1916 = param1.readBoolean();
         var_1917 = param1.readBoolean();
         var_1915 = param1.readBoolean();
         var_1913 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1918 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1916;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1419;
      }
      
      public function get issues() : Array
      {
         return var_153;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1918;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1920;
      }
   }
}
