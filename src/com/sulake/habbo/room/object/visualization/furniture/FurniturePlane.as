package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FurniturePlane
   {
       
      
      private var var_77:Vector3d = null;
      
      private var var_565:Vector3d = null;
      
      private var var_387:Vector3d = null;
      
      private var var_263:Vector3d = null;
      
      private var var_175:Map = null;
      
      private var _bitmapData:BitmapData = null;
      
      private var var_2118:Boolean = false;
      
      private var _offset:Point = null;
      
      private var var_1270:int = -1;
      
      private var _id:String = null;
      
      private var var_649:Vector3d = null;
      
      private var _height:Number = 0;
      
      private var _width:Number = 0;
      
      private var var_137:Vector3d = null;
      
      private var var_564:Vector3d = null;
      
      private var var_84:Vector3d = null;
      
      private var var_107:Vector3d = null;
      
      private var var_108:Vector3d = null;
      
      private var var_1937:Number = 0;
      
      private var var_1014:Number = 0;
      
      private var var_264:Vector3d = null;
      
      private var var_1932:Number = 0;
      
      private var var_1935:Number = 0;
      
      private var _isVisible:Boolean = true;
      
      private var _color:uint = 0;
      
      private var var_1934:Number = 0;
      
      public function FurniturePlane(param1:IVector3d, param2:IVector3d, param3:IVector3d)
      {
         super();
         var_649 = new Vector3d();
         var_77 = new Vector3d();
         var_77.assign(param1);
         var_264 = new Vector3d();
         var_264.assign(param2);
         var_263 = new Vector3d();
         var_263.assign(param3);
         var_564 = new Vector3d();
         var_564.assign(param2);
         var_565 = new Vector3d();
         var_565.assign(param3);
         var_387 = Vector3d.crossProduct(var_264,var_263);
         if(false)
         {
            var_387.mul(Infinity);
         }
         _offset = new Point();
         var_137 = new Vector3d();
         var_108 = new Vector3d();
         var_84 = new Vector3d();
         var_107 = new Vector3d();
         var_175 = new Map();
      }
      
      public function get bitmapData() : BitmapData
      {
         if(_isVisible)
         {
            if(_bitmapData != null)
            {
               return _bitmapData.clone();
            }
         }
         return null;
      }
      
      public function setRotation(param1:Boolean) : void
      {
         if(param1 != var_2118)
         {
            if(!param1)
            {
               var_264.assign(var_564);
               var_263.assign(var_565);
            }
            else
            {
               var_264.assign(var_564);
               var_264.mul(0 / 0);
               var_263.assign(var_565);
               var_263.mul(0 / 0);
            }
            var_1270 = -1;
            var_1014 = var_1014 - 1;
            var_2118 = param1;
            resetTextureCache();
         }
      }
      
      private function resetTextureCache() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_175 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_175.length)
            {
               _loc2_ = var_175.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_175.reset();
         }
      }
      
      public function get visible() : Boolean
      {
         return _isVisible;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(var_137 == null || var_108 == null || var_84 == null || var_107 == null || param2 == null || _bitmapData == null)
         {
            return;
         }
         var _loc3_:Number = 0 - 0;
         var _loc4_:Number = 0 - 0;
         var _loc5_:Number = 0 - 0;
         var _loc6_:Number = 0 - 0;
         if(Math.abs(_loc5_ - param2.width) <= 1)
         {
            _loc5_ = param2.width;
         }
         if(Math.abs(_loc6_ - param2.width) <= 1)
         {
            _loc6_ = param2.width;
         }
         if(Math.abs(_loc3_ - param2.height) <= 1)
         {
            _loc3_ = param2.height;
         }
         if(Math.abs(_loc4_ - param2.height) <= 1)
         {
            _loc4_ = param2.height;
         }
         var _loc7_:Number = _loc5_ / param2.width;
         var _loc8_:Number = _loc6_ / param2.width;
         var _loc9_:Number = _loc3_ / param2.height;
         var _loc10_:Number = _loc4_ / param2.height;
         var _loc11_:Matrix = new Matrix();
         _loc11_.a = _loc7_;
         _loc11_.b = _loc8_;
         _loc11_.c = _loc9_;
         _loc11_.d = _loc10_;
         _loc11_.translate(var_84.x,var_84.y);
         draw(param2,_loc11_);
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(var_175 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_175.length)
            {
               _loc2_ = var_175.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_175.dispose();
            var_175 = null;
         }
         var_649 = null;
         var_77 = null;
         var_264 = null;
         var_263 = null;
         var_564 = null;
         var_565 = null;
         var_387 = null;
         var_137 = null;
         var_108 = null;
         var_84 = null;
         var_107 = null;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_263;
      }
      
      private function cacheTexture(param1:String, param2:BitmapData) : Boolean
      {
         var _loc3_:BitmapData = var_175.remove(param1) as BitmapData;
         if(_loc3_ != null && param2 != _loc3_)
         {
            _loc3_.dispose();
         }
         var_175.add(param1,param2);
         return true;
      }
      
      public function get location() : IVector3d
      {
         return var_77;
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(_bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  ++param2.ty;
               }
               _loc7_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc3_++;
                  _loc5_ += Math.abs(param2.b);
                  if(_loc5_ >= 1)
                  {
                     _bitmapData.copyPixels(param1,new Rectangle(_loc4_ + _loc6_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
                     _loc4_ = _loc3_;
                     if(param2.b > 0)
                     {
                        _loc7_++;
                     }
                     else
                     {
                        _loc7_--;
                     }
                     _loc5_ = 0;
                  }
               }
               if(_loc5_ > 0)
               {
                  _bitmapData.copyPixels(param1,new Rectangle(_loc4_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
               }
               return;
            }
            _bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
      
      public function get relativeDepth() : Number
      {
         return var_1937;
      }
      
      private function needsNewTexture(param1:IRoomGeometry) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = getTextureIdentifier(param1);
         var _loc3_:BitmapData = var_175.getValue(_loc2_) as BitmapData;
         if(_width > 0 && _height > 0)
         {
            if(_loc3_ == null)
            {
               return true;
            }
         }
         return false;
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = NaN;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         if(param1 == null || var_77 == null && var_649 != null || var_264 == null || var_263 == null || var_387 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         if(param1.updateId != var_1270)
         {
            var_1270 = param1.updateId;
            _loc4_ = param1.direction;
            if(_loc4_ != null && (_loc4_.x != var_1014 || _loc4_.y != var_1935 || _loc4_.z != var_1932 || param1.scale != var_1934))
            {
               var_1014 = _loc4_.x;
               var_1935 = _loc4_.y;
               var_1932 = _loc4_.z;
               var_1934 = param1.scale;
               _loc3_ = true;
               _loc5_ = 0;
               _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,normal));
               if(_loc5_ > -0.001)
               {
                  if(_isVisible)
                  {
                     _isVisible = false;
                     return true;
                  }
                  return false;
               }
               updateCorners(param1);
               _loc6_ = param1.getScreenPosition(var_649);
               _loc7_ = _loc6_.z;
               _loc8_ = Math.max(0 - _loc7_,0 - _loc7_,0 - _loc7_,0 - _loc7_);
               var_1937 = _loc8_;
               _isVisible = true;
            }
         }
         if(needsNewTexture(param1) || _loc3_)
         {
            if(_bitmapData == null || _width != _bitmapData.width || _height != _bitmapData.height)
            {
               if(_bitmapData != null)
               {
                  _bitmapData.dispose();
                  _bitmapData = null;
                  if(_width < 1 || _height < 1)
                  {
                     return true;
                  }
               }
               else if(_width < 1 || _height < 1)
               {
                  return false;
               }
               _bitmapData = new BitmapData(_width,_height,true,16777215);
               _bitmapData.lock();
            }
            else
            {
               _bitmapData.lock();
               _bitmapData.fillRect(_bitmapData.rect,16777215);
            }
            _loc9_ = getTexture(param1,param2);
            if(_loc9_ != null)
            {
               renderTexture(param1,_loc9_);
            }
            _bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         var_137.assign(param1.getScreenPosition(var_77));
         var_108.assign(param1.getScreenPosition(Vector3d.sum(var_77,var_263)));
         var_84.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(var_77,var_264),var_263)));
         var_107.assign(param1.getScreenPosition(Vector3d.sum(var_77,var_264)));
         _offset = param1.getScreenPoint(var_649);
         var_137.x = Math.round(var_137.x);
         var_137.y = Math.round(var_137.y);
         var_108.x = Math.round(var_108.x);
         var_108.y = Math.round(var_108.y);
         var_84.x = Math.round(var_84.x);
         var_84.y = Math.round(var_84.y);
         var_107.x = Math.round(var_107.x);
         var_107.y = Math.round(var_107.y);
         _offset.x = Math.round(_offset.x);
         _offset.y = Math.round(_offset.y);
         var _loc2_:Number = Math.min(var_137.x,var_108.x,var_84.x,var_107.x);
         var _loc3_:Number = Math.max(var_137.x,var_108.x,var_84.x,var_107.x);
         var _loc4_:Number = Math.min(var_137.y,var_108.y,var_84.y,var_107.y);
         var _loc5_:Number = Math.max(var_137.y,var_108.y,var_84.y,var_107.y);
         _loc3_ -= _loc2_;
         _offset.x = 0 - _loc2_;
         var_137.x = 0 - _loc2_;
         var_108.x = 0 - _loc2_;
         var_84.x = 0 - _loc2_;
         var_107.x = 0 - _loc2_;
         _loc5_ -= _loc4_;
         _offset.y = 0 - _loc4_;
         var_137.y = 0 - _loc4_;
         var_108.y = 0 - _loc4_;
         var_84.y = 0 - _loc4_;
         var_107.y = 0 - _loc4_;
         _width = _loc3_;
         _height = _loc5_;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc5_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc4_:* = null;
         if(needsNewTexture(param1))
         {
            _loc5_ = Number(0 * param1.scale);
            _loc6_ = Number(0 * param1.scale);
            if(_loc5_ < 1)
            {
               _loc5_ = 1;
            }
            if(_loc6_ < 1)
            {
               _loc6_ = 1;
            }
            _loc7_ = param1.getCoordinatePosition(var_387);
            _loc4_ = var_175.getValue(_loc3_) as BitmapData;
            if(_loc4_ == null)
            {
               _loc4_ = new BitmapData(_loc5_,_loc6_,true,4278190080 | _color);
               if(_loc4_ != null)
               {
                  cacheTexture(_loc3_,_loc4_);
               }
            }
         }
         else
         {
            _loc4_ = var_175.getValue(_loc3_) as BitmapData;
         }
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return null;
      }
      
      public function get normal() : IVector3d
      {
         return var_387;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      private function getTextureIdentifier(param1:IRoomGeometry) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return String(param1.scale);
      }
      
      public function get leftSide() : IVector3d
      {
         return var_264;
      }
   }
}
