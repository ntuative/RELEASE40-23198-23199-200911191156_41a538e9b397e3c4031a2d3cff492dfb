package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserFigureUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_134:String = "RWUTUE_USER_FIGURE";
       
      
      private var _userId:int;
      
      private var _image:BitmapData;
      
      private var var_1682:Boolean;
      
      public function RoomWidgetUserFigureUpdateEvent(param1:int, param2:BitmapData, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_134,param4,param5);
         _userId = param1;
         _image = param2;
         var_1682 = param3;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get isOwnUser() : Boolean
      {
         return var_1682;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
