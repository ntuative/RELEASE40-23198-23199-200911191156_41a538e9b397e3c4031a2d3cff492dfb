package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2147:Boolean;
      
      private var var_1297:int;
      
      private var var_2146:String = "";
      
      private var var_73:ITextFieldWindow;
      
      private var var_2145:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1132:String = "";
      
      private var var_150:IWindowContainer;
      
      private var var_276:Boolean;
      
      private var var_1041:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_73 = param2;
         var_1297 = param3;
         var_1041 = param4;
         if(param5 != null)
         {
            var_276 = true;
            var_1132 = param5;
            var_73.text = param5;
         }
         Util.setProcDirectly(var_73,onInputClick);
         var_73.addEventListener(WindowKeyboardEvent.const_138,checkEnterPress);
         var_73.addEventListener(WindowEvent.const_251,checkMaxLen);
         this.var_2147 = var_73.textBackground;
         this._orgTextBackgroundColor = var_73.textBackgroundColor;
         this.var_2145 = var_73.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(var_1041 != null)
            {
               var_1041();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_1132 != null)
         {
            var_73.text = var_1132;
            var_276 = true;
         }
         else
         {
            var_73.text = "";
            var_276 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_73;
      }
      
      public function restoreBackground() : void
      {
         var_73.textBackground = this.var_2147;
         var_73.textBackgroundColor = this._orgTextBackgroundColor;
         var_73.textColor = this.var_2145;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_311)
         {
            return;
         }
         if(!var_276)
         {
            return;
         }
         var_73.text = var_2146;
         var_276 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_150 != null)
         {
            var_150.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         var_73.textBackground = true;
         var_73.textBackgroundColor = 4294021019;
         var_73.textColor = 4278190080;
         if(this.var_150 == null)
         {
            this.var_150 = IWindowContainer(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this.var_150,"popup_arrow_down",true,null,0);
            IWindowContainer(var_73.parent).addChild(this.var_150);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_150.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         var_150.findChildByName("border").width = _loc2_.width + 15;
         var_150.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         var_73.getLocalPosition(_loc3_);
         this.var_150.x = _loc3_.x;
         this.var_150.y = _loc3_.y - this.var_150.height + 3;
         var _loc4_:IWindow = var_150.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_150.width / 2 - _loc4_.width / 2;
         var_150.x += (0 - 0) / 2;
         this.var_150.visible = true;
      }
      
      public function getText() : String
      {
         if(var_276)
         {
            return var_2146;
         }
         return var_73.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !var_276 && Util.trim(getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         var_276 = false;
         var_73.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > var_1297)
         {
            var_73.text = _loc2_.substring(0,var_1297);
         }
      }
   }
}
