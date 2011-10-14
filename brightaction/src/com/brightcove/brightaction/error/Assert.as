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
package com.brightcove.brightaction.error {

    import com.brightcove.brightaction.utils.StringUtils;
    
    /**
     * An Assertion that checks a condition and throws an AssertionError if the condition is false
     * 
     * @author amanning
     */
    public class Assert {

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        /**
         * Given a condition, throw an AssertionError if the condition is false
         * 
         * @param condition     the condition to check
         * @param failedMessage the message to include in the assertion error if the condition fails
         */ 
        public static function isTrue(condition:Boolean, message:String = ''):void {
            
            if(!condition) {
                
                throw new AssertionError(message);
            
            }   

        }

        /**
         * Given an object, throw an AssertionError if the object is null
         * 
         * @param condition     the condition to check
         * @param failedMessage the message to include in the assertion error if the condition fails
         */ 
        public static function notNull(value:Object, message:String = ''):void {
            
            Assert.isTrue(value != null, message);            
        
        }

        /**
         * Given a condition, throw an AssertionError if the param is null or has no length
         * 
         * @param condition     the condition to check
         * @param failedMessage the message to include in the assertion error if the condition fails
         */ 
        public static function notEmpty(value:Object, message:String = ''):void {
            
            notNull(value, message);
            isTrue(value.hasOwnProperty("length"));

            if(value is String) { value = StringUtils.trim((value as String)); }
            
            isTrue(value.length > 0);
            
        }

    }

}