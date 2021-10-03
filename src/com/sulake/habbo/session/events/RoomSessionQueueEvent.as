package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_397:String = "RSQE_QUEUE_STATUS";
      
      public static const const_771:int = 2;
      
      public static const const_927:String = "c";
      
      public static const const_1288:String = "d";
      
      public static const const_794:int = 1;
       
      
      private var var_1158:Map;
      
      private var _name:String;
      
      private var var_2230:String;
      
      private var var_255:Boolean;
      
      private var _target:int;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_397,param1,param5,param6);
         _name = param2;
         _target = param3;
         var_1158 = new Map();
         var_255 = param4;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_1158.getValue(param1);
      }
      
      public function get queueTypes() : Array
      {
         return var_1158.getKeys();
      }
      
      public function get queueSetTarget() : int
      {
         return _target;
      }
      
      public function get isActive() : Boolean
      {
         return var_255;
      }
      
      public function get queueSetName() : String
      {
         return _name;
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_1158.add(param1,param2);
      }
   }
}
