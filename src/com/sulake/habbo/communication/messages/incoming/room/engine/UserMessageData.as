package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1205:String = "F";
      
      public static const const_892:String = "M";
       
      
      private var var_90:Number = 0;
      
      private var var_546:String = "";
      
      private var var_1925:int = 0;
      
      private var var_1778:String = "";
      
      private var var_1779:int = 0;
      
      private var var_1780:int = 0;
      
      private var var_1781:String = "";
      
      private var var_1255:String = "";
      
      private var _id:int = 0;
      
      private var var_195:Boolean = false;
      
      private var var_224:int = 0;
      
      private var var_1924:String = "";
      
      private var _name:String = "";
      
      private var var_1782:int = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_195)
         {
            var_224 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_195)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1925;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_195)
         {
            var_1779 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1924;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_195)
         {
            var_1781 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_195)
         {
            var_1924 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_195)
         {
            var_1780 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_195)
         {
            var_546 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_195)
         {
            var_1925 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_195)
         {
            var_1255 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1779;
      }
      
      public function get groupID() : String
      {
         return var_1781;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_195)
         {
            var_1782 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_195)
         {
            var_1778 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_195 = true;
      }
      
      public function get sex() : String
      {
         return var_1255;
      }
      
      public function get figure() : String
      {
         return var_546;
      }
      
      public function get webID() : int
      {
         return var_1782;
      }
      
      public function get custom() : String
      {
         return var_1778;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_195)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_195)
         {
            var_89 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_195)
         {
            var_90 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1780;
      }
   }
}
