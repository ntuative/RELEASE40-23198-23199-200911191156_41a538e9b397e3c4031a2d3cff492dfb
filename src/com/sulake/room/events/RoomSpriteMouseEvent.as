package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1899:Boolean = false;
      
      private var var_1900:Boolean = false;
      
      private var var_1902:String = "";
      
      private var _type:String = "";
      
      private var var_1897:Boolean = false;
      
      private var var_1895:Number = 0;
      
      private var var_1898:Number = 0;
      
      private var var_1903:Number = 0;
      
      private var var_1904:String = "";
      
      private var var_1896:Number = 0;
      
      private var var_1901:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1904 = param2;
         var_1902 = param3;
         var_1898 = param4;
         var_1903 = param5;
         var_1895 = param6;
         var_1896 = param7;
         var_1901 = param8;
         var_1900 = param9;
         var_1897 = param10;
         var_1899 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1901;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1899;
      }
      
      public function get localX() : Number
      {
         return var_1895;
      }
      
      public function get localY() : Number
      {
         return var_1896;
      }
      
      public function get canvasId() : String
      {
         return var_1904;
      }
      
      public function get altKey() : Boolean
      {
         return var_1900;
      }
      
      public function get spriteTag() : String
      {
         return var_1902;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1898;
      }
      
      public function get screenY() : Number
      {
         return var_1903;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1897;
      }
   }
}
