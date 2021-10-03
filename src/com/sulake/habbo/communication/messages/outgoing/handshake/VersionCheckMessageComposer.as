package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1788:String;
      
      private var var_1133:String;
      
      private var var_1787:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1787 = param1;
         var_1133 = param2;
         var_1788 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1787,var_1133,var_1788];
      }
      
      public function dispose() : void
      {
      }
   }
}
