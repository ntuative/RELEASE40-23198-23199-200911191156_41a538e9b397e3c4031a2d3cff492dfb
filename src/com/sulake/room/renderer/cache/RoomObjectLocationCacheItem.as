package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1675:int = -1;
      
      private var var_1270:int = -1;
      
      private var var_602:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_602 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1675;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1675 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_602.assign(param1);
         var_602.x = Math.round(var_602.x);
         var_602.y = Math.round(var_602.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1270 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_602;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1270;
      }
   }
}
