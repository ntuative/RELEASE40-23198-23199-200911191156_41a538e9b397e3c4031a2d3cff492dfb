package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_849:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1259:Boolean = true;
      
      private var var_1121:int = 0;
      
      private var var_765:int = 0;
      
      private var var_1119:int = 0;
      
      private var var_766:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1120:int = 15;
      
      private var var_178:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1118:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1119 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1259)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_765,var_766);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1121;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_765 == 0 && var_766 == 0;
      }
      
      private function resetLog() : void
      {
         var_765 = 0;
         var_766 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1259)
         {
            return;
         }
         if(getTimer() - var_1119 > var_1118 * 1000 && var_1121 < var_1120)
         {
            var_1119 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1118 = int(var_178.getKey("lagwarninglog.interval","60"));
         var_1120 = int(var_178.getKey("lagwarninglog.reportlimit","15"));
         var_1259 = Boolean(int(var_178.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_766 += 1;
            case const_849:
               var_765 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
