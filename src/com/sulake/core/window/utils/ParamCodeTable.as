package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_90;
         param1["bound_to_parent_rect"] = const_80;
         param1["child_window"] = const_788;
         param1["embedded_controller"] = const_289;
         param1["resize_to_accommodate_children"] = const_62;
         param1["input_event_processor"] = const_48;
         param1["internal_event_handling"] = const_709;
         param1["mouse_dragging_target"] = const_206;
         param1["mouse_dragging_trigger"] = const_280;
         param1["mouse_scaling_target"] = const_225;
         param1["mouse_scaling_trigger"] = const_376;
         param1["horizontal_mouse_scaling_trigger"] = const_183;
         param1["vertical_mouse_scaling_trigger"] = const_201;
         param1["observe_parent_input_events"] = const_945;
         param1["optimize_region_to_layout_size"] = const_345;
         param1["parent_window"] = const_876;
         param1["relative_horizontal_scale_center"] = const_150;
         param1["relative_horizontal_scale_fixed"] = const_116;
         param1["relative_horizontal_scale_move"] = const_273;
         param1["relative_horizontal_scale_strech"] = const_245;
         param1["relative_scale_center"] = const_846;
         param1["relative_scale_fixed"] = const_685;
         param1["relative_scale_move"] = const_931;
         param1["relative_scale_strech"] = const_957;
         param1["relative_vertical_scale_center"] = const_157;
         param1["relative_vertical_scale_fixed"] = const_110;
         param1["relative_vertical_scale_move"] = const_283;
         param1["relative_vertical_scale_strech"] = const_232;
         param1["on_resize_align_left"] = const_589;
         param1["on_resize_align_right"] = const_457;
         param1["on_resize_align_center"] = const_391;
         param1["on_resize_align_top"] = const_558;
         param1["on_resize_align_bottom"] = const_431;
         param1["on_resize_align_middle"] = const_386;
         param1["on_accommodate_align_left"] = const_780;
         param1["on_accommodate_align_right"] = const_387;
         param1["on_accommodate_align_center"] = const_673;
         param1["on_accommodate_align_top"] = const_839;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_640;
         param1["route_input_events_to_parent"] = const_379;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_893;
         param1["scalable_with_mouse"] = const_907;
         param1["reflect_horizontal_resize_to_parent"] = const_417;
         param1["reflect_vertical_resize_to_parent"] = const_363;
         param1["reflect_resize_to_parent"] = const_246;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
