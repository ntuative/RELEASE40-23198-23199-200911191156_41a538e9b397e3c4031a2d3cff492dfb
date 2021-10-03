package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1384:int = -1;
      
      private var var_1141:Boolean;
      
      private var var_1142:String;
      
      private var var_1808:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1808 = String(param1["set-type"]);
         var_1142 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1141 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1384 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1142;
      }
      
      public function get staticId() : int
      {
         return var_1384;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1384 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1141;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1141 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1142 = param1;
      }
      
      public function get setType() : String
      {
         return var_1808;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
