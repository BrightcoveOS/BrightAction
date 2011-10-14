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

    import com.brightcove.brightaction.utils.StringUtils;
    
    /**
     * A name-value pair for a particular search item
     *
     * @author amanning
     */
    public class SearchField {
        
        /** The field being searched */
        private var _field:SearchFieldsEnum;
        
        public function get field():SearchFieldsEnum {
            return _field;
        }
        
        private var _value:String = "";

        /** The value being searched */
        public function get value():String {
            return _value;
        }

        /** 
         * Class Constructor-  properties 
         * 
         * @param field     The field being searched
         * @param value     The value being searched
         */
        public function SearchField(field:SearchFieldsEnum, value:String) {
            
            _field = field;
            _value = value;
            
        }
        
        /** 
         * Return the name,value pair as a String
         * @return   the name,value pair as a String
         */
        public function toString():String {
        
            var result:String = "";

            result = StringUtils.substitute(
                "{0}:{1}", 
                (_field != null) ? _field.value : "", 
                _value);
            
            return result;
            
        }
    
    }

}
