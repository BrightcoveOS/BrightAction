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
     * An enumeration modeling the different types of Media Request error
     * 
     * @author amanning
     */
    public class MediaRequestError {

        //------------------------------------------------------------------------------------------
        // Member variables
        //------------------------------------------------------------------------------------------
        /** The type of error with the Media Request */
        private var _errorType:MediaRequestErrorType;
        
        public function errorType():MediaRequestErrorType {
        
            return _errorType;
        
        }

        /** Detailed information, if any, about the Error */
        private var _errorDetail:Object;
        
        public function errorDetail():Object {
        
            return _errorDetail;
        
        }

        //------------------------------------------------------------------------------------------
        // Constructors
        //------------------------------------------------------------------------------------------
        /**
         * Class constructor - initialize the string representation of this enum
         * 
         * @param errorType     The type of error with the Media Request
         * @param errorDetail   Detailed information, if any, about the Error
         * 
         */ 
        function MediaRequestError(errorType:MediaRequestErrorType, errorDetail:Object) {
        
            _errorType = errorType;
            _errorDetail = errorDetail;
        
        }

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        /**
         * Given a generic Brightcove Media API result object, return true if this result indicates
         * and error or fault
         */
        public static function hasError(result:Object):Boolean {
            
            var isError:Boolean = false;
            
            if(result.hasOwnProperty("error")) {
                if (result.error != null && result.error.length > 0) {
                    isError = true;
                }
            }            
            
            return isError;

        }
        
        /**
         * Given a server reponse object, if it is an error return a corresponding Media Request 
         * Error, null otherwise.  If the error is unknown, return an Unknown Error.
         * 
         * @param serverResponse    the generic media api server response
         * @return                  if a server error, return a typed Error Object, otherwise if not
         *                          an error return null
         */
        public static function createFromResponse(serverResponse:Object):MediaRequestError {
            
            if(!hasError(serverResponse)) {
                return null;
            }
            
            //TODO think about a look-up table here
            try {
            
                var code:Number = serverResponse.code;
                var error:MediaRequestErrorType = MediaRequestErrorType.getErrorForCode(code);
                
                if(error != null) {

                    return new MediaRequestError(error,serverResponse);                    
                
                } else {
                
                    //do nothing, fall out into an unknown error
                
                }
                            
            } catch (e:Error) {
                
                //do nothing, fall out into an unknown error
                 
            }
            
            //make generic error
            return new MediaRequestError(
                    MediaRequestErrorType.UNKNOWN_ERROR,
                    serverResponse);
        

        }

    }   

}