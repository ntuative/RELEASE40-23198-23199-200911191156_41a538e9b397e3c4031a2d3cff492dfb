package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GenericEventQueue implements IDisposable
   {
       
      
      protected var var_68:IEventDispatcher;
      
      protected var _disposed:Boolean = false;
      
      protected var _index:uint = 0;
      
      protected var var_275:Array;
      
      public function GenericEventQueue(param1:IEventDispatcher)
      {
         super();
         var_275 = new Array();
         var_68 = param1;
      }
      
      public function get length() : uint
      {
         return var_275.length;
      }
      
      public function begin() : void
      {
         _index = 0;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      protected function eventListener(param1:Event) : void
      {
         var_275.push(param1);
      }
      
      public function remove() : void
      {
         var_275.splice(_index - 1,1);
         if(_index > 0)
         {
            --_index;
         }
      }
      
      public function next() : Event
      {
         var _loc1_:* = null;
         if(_index < var_275.length)
         {
            _loc1_ = var_275[_index];
            ++_index;
         }
         return _loc1_;
      }
      
      public function end() : void
      {
         _index = 0;
      }
      
      public function flush() : void
      {
         var_275.splice(0,var_275.length);
         _index = 0;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_68 = null;
            var_275 = null;
            _disposed = true;
         }
      }
   }
}
