package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   
   public class OfficialRoomImageLoader implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_671:IBitmapWrapperWindow;
      
      private var var_855:String;
      
      private var var_814:String;
      
      private var _navigator:HabboNavigator;
      
      public function OfficialRoomImageLoader(param1:HabboNavigator, param2:String, param3:IBitmapWrapperWindow)
      {
         super();
         _navigator = param1;
         var_814 = param2;
         var_671 = param3;
         var _loc4_:String = _navigator.configuration.getKey("image.library.url");
         var_855 = _loc4_ + var_814;
         Logger.log("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + var_855);
      }
      
      private function onLoadError(param1:AssetLoaderEvent) : void
      {
         Logger.log("Error loading image: " + var_855 + ", " + param1);
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_671 = null;
         _navigator = null;
      }
      
      private function onImageReady(param1:AssetLoaderEvent) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            Logger.log("Loading pic from url: " + var_855 + " failed. loaderStruct == null");
            return;
         }
         Logger.log("IMAGE READY: " + var_814 + ", " + _loc2_);
         setImage();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function startLoad() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.assets.hasAsset(var_814))
         {
            setImage();
         }
         else
         {
            _loc1_ = new URLRequest(var_855);
            _loc2_ = _navigator.assets.loadAssetFromFile(var_814,_loc1_,"image/gif");
            _loc2_.addEventListener(AssetLoaderEvent.const_30,onImageReady);
            _loc2_.addEventListener(AssetLoaderEvent.const_43,onLoadError);
         }
      }
      
      private function setImage() : void
      {
         var _loc1_:BitmapData = _navigator.getButtonImage(var_814,"");
         var_671.bitmap = _loc1_;
         var_671.width = _loc1_.width;
         var_671.height = _loc1_.height;
         var_671.visible = true;
         dispose();
      }
   }
}
