package com.sulake.habbo.avatar.pets
{
   public class PetData implements IPetData
   {
       
      
      private var _name:String;
      
      private var var_197:String;
      
      private var _colors:Array;
      
      private var var_553:int;
      
      private var var_1423:Array;
      
      public function PetData(param1:XML)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super();
         _name = param1.@name;
         var_553 = parseInt(param1.@species);
         var_197 = param1.@scale;
         _colors = new Array();
         var_1423 = new Array();
         trace("Found Pet Pack: " + _name);
         for each(_loc2_ in param1.breeds.breed)
         {
            var_1423.push(new Breed(_loc2_));
         }
         for each(_loc3_ in param1.colors.color)
         {
            _colors.push(new PetColor(_loc3_));
         }
         for each(_loc4_ in param1.joints.joint)
         {
         }
      }
      
      public function get species() : int
      {
         return var_553;
      }
      
      public function get colors() : Array
      {
         return _colors;
      }
      
      public function findColor(param1:uint) : PetColor
      {
         var _loc2_:* = null;
         for each(var _loc5_ in _colors)
         {
            _loc2_ = _loc5_;
            _loc5_;
            if(_loc2_.rgb == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get scale() : String
      {
         return var_197;
      }
      
      public function get breeds() : Array
      {
         return var_1423;
      }
   }
}
