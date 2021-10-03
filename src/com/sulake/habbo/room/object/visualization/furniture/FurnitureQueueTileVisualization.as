package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1082:int = 1;
      
      private static const const_984:int = 3;
      
      private static const const_1080:int = 2;
      
      private static const const_1081:int = 15;
       
      
      private var var_830:int;
      
      private var var_229:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_229 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1080)
         {
            var_229 = new Array();
            var_229.push(const_1082);
            var_830 = const_1081;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_830 > 0)
         {
            --var_830;
         }
         if(var_830 == 0)
         {
            if(false)
            {
               super.setAnimation(var_229.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
