package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_690;
         param1["bitmap"] = const_492;
         param1["border"] = const_498;
         param1["border_notify"] = const_1122;
         param1["button"] = const_367;
         param1["button_thick"] = const_647;
         param1["button_icon"] = const_1096;
         param1["button_group_left"] = const_537;
         param1["button_group_center"] = const_522;
         param1["button_group_right"] = const_620;
         param1["canvas"] = const_634;
         param1["checkbox"] = const_691;
         param1["closebutton"] = const_943;
         param1["container"] = const_279;
         param1["container_button"] = const_662;
         param1["display_object_wrapper"] = const_573;
         param1["dropmenu"] = const_409;
         param1["dropmenu_item"] = const_344;
         param1["frame"] = const_306;
         param1["frame_notify"] = const_1200;
         param1["header"] = const_559;
         param1["icon"] = const_935;
         param1["itemgrid"] = const_901;
         param1["itemgrid_horizontal"] = const_364;
         param1["itemgrid_vertical"] = const_663;
         param1["itemlist"] = const_821;
         param1["itemlist_horizontal"] = const_310;
         param1["itemlist_vertical"] = const_326;
         param1["maximizebox"] = const_1245;
         param1["menu"] = const_1140;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_895;
         param1["minimizebox"] = const_1320;
         param1["notify"] = const_1232;
         param1["null"] = const_385;
         param1["password"] = const_520;
         param1["radiobutton"] = const_625;
         param1["region"] = const_439;
         param1["restorebox"] = const_1258;
         param1["scaler"] = const_834;
         param1["scaler_horizontal"] = const_1234;
         param1["scaler_vertical"] = const_1328;
         param1["scrollbar_horizontal"] = const_463;
         param1["scrollbar_vertical"] = const_621;
         param1["scrollbar_slider_button_up"] = const_940;
         param1["scrollbar_slider_button_down"] = const_818;
         param1["scrollbar_slider_button_left"] = const_955;
         param1["scrollbar_slider_button_right"] = const_837;
         param1["scrollbar_slider_bar_horizontal"] = const_854;
         param1["scrollbar_slider_bar_vertical"] = const_906;
         param1["scrollbar_slider_track_horizontal"] = const_939;
         param1["scrollbar_slider_track_vertical"] = const_796;
         param1["scrollable_itemlist"] = const_1189;
         param1["scrollable_itemlist_vertical"] = const_358;
         param1["scrollable_itemlist_horizontal"] = const_826;
         param1["selector"] = const_488;
         param1["selector_list"] = const_542;
         param1["submenu"] = const_895;
         param1["tab_button"] = const_579;
         param1["tab_container_button"] = const_845;
         param1["tab_context"] = const_432;
         param1["tab_content"] = const_925;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_718;
         param1["input"] = const_717;
         param1["toolbar"] = const_1290;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
