package com.sulake.core.utils.profiler
{
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.getQualifiedClassName;
   
   public class ProfilerAgent extends ProfilerAgentTask implements IDisposable
   {
       
      
      protected var var_859:ICoreUpdateReceiver;
      
      public function ProfilerAgent(param1:ICoreUpdateReceiver)
      {
         var_859 = param1;
         var _loc2_:String = getQualifiedClassName(var_859);
         super(_loc2_.slice(_loc2_.lastIndexOf(":") + 1,_loc2_.length));
      }
      
      override public function dispose() : void
      {
         var_859 = null;
         super.dispose();
      }
      
      public function get receiver() : ICoreUpdateReceiver
      {
         return var_859;
      }
      
      public function update(param1:int) : void
      {
         super.start();
         var_859.update(param1);
         super.stop();
      }
   }
}
