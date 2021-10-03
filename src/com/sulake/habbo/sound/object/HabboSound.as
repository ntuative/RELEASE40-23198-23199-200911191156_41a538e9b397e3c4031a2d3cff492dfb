package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1003:SoundChannel = null;
      
      private var var_835:Boolean;
      
      private var var_1002:Sound = null;
      
      private var var_632:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1002 = param1;
         var_1002.addEventListener(Event.COMPLETE,onComplete);
         var_632 = 1;
         var_835 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_835;
      }
      
      public function stop() : Boolean
      {
         var_1003.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_835 = false;
         var_1003 = var_1002.play(0);
         this.volume = var_632;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_632;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1003.position;
      }
      
      public function get length() : Number
      {
         return var_1002.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_632 = param1;
         if(var_1003 != null)
         {
            var_1003.soundTransform = new SoundTransform(var_632);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_835 = true;
      }
   }
}
