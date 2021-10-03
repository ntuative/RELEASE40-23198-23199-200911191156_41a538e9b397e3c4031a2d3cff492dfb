package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_692:int = 8;
      
      public static const const_1439:int = 10;
      
      public static const const_1271:int = 6;
      
      private static var var_905:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1209:int = 0;
      
      public static const const_1503:int = 1;
      
      public static const const_1473:int = 2;
      
      public static const const_1397:int = 3;
      
      public static const const_1414:int = 4;
      
      public static const const_1472:int = 5;
      
      public static const const_1508:int = 9;
      
      public static const const_1524:int = 7;
       
      
      private var var_169:uint = 0;
      
      private var var_904:uint = 0;
      
      private var var_611:Date;
      
      private var var_1712:int = -1;
      
      private var parseFunc:Function;
      
      private var var_439:Boolean = false;
      
      private var var_2164:int = -1;
      
      private var var_1107:uint = 0;
      
      private var var_1714:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_735:uint;
      
      private var var_33:ByteArray;
      
      private var var_609:uint;
      
      private var var_1348:Boolean = false;
      
      private var var_2163:int = -1;
      
      private var var_1346:String = "2.0";
      
      private var var_170:Boolean = false;
      
      private var var_1713:Boolean = false;
      
      private var var_320:String;
      
      private var var_519:uint = 0;
      
      private var var_1106:int = 0;
      
      private var var_365:String = "";
      
      private var var_610:int = 8;
      
      private var var_1347:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_320 = param1;
         _extraFields = new Dictionary();
         var_33 = new ByteArray();
         var_33.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_519;
      }
      
      public function set filename(param1:String) : void
      {
         var_365 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_170 && false)
         {
            var_33.position = 0;
            if(var_905)
            {
               var_33.uncompress.apply(var_33,["deflate"]);
            }
            else
            {
               var_33.uncompress();
            }
            var_33.position = 0;
            var_170 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_365;
      }
      
      public function get date() : Date
      {
         return var_611;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1347)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_169 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_169)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1346;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_170)
         {
            uncompress();
         }
         var_33.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_33.readUTFBytes(var_33.bytesAvailable);
         }
         else
         {
            _loc3_ = var_33.readMultiByte(var_33.bytesAvailable,param2);
         }
         var_33.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_610 === const_692 && !var_1348)
         {
            if(var_905)
            {
               param1.readBytes(var_33,0,var_169);
            }
            else
            {
               if(!var_439)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_33.writeByte(120);
               _loc2_ = uint(~var_1712 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_33.writeByte(_loc2_);
               param1.readBytes(var_33,2,var_169);
               var_33.position = var_33.length;
               var_33.writeUnsignedInt(var_735);
            }
            var_170 = true;
         }
         else
         {
            if(var_610 != const_1209)
            {
               throw new Error("Compression method " + var_610 + " is not supported.");
            }
            param1.readBytes(var_33,0,var_169);
            var_170 = false;
         }
         var_33.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_904 + var_1107 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_33.length = 0;
         var_33.position = 0;
         var_170 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_33.writeUTFBytes(param1);
            }
            else
            {
               var_33.writeMultiByte(param1,param2);
            }
            var_609 = ChecksumUtil.CRC32(var_33);
            var_439 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_611 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1106 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1106 << 8 | 20);
         param1.writeShort(var_320 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_692);
         var _loc5_:Date = var_611 != null ? var_611 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_609);
         param1.writeUnsignedInt(var_169);
         param1.writeUnsignedInt(var_519);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_320 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_365);
         }
         else
         {
            _loc8_.writeMultiByte(var_365,var_320);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_439)
            {
               _loc16_ = var_170;
               if(_loc16_)
               {
                  uncompress();
               }
               var_735 = ChecksumUtil.Adler32(var_33,0,var_33.length);
               var_439 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_735);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_320 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1714);
            }
            else
            {
               _loc8_.writeMultiByte(var_1714,var_320);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_169 > 0)
         {
            if(var_905)
            {
               _loc13_ = 0;
               param1.writeBytes(var_33,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_33,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_169;
      }
      
      protected function compress() : void
      {
         if(!var_170)
         {
            if(false)
            {
               var_33.position = 0;
               var_519 = var_33.length;
               if(var_905)
               {
                  var_33.compress.apply(var_33,["deflate"]);
                  var_169 = var_33.length;
               }
               else
               {
                  var_33.compress();
                  var_169 = -6;
               }
               var_33.position = 0;
               var_170 = true;
            }
            else
            {
               var_169 = 0;
               var_519 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_904 + var_1107)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_320 == "utf-8")
         {
            var_365 = param1.readUTFBytes(var_904);
         }
         else
         {
            var_365 = param1.readMultiByte(var_904,var_320);
         }
         var _loc2_:uint = var_1107;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_365 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_735 = param1.readUnsignedInt();
               var_439 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1106 = _loc2_ >> 8;
         var_1346 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_610 = param1.readUnsignedShort();
         var_1348 = (_loc3_ & 1) !== 0;
         var_1347 = (_loc3_ & 8) !== 0;
         var_1713 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_320 = "utf-8";
         }
         if(var_610 === const_1271)
         {
            var_2163 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2164 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_610 === const_692)
         {
            var_1712 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_611 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_609 = param1.readUnsignedInt();
         var_169 = param1.readUnsignedInt();
         var_519 = param1.readUnsignedInt();
         var_904 = param1.readUnsignedShort();
         var_1107 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_33,0,param1.length);
            var_609 = ChecksumUtil.CRC32(var_33);
            var_439 = false;
         }
         else
         {
            var_33.length = 0;
            var_33.position = 0;
            var_170 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_365 + "\n  date:" + var_611 + "\n  sizeCompressed:" + var_169 + "\n  sizeUncompressed:" + var_519 + "\n  versionHost:" + var_1106 + "\n  versionNumber:" + var_1346 + "\n  compressionMethod:" + var_610 + "\n  encrypted:" + var_1348 + "\n  hasDataDescriptor:" + var_1347 + "\n  hasCompressedPatchedData:" + var_1713 + "\n  filenameEncoding:" + var_320 + "\n  crc32:" + var_609.toString(16) + "\n  adler32:" + var_735.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_170)
         {
            uncompress();
         }
         return var_33;
      }
   }
}
