package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ButtonController extends InteractiveController implements IButtonWindow
   {
      
      protected static const TEXT_FIELD_NAME:String = "_BTN_TEXT";
       
      
      public function ButtonController(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:IWindow, param9:Function, param10:Array = null, param11:Array = null, param12:uint = 0)
      {
         param5 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
         expandToAccommodateChildren();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var subject:WindowController = param1;
         var event:Event = param2;
         switch(event.type)
         {
            case WindowNotifyEvent.const_267:
               width = 0;
               break;
            case WindowNotifyEvent.const_489:
               try
               {
                  getChildByName(TEXT_FIELD_NAME).blend = getChildByName(TEXT_FIELD_NAME).blend + 0.5;
               }
               catch(e:Error)
               {
               }
               break;
            case WindowNotifyEvent.const_590:
               try
               {
                  getChildByName(TEXT_FIELD_NAME).blend = getChildByName(TEXT_FIELD_NAME).blend - 0.5;
               }
               catch(e:Error)
               {
               }
         }
         return super.update(subject,event);
      }
      
      override public function set caption(param1:String) : void
      {
         super.caption = param1;
         var _loc2_:ITextWindow = ITextWindow(getChildByName(TEXT_FIELD_NAME));
         if(_loc2_ != null)
         {
            _loc2_.text = caption;
         }
      }
   }
}
