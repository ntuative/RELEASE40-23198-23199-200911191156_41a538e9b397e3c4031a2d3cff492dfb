package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_250:uint = 1;
      
      public static const const_471:uint = 0;
      
      public static const const_890:uint = 8;
      
      public static const const_263:uint = 4;
      
      public static const const_467:uint = 2;
       
      
      private var var_379:uint;
      
      private var var_2064:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2065:uint;
      
      private var var_100:Rectangle;
      
      private var var_572:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_100 = param3;
         _color = param4;
         var_379 = param5;
         var_2064 = param6;
         var_2065 = param7;
         var_572 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2064;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_379;
      }
      
      public function get scaleV() : uint
      {
         return var_2065;
      }
      
      public function get tags() : Array
      {
         return var_572;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_100 = null;
         var_572 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_100;
      }
   }
}
