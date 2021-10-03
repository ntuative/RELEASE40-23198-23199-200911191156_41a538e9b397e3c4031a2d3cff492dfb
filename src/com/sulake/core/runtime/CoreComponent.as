package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.exceptions.CrashMeError;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_147:uint = 3;
      
      private static const const_1056:String = "library";
      
      public static const const_1246:int = 6;
      
      private static const const_1054:String = "library";
      
      public static const const_1186:int = 99;
      
      private static const const_1052:String = "library";
      
      private static const const_1055:String = "zip-libraries";
      
      public static const const_1181:int = 10;
      
      public static const const_1253:int = 1;
      
      public static const const_1321:int = 2;
      
      public static const const_1294:int = 20;
      
      private static const const_1053:String = "library";
      
      private static const const_1051:String = "asset-libraries";
      
      public static const const_1193:int = 5;
      
      public static const const_1231:int = 30;
      
      public static const const_554:int = 4;
      
      public static const const_1219:int = 3;
      
      private static const const_1049:String = "service-libraries";
      
      private static const const_1050:String = "component-libraries";
       
      
      private var var_540:Number = 0;
      
      private var var_106:ICoreConfigStatusListener;
      
      private var var_386:uint;
      
      private var var_260:Array;
      
      private var var_257:uint;
      
      private var var_122:DisplayObjectContainer;
      
      private var var_777:Profiler;
      
      private var var_258:Array;
      
      private var var_228:Array;
      
      private var var_541:Array;
      
      private var var_645:Array;
      
      private var var_259:Array;
      
      private var var_646:ProfilerViewer;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_850 = (param2 & 0) != 0;
         var_541 = new Array();
         var_645 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_147)
         {
            var_541.push(new Array());
            var_645.push(0);
            _loc3_++;
         }
         var_386 = getTimer();
         attachComponent(this,[new IIDCore()]);
         var_122 = param1;
         switch(param2 & 0)
         {
            case Core.const_1314:
               debug("Core; using simple frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_918:
               debug("Core; using complex frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1176:
               debug("Core; using profiler frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_777 = new Profiler(this);
               attachComponent(var_777,[new IIDProfiler()]);
               var_646 = new ProfilerViewer();
               var_122.addChild(var_646);
         }
      }
      
      override public function removeUpdateReceiver(param1:ICoreUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_147)
         {
            _loc3_ = var_541[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_.splice(_loc2_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_849;
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param2)
         {
            if(param4 != null)
            {
               ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
            }
            ErrorReportStorage.setParameter("error_cat",String(param3));
            ErrorReportStorage.setParameter("error_desc",param1);
         }
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function updateConfigStatusListener() : void
      {
         var _loc1_:* = NaN;
         if(var_106)
         {
            _loc1_ = NaN;
            if(var_540 > 0)
            {
               _loc1_ += var_540 + var_228.length - 1;
            }
            else
            {
               _loc1_ += var_228.length;
            }
            var_106.percent = (Number(var_257) - _loc1_) / Number(var_257);
         }
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_386;
         var_386 = msCurrentTime;
         var_777.start();
         criticality = 0;
         while(criticality < CoreComponent.const_147)
         {
            var_645[criticality] = 0;
            receivers = var_541[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_777.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_777.stop();
         var_646.refresh(var_777);
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_386;
         var maxTimePerFrame:uint = 1000 / DisplayObject(var_122).stage.frameRate;
         var_386 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_147)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_645[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_645[criticality] = 0;
               receivers = var_541[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = ICoreUpdateReceiver(receivers[index]);
                  if(receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        if(var_850 && !(e is CrashMeError))
                        {
                           trace(e.getStackTrace());
                           throw e;
                        }
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_386;
         var_386 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_147)
         {
            var_645[criticality] = 0;
            receivers = var_541[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function loadExternalConfigDocument(param1:URLRequest, param2:ICoreConfigStatusListener = null) : void
      {
         if(var_106)
         {
            if(var_106 != param2)
            {
               var_106.dispose();
            }
         }
         if(param2)
         {
            var_106 = param2;
         }
         var _loc3_:AssetLoaderStruct = _assets.loadAssetFromFile("config.xml",param1);
         debug("Loading config document \"" + _loc3_.assetLoader.url + "\"");
         _loc3_.addEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc3_.addEventListener(AssetLoaderEvent.const_43,configLoadedHandler);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_122.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_122 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_147)
            {
               _loc2_ = var_541[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_228 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_228.pop();
               }
            }
            if(var_259 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_259.pop();
               }
            }
            if(var_260 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_260.pop();
               }
            }
            if(var_258 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_258.pop();
               }
            }
            if(var_646 != null)
            {
               var_646.dispose();
               var_646 = null;
            }
            if(var_106)
            {
               var_106.dispose();
               var_106 = null;
            }
            super.dispose();
         }
      }
      
      public function readConfigDocument(param1:XML, param2:ICoreConfigStatusListener = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_106)
         {
            if(var_106 != param2)
            {
               var_106.dispose();
            }
         }
         if(param2)
         {
            var_106 = param2;
         }
         debug("Parsing config document");
         if(var_228 == null)
         {
            var_228 = new Array();
         }
         _loc3_ = param1.child(const_1055)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1056);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_228.push(_loc6_);
               ++var_257;
            }
         }
         if(var_259 == null)
         {
            var_259 = new Array();
         }
         _loc3_ = param1.child(const_1051)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1054);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_259.push(_loc6_);
               ++var_257;
            }
         }
         if(var_260 == null)
         {
            var_260 = new Array();
         }
         _loc3_ = param1.child(const_1049)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1053);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_260.push(_loc6_);
               ++var_257;
            }
         }
         if(var_258 == null)
         {
            var_258 = new Array();
         }
         _loc3_ = param1.child(const_1050)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1052);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_258.push(_loc6_);
               ++var_257;
            }
         }
         if(var_106)
         {
            var_106.percent = 0;
         }
         updateLoadingProcess();
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_228[0] == _loc3_)
                  {
                     var_540 = 0;
                     var_228.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_259[0] == _loc3_)
                  {
                     var_259.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_260[0] == _loc3_)
                  {
                     var_260.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_258[0] == _loc3_)
                  {
                     var_258.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_228.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               debug("Loading zip library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_259.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               var_540 = 1;
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading asset library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_260.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading service library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_258.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading component library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(var_106)
         {
            var_106.complete();
         }
         debug("All libraries loaded, Core is now running");
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\": " + _loc2_.getLastErrorMessage(),true,const_1321);
         updateLoadingProcess(param1);
      }
      
      private function updateArchiveLoadingItemProgress(param1:ProgressEvent) : void
      {
         var_540 = 1 - param1.bytesLoaded / param1.bytesTotal;
         if(var_540 > 0)
         {
            updateConfigStatusListener();
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2123;
      }
      
      override public function registerUpdateReceiver(param1:ICoreUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_147 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_541[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_43,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_30)
         {
            debug("Config document \"" + _loc2_.assetLoader.url + "\" loaded");
            _loc3_ = _assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            readConfigDocument(_loc4_,var_106);
         }
         else
         {
            error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,const_1253);
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      public function get root() : DisplayObjectContainer
      {
         return var_122;
      }
   }
}
