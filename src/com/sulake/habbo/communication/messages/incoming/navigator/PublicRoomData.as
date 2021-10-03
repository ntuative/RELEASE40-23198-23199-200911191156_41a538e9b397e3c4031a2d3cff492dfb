package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1560:int;
      
      private var var_1557:String;
      
      private var var_1558:int;
      
      private var _disposed:Boolean;
      
      private var var_1561:int;
      
      private var var_1559:String;
      
      private var var_1241:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1559 = param1.readString();
         var_1560 = param1.readInteger();
         var_1558 = param1.readInteger();
         var_1557 = param1.readString();
         var_1561 = param1.readInteger();
         var_1241 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1561;
      }
      
      public function get worldId() : int
      {
         return var_1558;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1559;
      }
      
      public function get unitPort() : int
      {
         return var_1560;
      }
      
      public function get castLibs() : String
      {
         return var_1557;
      }
      
      public function get nodeId() : int
      {
         return var_1241;
      }
   }
}
