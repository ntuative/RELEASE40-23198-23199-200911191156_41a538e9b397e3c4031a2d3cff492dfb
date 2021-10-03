package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_721:int = -1;
      
      public static const const_971:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2078:int = -1;
      
      private var var_90:int = 0;
      
      private var var_1258:int = 1;
      
      private var var_836:int = 1;
      
      private var var_2077:Boolean = false;
      
      private var var_2079:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_90 = param2;
         _y = param3;
         var_2077 = param5;
         if(param4 < 0)
         {
            param4 = const_721;
         }
         var_836 = param4;
         var_1258 = param4;
         if(param6 >= 0)
         {
            var_2078 = param6;
            var_2079 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_836 > 0 && param1 > var_836)
         {
            param1 = var_836;
         }
         var_1258 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_836;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2079;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_836 < 0)
         {
            return const_721;
         }
         return var_1258;
      }
      
      public function get activeSequence() : int
      {
         return var_2078;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2077;
      }
      
      public function get x() : int
      {
         return var_90;
      }
   }
}
