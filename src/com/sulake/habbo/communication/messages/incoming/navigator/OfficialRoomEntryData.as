package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_782:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_688:int = 2;
      
      public static const const_958:int = 1;
       
      
      private var var_1829:String;
      
      private var _disposed:Boolean;
      
      private var var_1569:int;
      
      private var var_1827:Boolean;
      
      private var var_814:String;
      
      private var var_764:PublicRoomData;
      
      private var _index:int;
      
      private var var_1831:String;
      
      private var _type:int;
      
      private var var_1529:String;
      
      private var var_763:GuestRoomData;
      
      private var var_1830:String;
      
      private var var_1828:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_1829 = param2.readString();
         var_1830 = param2.readString();
         var_1827 = param2.readInteger() == 1;
         var_1831 = param2.readString();
         var_814 = param2.readString();
         var_1569 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_958)
         {
            var_1529 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_764 = new PublicRoomData(param2);
         }
         else if(_type == const_688)
         {
            var_763 = new GuestRoomData(param2);
         }
         else if(_type == const_782)
         {
            var_1828 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1529;
      }
      
      public function get userCount() : int
      {
         return var_1569;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1827;
      }
      
      public function get picText() : String
      {
         return var_1831;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_958)
         {
            return 0;
         }
         if(this.type == const_688)
         {
            return this.var_763.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_764.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1830;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_763 != null)
         {
            this.var_763.dispose();
            this.var_763 = null;
         }
         if(this.var_764 != null)
         {
            this.var_764.dispose();
            this.var_764 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_1829;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_763;
      }
      
      public function get picRef() : String
      {
         return var_814;
      }
      
      public function get flatCategoryId() : int
      {
         return var_1828;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_764;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
