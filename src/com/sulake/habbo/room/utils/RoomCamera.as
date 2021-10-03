package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_338:Number = 0.5;
      
      private static const const_758:int = 3;
      
      private static const const_1071:Number = 1;
       
      
      private var var_1992:Boolean = false;
      
      private var _targetCategory:int = -2;
      
      private var var_1990:Boolean = false;
      
      private var var_1991:Boolean = false;
      
      private var var_1993:Boolean = false;
      
      private var var_1989:int = -1;
      
      private var var_990:int = 0;
      
      private var var_268:Vector3d = null;
      
      private var var_400:Vector3d = null;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1990;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1991;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_400 != null && var_268 != null)
         {
            ++var_990;
            _loc2_ = Vector3d.dif(var_400,var_268);
            if(_loc2_.length <= const_338)
            {
               var_268 = var_400;
               var_400 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_338 * (const_758 + 1))
               {
                  _loc2_.mul(const_338);
               }
               else if(var_990 <= const_758)
               {
                  _loc2_.mul(const_338);
               }
               else
               {
                  _loc2_.mul(const_1071);
               }
               var_268 = Vector3d.sum(var_268,_loc2_);
            }
         }
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1990 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1993 = param1;
      }
      
      public function get targetId() : int
      {
         return var_1989;
      }
      
      public function set targetCategory(param1:int) : void
      {
         _targetCategory = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_400 == null)
         {
            var_400 = new Vector3d();
         }
         var_400.assign(param1);
         var_990 = 0;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1991 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_268 != null)
         {
            return;
         }
         var_268 = new Vector3d();
         var_268.assign(param1);
      }
      
      public function set targetId(param1:int) : void
      {
         var_1989 = param1;
      }
      
      public function dispose() : void
      {
         var_400 = null;
         var_268 = null;
      }
      
      public function get targetCategory() : int
      {
         return _targetCategory;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1992;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1993;
      }
      
      public function get location() : IVector3d
      {
         return var_268;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1992 = param1;
      }
   }
}
