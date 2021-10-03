package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_630:String = "RWUAM_RESPECT_USER";
      
      public static const const_674:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_591:String = "RWUAM_START_TRADING";
      
      public static const const_671:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_500:String = "RWUAM_WHISPER_USER";
      
      public static const const_651:String = "RWUAM_IGNORE_USER";
      
      public static const const_681:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_504:String = "RWUAM_BAN_USER";
      
      public static const const_524:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_454:String = "RWUAM_KICK_USER";
      
      public static const const_658:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_704:String = " RWUAM_RESPECT_PET";
      
      public static const const_374:String = "RWUAM_KICK_BOT";
      
      public static const const_1285:String = "RWUAM_TRAIN_PET";
      
      public static const const_490:String = "RWUAM_PICKUP_PET";
      
      public static const const_712:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_551:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
