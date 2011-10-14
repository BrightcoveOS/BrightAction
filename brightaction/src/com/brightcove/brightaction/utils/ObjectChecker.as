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
package com.brightcove.brightaction.utils {
    
    import com.adobe.serialization.json.JSON;
    
    import flash.utils.*;
    
    /**
     * A utility object for checking and comparing properties on objects
     *
     * @author amanning
     */
    public class ObjectChecker {

        /**
         * Return the properly on the object if it is defined, null otherwise
         * 
         * @param object    object that may contain property
         * @param property  the property name
         * @return          the value of the property if it exists, null otherwise
         */
        public static function ifDefined(object:Object, property:String):Object {
            
            if(object == null) { return null; }
            if(property == null || property.length < 1) { return null; }
            if(!object.hasOwnProperty(property)){ return null; }
            
            return object[property];
            
        }

    }

}