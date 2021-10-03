package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_915:Boolean;
      
      private var var_914:Boolean;
      
      private var var_913:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_915;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_914;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_913 = param1.readBoolean();
         var_914 = param1.readBoolean();
         var_915 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_913;
      }
      
      public function flush() : Boolean
      {
         var_913 = false;
         var_914 = false;
         var_915 = false;
         return true;
      }
   }
}
