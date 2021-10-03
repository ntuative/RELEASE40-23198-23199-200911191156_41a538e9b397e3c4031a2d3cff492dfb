package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_586:IAssetLoader;
      
      private var var_1081:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1081 = param1;
         var_586 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_586;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_586 != null)
            {
               if(true)
               {
                  var_586.dispose();
                  var_586 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1081;
      }
   }
}
