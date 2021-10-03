package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1988:Date;
      
      private var var_1221:Boolean = false;
      
      private var _type:int;
      
      private var var_346:BitmapData;
      
      private var var_255:Boolean = false;
      
      private var var_1242:int;
      
      private var var_557:int = 1;
      
      private var var_989:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_346;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_557;
         if(var_557 < 0)
         {
            var_557 = 0;
         }
         var_989 = var_1242;
         var_255 = false;
         var_1221 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_989 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_255;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_346 = param1;
      }
      
      public function get duration() : int
      {
         return var_1242;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1221;
      }
      
      public function get effectsInInventory() : int
      {
         return var_557;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_346;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_255)
         {
            var_1988 = new Date();
         }
         var_255 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_557 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_255)
         {
            _loc1_ = var_989 - (new Date().valueOf() - var_1988.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_989;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1221 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1242 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
