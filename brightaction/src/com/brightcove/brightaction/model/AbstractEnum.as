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
package com.brightcove.brightaction.model {
    
    import com.brightcove.brightaction.utils.Logger;
    
    /**
     * Abstract Class sharing common Enum functionality
     *
     * @author amanning
     */
    public class AbstractEnum {
        
        /**
         * Given the value representation of the enum, return an enum that matches the value
         *
         * @param value the value to lookup
         * @param list  the list of enums to scan
         * @return      an enum that matches the value
         */
        public static function createFromValue(value:Object, list:Array):AbstractEnum {
            
            if (list == null || value == null || list.length < 1) {
                
                Logger.warn("List is empty or value is null", AbstractEnum);
                return null;
                
            }
            
            for each (var enum:AbstractEnum in list) {
                
                if (enum.value == value) {
                    return enum;
                }
                
            }
            
            return null;
        
        }
        
        /** Value for enum */
        private var _value:Object;
        
        public function get value():Object {
            
            if (_valueInLower) {
                return (_value as String).toLowerCase();
            }
            
            return _value;
        }
        
        /** If set to true, the return all enum values in lowercase */
        private var _valueInLower:Object;
        
        /**
         * Return the string representation of the value
         *
         * @return  the string representation of the value
         */
        public function toString():String {
            
            return _value.toString();
        
        }
        
        /**
         * Class Constructor- initialize properties
         *
         * @param value         A unique key, or representation of the enum object
         * @param valueInLower  If set to true, the return all enum values in lowercase
         *
         */
        public function AbstractEnum(value:Object, valueInLower:Boolean = false) {
            
            _value = value;
            _valueInLower = valueInLower;
        
        }
    
    }

}
