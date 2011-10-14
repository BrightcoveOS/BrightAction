/**
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
package com.brightcove.brightaction.api {
 
    /**
     * An enumeration modeling the different types of Media Requests Errors
     * 
     * @author amanning
     */
    public class MediaRequestErrorType {

        //------------------------------------------------------------------------------------------
        // Member variables
        //------------------------------------------------------------------------------------------
        // Invalid Token was passed to the Media APIs
        public static const INVALID_TOKEN:MediaRequestErrorType = 
            MediaRequestErrorType.createAndRegister("INVALID_TOKEN", 210);

        // Request Validation Errors
        public static const VALIDATION_ERROR:MediaRequestErrorType = 
            MediaRequestErrorType.createAndRegister("VALIDATION_ERROR", 301);

        // Flash Communication Security Error
        public static const FLASH_SECURITY_ERROR:MediaRequestErrorType = 
            MediaRequestErrorType.createAndRegister("FLASH_SECURITY_ERROR");

        // IO Error, a problem with issuing the HTTP Get request to the media API
        public static const IO_ERROR:MediaRequestErrorType = 
            MediaRequestErrorType.createAndRegister("IO_ERROR");

        // Unknown Error, either not mapped into this wrapper API, or not invalid construction on 
        // the server
        public static const UNKNOWN_ERROR:MediaRequestErrorType = 
            MediaRequestErrorType.createAndRegister("UNKNOWN_ERROR");
        
        /** The toString value for the enum */
        private var _value:String;
        
        /** Return a string representation of this type */
        public function toString():String {
        
            return _value;
        
        }

        /** The error code associated with the error, if any */
        private var _code:Number;
        
        public function code():Number {
        
            return _code;
        
        }
        
        /** A lookup table for all of the codes, this gets initialized in the class constructor */
        private static var _codeLookupTable:Object;

        //------------------------------------------------------------------------------------------
        // Constructors
        //------------------------------------------------------------------------------------------
        /**
         * Class constructor - initialize the string representation of this enum
         * 
         * @param value     The string representation of this enum
         * @param code      An associated error code, if any
         */ 
        function MediaRequestErrorType(value:String,code:Number=-1) {
        
            _value = value;
            _code = code;
            
        }
        
        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        
        /**
         * Given a value and a code, create an error type and register it with the error lookup 
         * table
         * 
         * @param value     The string representation of this enum
         * @param code      An associated error code, if any
         * @return          Registered Media Request Error type
         */
        public static function createAndRegister(
                value:String,
                code:Number=-1):MediaRequestErrorType {
        
            var errorType:MediaRequestErrorType = new MediaRequestErrorType(value,code);
            
            if(_codeLookupTable == null) {
                _codeLookupTable = new Object();
            }
            
            if(errorType.code() != -1 && !_codeLookupTable.hasOwnProperty(code)) {

                _codeLookupTable[code] = errorType;
            
            }
            
            return errorType;
            
        }
        
        /**
         * Given an error code, return the corresponding ErrorType object, if it exists, or null 
         * otherwise
         * 
         * @param code  the error code to look up
         * @return      the corresponding ErrorType object, if it exists, or null otherwise
         */
        public static function getErrorForCode(code:Number):MediaRequestErrorType {
            
            if(_codeLookupTable.hasOwnProperty(code)) {
            
                return _codeLookupTable[code];
            
            }
 
            return null;
        
        }
    
    }   

}