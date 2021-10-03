package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_89:Number = 0;
      
      private var _data:String = "";
      
      private var var_2221:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2027:Boolean = false;
      
      private var var_2222:String = "";
      
      private var _id:int = 0;
      
      private var var_195:Boolean = false;
      
      private var var_224:String = "";
      
      private var var_2028:int = 0;
      
      private var var_2029:int = 0;
      
      private var var_1895:int = 0;
      
      private var var_1896:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2027 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_195)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2027;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_195)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_224;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_195)
         {
            var_1895 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_195)
         {
            var_2028 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_195)
         {
            var_2029 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_195)
         {
            var_224 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_195)
         {
            var_1896 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_195)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1895;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_195)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2028;
      }
      
      public function get wallY() : Number
      {
         return var_2029;
      }
      
      public function get localY() : Number
      {
         return var_1896;
      }
      
      public function setReadOnly() : void
      {
         var_195 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_195)
         {
            var_89 = param1;
         }
      }
   }
}
