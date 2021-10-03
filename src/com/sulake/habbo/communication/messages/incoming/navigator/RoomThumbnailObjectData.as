package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1290:int;
      
      private var var_1289:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1290;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1290 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1290 = this.var_1290;
         _loc1_.var_1289 = this.var_1289;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1289 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1289;
      }
   }
}
