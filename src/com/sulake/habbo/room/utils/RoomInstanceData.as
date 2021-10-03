package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_706:LegacyWallGeometry = null;
      
      private var var_503:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_502:TileHeightMap = null;
      
      private var var_1600:String = null;
      
      private var _roomId:int = 0;
      
      private var var_707:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_706 = new LegacyWallGeometry();
         var_707 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_502 != null)
         {
            var_502.dispose();
         }
         var_502 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1600 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_706;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_707;
      }
      
      public function dispose() : void
      {
         if(var_502 != null)
         {
            var_502.dispose();
            var_502 = null;
         }
         if(var_706 != null)
         {
            var_706.dispose();
            var_706 = null;
         }
         if(var_707 != null)
         {
            var_707.dispose();
            var_707 = null;
         }
         if(var_503 != null)
         {
            var_503.dispose();
            var_503 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_502;
      }
      
      public function get worldType() : String
      {
         return var_1600;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_503 != null)
         {
            var_503.dispose();
         }
         var_503 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_503;
      }
   }
}
