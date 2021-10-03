package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_883:IID;
      
      private var var_358:uint;
      
      private var var_1082:IUnknown;
      
      private var var_1083:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_883 = param1;
         var_1083 = getQualifiedClassName(var_883);
         var_1082 = param2;
         var_358 = 0;
      }
      
      public function get iid() : IID
      {
         return var_883;
      }
      
      public function get references() : uint
      {
         return var_358;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_358) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1082;
      }
      
      public function get iis() : String
      {
         return var_1083;
      }
      
      public function reserve() : uint
      {
         return ++var_358;
      }
      
      public function dispose() : void
      {
         var_883 = null;
         var_1083 = null;
         var_1082 = null;
         var_358 = 0;
      }
   }
}
