package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_990:int = 80;
       
      
      private var var_418:Map;
      
      private var var_588:String = "";
      
      private var var_1057:Array;
      
      public function UserRegistry()
      {
         var_418 = new Map();
         var_1057 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_418.getValue(var_1057.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_588;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_418.getValue(param1) != null)
         {
            var_418.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_588);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_588 == "")
         {
            var_1057.push(param1);
         }
         var_418.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_418;
      }
      
      public function unregisterRoom() : void
      {
         var_588 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_418.length > const_990)
         {
            _loc1_ = var_418.getKey(0);
            var_418.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_588 = param1;
         if(var_588 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
