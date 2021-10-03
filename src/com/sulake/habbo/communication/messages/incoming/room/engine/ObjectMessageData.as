package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_978:int = 0;
      
      private var var_979:int = 0;
      
      private var _data:String = "";
      
      private var var_2221:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_2222:String = "";
      
      private var _id:int = 0;
      
      private var var_195:Boolean = false;
      
      private var var_224:int = 0;
      
      private var var_1652:String = null;
      
      private var var_90:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_195)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_195)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_195)
         {
            var_224 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_195)
         {
            _state = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return var_1652;
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_195)
         {
            var_1652 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_195)
         {
            _data = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_195 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_195)
         {
            var_978 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_195)
         {
            var_979 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_195)
         {
            var_89 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_979;
      }
      
      public function get sizeX() : int
      {
         return var_978;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_195)
         {
            var_90 = param1;
         }
      }
   }
}
