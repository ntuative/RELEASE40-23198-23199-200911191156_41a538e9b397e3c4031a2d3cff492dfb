package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1156:Boolean;
      
      private var var_1694:String;
      
      private var _frames:XMLList;
      
      private var var_920:String = "-1";
      
      private var var_5:String;
      
      private var var_166:int = 120;
      
      private var var_1099:String = "-1";
      
      private var var_1100:String;
      
      private var var_1695:Boolean;
      
      private var var_1339:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1156 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1695 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_166 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1100 = param1.@namebase;
         }
         else
         {
            var_1100 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_920 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1099 = param1.@nextState;
         }
         else
         {
            var_1099 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1339 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1694 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_5 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_920 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1695;
      }
      
      public function get defaultState() : String
      {
         return var_1339;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1339 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1694;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_166;
      }
      
      public function get loop() : Boolean
      {
         return var_1156;
      }
      
      public function get nextState() : String
      {
         return var_1099;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_5;
      }
      
      public function get stateOver() : String
      {
         return var_920;
      }
      
      public function get nameBase() : String
      {
         return var_1100;
      }
   }
}
