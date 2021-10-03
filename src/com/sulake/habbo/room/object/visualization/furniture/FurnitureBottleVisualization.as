package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_984:int = -1;
      
      private static const const_751:int = 20;
      
      private static const const_481:int = 9;
       
      
      private var var_533:Boolean = false;
      
      private var var_229:Array;
      
      public function FurnitureBottleVisualization()
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
            var_229.push(const_984);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_533)
            {
               var_533 = false;
               var_229 = new Array();
               var_229.push(const_751);
               var_229.push(const_481 + param1);
               var_229.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
