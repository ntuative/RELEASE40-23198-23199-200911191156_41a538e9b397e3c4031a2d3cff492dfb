package com.sulake.room.object.visualization
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
       
      
      private var var_943:Boolean = false;
      
      private var var_1531:Boolean = false;
      
      private var var_1042:String = "normal";
      
      private var var_1081:String = "";
      
      private var var_1530:Boolean = false;
      
      private var _offset:Point;
      
      private var var_319:Boolean = true;
      
      private var var_1533:Boolean = true;
      
      private var var_960:Number = 0;
      
      private var _height:int = 0;
      
      private var _width:int = 0;
      
      private var var_1529:String = "";
      
      private var var_1532:uint = 255;
      
      private var _color:uint = 16777215;
      
      private var var_710:IAsset = null;
      
      private var var_942:Boolean = false;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
      }
      
      public function get flipV() : Boolean
      {
         return var_943;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1530;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_943 = param1;
      }
      
      public function get tag() : String
      {
         return var_1529;
      }
      
      public function dispose() : void
      {
         var_710 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_1042 = param1;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_1533 = param1;
      }
      
      public function get blendMode() : String
      {
         return var_1042;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_960 = param1;
      }
      
      public function set tag(param1:String) : void
      {
         var_1529 = param1;
      }
      
      public function set alpha(param1:uint) : void
      {
         if(param1 > 255)
         {
            param1 = 255;
         }
         var_1532 = param1;
      }
      
      public function get assetName() : String
      {
         return var_1081;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_1533;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1531;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1081 = param1;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get relativeDepth() : Number
      {
         return var_960;
      }
      
      public function get alpha() : uint
      {
         return var_1532;
      }
      
      public function set asset(param1:IAsset) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 is BitmapDataAsset)
         {
            var_710 = param1;
            _width = 0;
            _height = 0;
            if(param1 != null)
            {
               _loc2_ = param1 as BitmapDataAsset;
               _loc3_ = _loc2_.content as BitmapData;
               if(_loc3_ != null)
               {
                  _width = _loc3_.width;
                  _height = _loc3_.height;
               }
            }
         }
         else if(param1 == null)
         {
            var_710 = null;
            _width = 0;
            _height = 0;
         }
      }
      
      public function set color(param1:uint) : void
      {
         param1 &= 16777215;
         _color = param1;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1531 = param1;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1530 = param1;
      }
      
      public function get asset() : IAsset
      {
         return var_710;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_319 = param1;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_942 = param1;
      }
      
      public function get visible() : Boolean
      {
         return var_319;
      }
      
      public function get flipH() : Boolean
      {
         return var_942;
      }
   }
}
