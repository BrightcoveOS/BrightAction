/**
 *
 * GNU General Public License v3
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.brightcove.brightaction.utils {
    
    import flash.utils.describeType;
    
    /**
     * Flash Log trace logging utility
     *
     * @author amanning
     */
    public class Logger {
        
        /** The label prepended to all BrightAction Log mesages */
        private static const PREPEND_LABEL:String = "BrightAction Log >> ";
        
        /** The types of messages to actually log- null or empty Array means logging is disabled */
        private static var _logLevelList:Array = [
            LogTypeEnum.ERROR, 
            LogTypeEnum.INFO, 
            LogTypeEnum.WARN, 
            LogTypeEnum.DEBUG];
        
        /** Return the current Log Level */
        public static function getLogLevel():Array {
            
            return _logLevelList;
        
        }
        
        /** Turn on all Log levels */
        public static function enableAllLogging():void {
            
            info("enableAllLogging");
            
            _logLevelList = [
                LogTypeEnum.ERROR, 
                LogTypeEnum.INFO, 
                LogTypeEnum.WARN, 
                LogTypeEnum.DEBUG];
        
        }
        
        /** Turn off all Log levels */
        public static function disableAllLogging():void {
            
            info("disableAllLogging");
            
            _logLevelList = [];
        
        }
        
        /**
         * Set testing log level
         *
         * @param levelList list of levels that should be logged
         */
        public static function setLogLevel(list:Array):void {
            
            info("setLogLevel");
            
            if (list == null) {
                _logLevelList = [];
            }

            for each (var level:Object in list) {
                
                debug(
                    "level to set: {0}, is LogTypeEnum: {1}", 
                    Logger, 
                    level, 
                    (level is LogTypeEnum));
               
                debug("level to set: {0}", Logger, level);
                
                if (!(level is LogTypeEnum)) {
                    throw new Error("Invalid Log Level");
                }
            }
            
            _logLevelList = list;
        
        }
        
        /**
         * Output the log.  Ignore if no length
         *
         * @param message   the message to log
         */
        private static function outputLog(message:String):void {
            
            if (message.length > 0) {
                trace(message);
            }
        
        }
        
        /**
         * Log trace string in an Debug condition
         *
         * @param log   the warn string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function debug(log:String, source:Object = null, ... rest):void {
            
            outputLog(buildLog(LogTypeEnum.DEBUG, log, source, rest));
        
        }
        
        /**
         * Log trace string in an Info condition
         *
         * @param log   the warn string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function info(log:String, source:Object = null, ... rest):void {
            
            outputLog(buildLog(LogTypeEnum.INFO, log, source, rest));
        
        }
        
        /**
         * Log trace string in an Warn condition
         *
         * @param log   the warn string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function warn(log:String, source:Object = null, ... rest):void {
            
            outputLog(buildLog(LogTypeEnum.WARN, log, source, rest));
        
        }
        
        /**
         * Log trace string in an Error condition
         *
         * @param log   the error string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function error(log:String, source:Object = null, ... rest):void {
            
            outputLog(buildLog(LogTypeEnum.ERROR, log, source, rest));
        
        }
        
        /**
         * Depending on the type of log, and the log itself, return the correct logging string
         *
         * @param type      the type of log message
         * @param message   the log message
         * @param source    the object logging this information, optional
         * @return          the complete string to be logged, depending on the log level- empty
         *                  string if this log level is not enabled
         */
        private static function buildLog(
            type:LogTypeEnum, 
            message:String, 
            source:Object = null,
            ... rest):String {
            
            var result:String = '';
            
            var clazz:String = "unknown";
            if (source != null) {
                var typeList:Array = describeType(source).@name.split("::");
                
                clazz = typeList[1];

            }
            
            if (_logLevelList == null) {
                return result;
            }
            
            if (_logLevelList.indexOf(type) != -1) {

                message = (rest.length == 1) ? StringUtils.substitute(message, rest[0]) : message;
                result = PREPEND_LABEL + "[" + type.value + "]" + "[" + clazz + "] " + message;
                
            }
            
            return result;
        
        }
        
        /**
         * Generate a Log trace string in an Error condition
         *
         * @param log       the error string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function buildError(log:String, source:Object = null, ... rest):String {
            
            return buildLog(LogTypeEnum.ERROR, log, source);
        
        }
        
        /**
         * Generate a Log trace string in an Warn condition
         *
         * @param log   the warn string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function buildWarn(log:String, source:Object = null, ... rest):String {
            
            return buildLog(LogTypeEnum.WARN, log, source);
        
        }
        
        /**
         * Generate a Log trace string in an Warn condition
         *
         * @param log   the warn string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function buildInfo(log:String, source:Object = null, ... rest):String {
            
            return buildLog(LogTypeEnum.INFO, log, source, rest);
        
        
        }
        
        /**
         * Generate a Log trace string in an Debug condition
         *
         * @param log   the debug string to log
         * @param source    the object logging this information, optional
         * @param rest      array of string replacement params
         */
        public static function buildDebug(log:String, source:Object = null, ... rest):String {
            
            return buildLog(LogTypeEnum.DEBUG, log, source, rest);
        
        }
    
    }

}