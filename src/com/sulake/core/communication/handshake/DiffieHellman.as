package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1340:BigInteger;
      
      private var var_941:BigInteger;
      
      private var var_1699:BigInteger;
      
      private var var_1341:BigInteger;
      
      private var var_1697:BigInteger;
      
      private var var_1698:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1340 = param1;
         var_1699 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1697.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1341 = new BigInteger();
         var_1341.fromRadix(param1,param2);
         var_1697 = var_1341.modPow(var_941,var_1340);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1698.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_941 = new BigInteger();
         var_941.fromRadix(param1,param2);
         var_1698 = var_1699.modPow(var_941,var_1340);
         return true;
      }
   }
}
