package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_684:int = 6;
      
      public static const const_194:int = 5;
      
      public static const const_523:int = 2;
      
      public static const const_314:int = 9;
      
      public static const const_261:int = 4;
      
      public static const const_221:int = 2;
      
      public static const const_619:int = 4;
      
      public static const const_197:int = 8;
      
      public static const const_503:int = 7;
      
      public static const const_239:int = 3;
      
      public static const const_312:int = 1;
      
      public static const const_192:int = 5;
      
      public static const const_371:int = 12;
      
      public static const const_288:int = 1;
      
      public static const const_435:int = 11;
      
      public static const const_609:int = 3;
      
      public static const const_1462:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_405:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_405 = new Array();
         var_405.push(new Tab(_navigator,const_312,const_371,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_466));
         var_405.push(new Tab(_navigator,const_221,const_288,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_466));
         var_405.push(new Tab(_navigator,const_261,const_435,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_532));
         var_405.push(new Tab(_navigator,const_239,const_194,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_466));
         var_405.push(new Tab(_navigator,const_192,const_197,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_650));
         setSelectedTab(const_312);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_405)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_405)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_405)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_261;
      }
      
      public function get tabs() : Array
      {
         return var_405;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
