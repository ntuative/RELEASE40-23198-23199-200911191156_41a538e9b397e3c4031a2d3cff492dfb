package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1057:int = 31;
      
      private static const const_984:int = 32;
      
      private static const const_751:int = 10;
      
      private static const const_481:int = 20;
       
      
      private var var_533:Boolean = false;
      
      private var var_229:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_229 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_533 = true;
            var_229 = new Array();
            var_229.push(const_1057);
            var_229.push(const_984);
            return;
         }
         if(param1 > 0 && param1 <= const_751)
         {
            if(var_533)
            {
               var_533 = false;
               var_229 = new Array();
               var_229.push(const_751 + param1);
               var_229.push(const_481 + param1);
               var_229.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
