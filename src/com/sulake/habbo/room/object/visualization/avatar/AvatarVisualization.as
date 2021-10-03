package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.getTimer;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private const const_1339:int = 0;
      
      private var var_546:String;
      
      private var var_573:int = 0;
      
      private const const_1537:int = 1;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_1044:Number;
      
      private var _isAnimating:Boolean;
      
      private var var_2215:int = 0;
      
      private var var_868:int = 0;
      
      private var var_417:int = 0;
      
      private const const_986:int = 3;
      
      private const const_1538:int = 2;
      
      private var var_698:AvatarVisualizationData = null;
      
      private const const_985:int = 3;
      
      private var var_363:Map;
      
      private var var_697:Array;
      
      public function AvatarVisualization()
      {
         var_1044 = new Date().valueOf();
         var_697 = new Array();
         super();
         var_363 = new Map();
         _assetLibrary = new AssetLibrary("avatar visualization");
         _isAnimating = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_698 = param1 as AvatarVisualizationData;
         createSprites(const_985);
         return true;
      }
      
      override public function update(param1:IRoomGeometry = null) : void
      {
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:Boolean = false;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:* = false;
         var _loc35_:int = 0;
         var _loc36_:* = null;
         var _loc37_:* = null;
         var _loc38_:* = null;
         var _loc39_:* = null;
         var _loc40_:int = 0;
         var _loc41_:* = null;
         var _loc42_:* = null;
         var _loc43_:* = null;
         var _loc44_:int = 0;
         var _loc45_:Number = NaN;
         var _loc46_:int = 0;
         var _loc47_:* = null;
         var _loc48_:* = null;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:* = NaN;
         var _loc52_:Number = NaN;
         var _loc53_:Number = NaN;
         var _loc54_:* = NaN;
         var _loc55_:Number = NaN;
         var _loc56_:Number = NaN;
         var _loc57_:* = NaN;
         var _loc58_:Number = NaN;
         var _loc59_:int = 0;
         var _loc60_:* = null;
         var _loc61_:* = null;
         var _loc62_:int = 0;
         var _loc63_:int = 0;
         var _loc64_:* = null;
         var _loc65_:int = 0;
         var _loc66_:int = 0;
         var _loc67_:int = 0;
         var _loc68_:int = 0;
         var _loc69_:int = 0;
         var _loc70_:* = null;
         var _loc71_:* = null;
         var _loc72_:int = 0;
         var _loc73_:int = 0;
         var _loc74_:int = 0;
         var _loc75_:int = 0;
         var _loc76_:int = 0;
         var _loc77_:* = null;
         var _loc78_:int = 0;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_698 == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         var _loc4_:String = "avatar" + param1.scale.toString();
         var _loc5_:* = var_363.getValue(_loc4_) as IAvatarImage;
         var _loc6_:String = _loc3_.getString(RoomObjectVariableEnum.const_151);
         var _loc7_:Number = new Date().valueOf();
         var _loc8_:Boolean = false;
         var _loc9_:Number = _loc3_.getNumber(RoomObjectVariableEnum.const_624);
         var _loc10_:Number = _loc3_.getNumber(RoomObjectVariableEnum.const_525);
         var _loc11_:Number = _loc7_ - _loc9_;
         if(_loc11_ < _loc10_ * 1000)
         {
            if(Math.random() * 100 > 33 && _loc5_ != null)
            {
               _loc8_ = true;
               var_417 = const_986;
            }
         }
         var _loc12_:Boolean = false;
         var _loc13_:Number = _loc7_ - var_1044;
         if(_loc13_ > 5000 && _loc5_ != null && _loc5_.getScale() == AvatarScaleType.const_50)
         {
            if(Math.random() * 100 > 95)
            {
               var_1044 = _loc7_;
               var_417 = const_986;
               _loc12_ = true;
            }
         }
         var _loc14_:Boolean = false;
         var _loc15_:Number = _loc3_.getNumber(RoomObjectVariableEnum.const_290);
         if(_loc15_ > 0)
         {
            _loc21_ = _loc7_ - _loc15_;
            if(_loc21_ < 0)
            {
               _loc14_ = true;
               var_417 = const_986;
            }
         }
         var _loc16_:int = _loc2_.getUpdateID();
         var _loc17_:int = param1.scale;
         var _loc18_:int = _loc3_.getUpdateID();
         var _loc19_:Boolean = var_274 != _loc2_.getUpdateID() || var_207 != param1.scale || var_182 != _loc3_.getUpdateID();
         var _loc20_:Boolean = _isAnimating || var_417 > 0;
         if(_loc19_ || _loc20_)
         {
            --var_417;
            _loc22_ = getTimer();
            if(var_546 != _loc6_)
            {
               for each(_loc48_ in var_363.getKeys())
               {
                  var_363.remove(_loc48_);
               }
               _loc5_ = null;
            }
            if(_loc5_ == null)
            {
               _loc5_ = var_698.getAvatar(_loc6_,param1.scale);
               if(_loc5_ == null)
               {
                  return;
               }
               var_363.remove(_loc4_);
               var_363.add(_loc4_,_loc5_);
               var_546 = _loc6_;
            }
            _loc23_ = _loc2_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc23_ = (_loc23_ % 360 + 360) % 360;
            _loc5_.setDirectionAngle(AvatarSetType.const_37,_loc23_);
            _loc24_ = _loc3_.getNumber(RoomObjectVariableEnum.const_303);
            if(isNaN(_loc24_) || _loc3_.getString(RoomObjectVariableEnum.const_226) == "float")
            {
               _loc24_ = _loc23_;
            }
            else
            {
               _loc24_ -= param1.direction.x + 135 - 22.5;
            }
            _loc24_ = (_loc24_ % 360 + 360) % 360;
            _loc5_.setDirectionAngle(AvatarSetType.const_45,_loc24_);
            _loc5_.initActionAppends();
            _loc25_ = _loc3_.getString(RoomObjectVariableEnum.const_226);
            _loc26_ = _loc3_.getString(RoomObjectVariableEnum.const_495);
            _loc5_.appendAction(AvatarAction.const_549,_loc25_,_loc26_);
            _loc27_ = false;
            if(_loc25_ == "lay")
            {
               _loc49_ = Number(_loc26_);
               if(_loc49_ < 0)
               {
                  _loc27_ = true;
               }
            }
            _loc28_ = _loc3_.getNumber(RoomObjectVariableEnum.const_398);
            if(_loc28_ > 0 && _loc5_.getScale() == AvatarScaleType.const_50)
            {
               _loc50_ = _loc3_.getNumber(RoomObjectVariableEnum.const_410);
               _loc51_ = 3;
               _loc52_ = _loc7_ - _loc50_;
               if(_loc52_ < _loc51_ * 1000)
               {
                  _loc5_.appendAction(AvatarAction.const_325,AvatarAction.const_1172[_loc28_]);
               }
            }
            _loc29_ = _loc3_.getNumber(RoomObjectVariableEnum.const_867);
            if(_loc29_ > 0)
            {
               _loc5_.appendAction(AvatarAction.const_915,_loc29_);
            }
            _loc30_ = _loc3_.getNumber(RoomObjectVariableEnum.const_783);
            if(_loc30_ > 0)
            {
               _loc53_ = _loc3_.getNumber(RoomObjectVariableEnum.const_941);
               _loc54_ = 5;
               _loc55_ = _loc7_ - _loc53_;
               if(_loc55_ < _loc54_ * 1000)
               {
                  _loc5_.appendAction(AvatarAction.const_804,_loc30_);
               }
            }
            _loc31_ = _loc3_.getNumber(RoomObjectVariableEnum.const_618);
            _loc32_ = 0;
            if(_loc31_ > 0)
            {
               _loc56_ = _loc3_.getNumber(RoomObjectVariableEnum.const_509);
               _loc57_ = 100;
               _loc58_ = _loc7_ - _loc56_;
               if(_loc58_ < _loc57_ * 1000)
               {
                  _loc5_.appendAction(AvatarAction.const_891,_loc31_);
                  _loc59_ = 1;
                  while(_loc59_ < 10)
                  {
                     if(_loc58_ > _loc59_ * 10 * 1000 && _loc58_ < _loc59_ * 10 * 1000 + 1000)
                     {
                        _loc32_ = _loc31_;
                     }
                     _loc59_++;
                  }
               }
            }
            _loc33_ = _loc3_.getNumber(RoomObjectVariableEnum.const_800);
            if(_loc32_ > 0)
            {
               _loc33_ = _loc32_;
            }
            if(_loc33_ > 0)
            {
               _loc5_.appendAction(AvatarAction.const_844,_loc33_);
            }
            if(_loc8_)
            {
               _loc5_.appendAction(AvatarAction.const_393);
            }
            _loc34_ = _loc3_.getNumber(RoomObjectVariableEnum.const_469) > 0;
            if(_loc34_ || _loc12_)
            {
               _loc5_.appendAction(AvatarAction.const_487);
            }
            if(_loc14_)
            {
               _loc5_.appendAction(AvatarAction.const_396);
            }
            _loc35_ = _loc3_.getNumber(RoomObjectVariableEnum.const_848);
            if(_loc35_ > 0)
            {
               _loc5_.appendAction(AvatarAction.const_540,_loc35_);
            }
            _loc5_.endActionAppends();
            ++var_573;
            ++var_868;
            if(var_868 > 1)
            {
               _loc5_.updateAnimationByFrames(1);
               var_868 = 0;
            }
            _loc36_ = _loc5_.getImage(AvatarSetType.const_37);
            if(_loc36_ == null)
            {
               return;
            }
            _isAnimating = _loc5_.isAnimating();
            _loc37_ = _loc5_.avatarSpriteData;
            if(_loc37_ != null)
            {
            }
            _loc38_ = "avatar " + param1.scale;
            _loc39_ = _assetLibrary.getAssetByName(_loc38_) as BitmapDataAsset;
            if(_loc39_ == null)
            {
               _loc39_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
               _assetLibrary.setAsset(_loc38_,_loc39_);
            }
            if(_loc39_.content != null)
            {
               _loc60_ = _loc39_.content as BitmapData;
               if(_loc60_ != null && _loc60_ != _loc36_)
               {
                  _loc60_.dispose();
               }
            }
            _loc39_.setUnknownContent(_loc36_.clone());
            _loc40_ = const_985;
            for each(_loc41_ in _loc5_.getSprites())
            {
               if(_loc41_.id != "avatar")
               {
                  _loc40_++;
               }
            }
            if(_loc40_ != spriteCount)
            {
               createSprites(_loc40_);
            }
            _loc43_ = _loc5_.getCanvasOffsets();
            if(_loc43_ == null || _loc43_.length < 3)
            {
               _loc43_ = new Array(0,0,0);
            }
            _loc44_ = 0;
            if(_loc25_ == "sit" || _loc25_ == "lay")
            {
               _loc44_ = param1.scale / 2;
            }
            _loc42_ = getSprite(const_1339);
            if(_loc42_ != null)
            {
               _loc42_.asset = _loc39_;
               _loc42_.offsetX = -1 * param1.scale / 2 + _loc43_[0];
               _loc42_.offsetY = -_loc36_.height + param1.scale / 4 + _loc43_[1] + _loc44_;
               if(_loc27_)
               {
                  _loc42_.relativeDepth = -0.5;
               }
               else if(_loc25_ == "lay")
               {
                  _loc42_.relativeDepth = -0.409 + _loc43_[2];
               }
               else
               {
                  _loc42_.relativeDepth = -0.01 + _loc43_[2];
               }
            }
            _loc45_ = Math.sqrt(0.5);
            _loc46_ = const_985;
            for each(_loc47_ in _loc5_.getSprites())
            {
               if(_loc47_.id == "avatar")
               {
                  _loc42_ = getSprite(const_1339);
                  _loc61_ = _loc5_.getLayerData(_loc47_);
                  _loc62_ = _loc47_.getDirectionOffsetX(_loc5_.getDirection());
                  _loc63_ = _loc47_.getDirectionOffsetY(_loc5_.getDirection());
                  if(_loc61_ != null)
                  {
                     _loc62_ += _loc61_.dx;
                     _loc63_ += _loc61_.dy;
                  }
                  if(param1.scale < 48)
                  {
                     _loc62_ /= 2;
                     _loc63_ /= 2;
                  }
                  _loc42_.offsetX += _loc62_;
                  _loc42_.offsetY += _loc63_;
               }
               else
               {
                  _loc42_ = getSprite(_loc46_);
                  if(_loc42_ != null)
                  {
                     _loc42_.visible = true;
                     _loc64_ = _loc5_.getLayerData(_loc47_);
                     _loc65_ = 0;
                     _loc66_ = _loc47_.getDirectionOffsetX(_loc5_.getDirection());
                     _loc67_ = _loc47_.getDirectionOffsetY(_loc5_.getDirection());
                     _loc68_ = _loc47_.getDirectionOffsetZ(_loc5_.getDirection());
                     _loc69_ = 0;
                     if(_loc47_.hasDirections)
                     {
                        _loc69_ = _loc5_.getDirection();
                     }
                     if(_loc64_ != null)
                     {
                        _loc65_ = _loc64_.animationFrame;
                        _loc66_ += _loc64_.dx;
                        _loc67_ += _loc64_.dy;
                        _loc69_ += _loc64_.directionOffset;
                     }
                     if(param1.scale < 48)
                     {
                        _loc66_ /= 2;
                        _loc67_ /= 2;
                     }
                     if(_loc69_ < 0)
                     {
                        _loc69_ += 8;
                     }
                     if(_loc69_ > 7)
                     {
                        _loc69_ -= 8;
                     }
                     _loc70_ = _loc5_.getScale() + "_" + _loc47_.member + "_" + _loc69_ + "_" + _loc65_;
                     _loc71_ = _loc5_.getAsset(_loc70_);
                     if(_loc71_ == null)
                     {
                        continue;
                     }
                     _loc42_.asset = _loc71_;
                     _loc42_.offsetX = -1 * _loc71_.offset.x - param1.scale / 2 + _loc66_;
                     _loc42_.offsetY = -1 * _loc71_.offset.y + _loc67_ + _loc44_;
                     if(_loc25_ == "lay")
                     {
                        _loc42_.relativeDepth = -0.409 - 0.1 * _loc40_ * _loc68_;
                     }
                     else
                     {
                        _loc42_.relativeDepth = -0.01 - 0.1 * _loc40_ * _loc68_;
                     }
                     if(_loc47_.ink == 33)
                     {
                        _loc42_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc42_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc46_++;
               }
            }
            _loc42_ = getSprite(const_1537);
            if(_loc25_ == "mv" || _loc25_ == "std")
            {
               _loc42_.visible = true;
               _loc39_ = null;
               _loc38_ = null;
               _loc72_ = 0;
               _loc73_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     _loc38_ = "sh_std_sd_1_0_0";
                     _loc72_ = -8;
                     _loc73_ = -3;
                     break;
                  case 64:
                     _loc38_ = "h_std_sd_1_0_0";
                     _loc72_ = -17;
                     _loc73_ = -7;
               }
               if(_loc38_ != null)
               {
                  _loc39_ = _loc5_.getAsset(_loc38_);
               }
               if(_loc39_ != null)
               {
                  _loc42_.asset = _loc39_;
                  _loc42_.offsetX = _loc72_;
                  _loc42_.offsetY = _loc73_;
                  _loc42_.alpha = 50;
                  _loc42_.relativeDepth = 1;
               }
            }
            else
            {
               _loc42_.visible = false;
            }
            _loc42_ = getSprite(const_1538);
            if(_loc3_.getNumber(RoomObjectVariableEnum.const_822))
            {
               _loc42_.visible = true;
               _loc39_ = null;
               _loc38_ = null;
               switch(param1.scale)
               {
                  case 32:
                     _loc38_ = "user_typing_small_png";
                     _loc74_ = 3;
                     _loc75_ = -42;
                     break;
                  case 64:
                     _loc38_ = "user_typing_png";
                     _loc74_ = 14;
                     _loc75_ = -83;
               }
               if(_loc38_ != null)
               {
                  _loc39_ = var_698.getAvatarRendererAsset(_loc38_) as BitmapDataAsset;
               }
               if(_loc39_ != null)
               {
                  _loc42_.asset = _loc39_;
                  _loc42_.offsetX = _loc74_;
                  _loc42_.offsetY = _loc75_;
                  _loc42_.relativeDepth = -0.02 + _loc43_[2];
               }
            }
            else
            {
               _loc42_.visible = false;
            }
            var_274 = _loc2_.getUpdateID();
            var_182 = _loc3_.getUpdateID();
            var_207 = param1.scale;
            var_697.push(getTimer() - _loc22_);
            if(false)
            {
               _loc76_ = 0;
               _loc77_ = "[";
               for each(_loc78_ in var_697)
               {
                  _loc76_ += _loc78_;
                  _loc77_ += "," + _loc78_;
               }
               _loc77_ += "]";
               var_697 = new Array();
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_363 != null)
         {
            _loc1_ = var_363.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_363.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         var_698 = null;
      }
   }
}
