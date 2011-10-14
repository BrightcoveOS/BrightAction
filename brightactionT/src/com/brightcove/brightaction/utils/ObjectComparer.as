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
    
    import mx.utils.ObjectUtil;
    
    /**
     * A utility object for comparing other objects
     *
     * @author amanning
     */
    public class ObjectComparer {

        /**
         * Return true if the first object has all the same property values as the second and is the
         * same type.
         *
         * @param object1   the first object to compare
         * @param object2   the second object to compare
         * @return          true if all properties have the same value and they are the same type
         */
        public function equals(object1:Object, object2:Object):Boolean {
            
            var result:Boolean = false;
            
            if (object1 == null && object2 == null) {
                return true;
            }
            
            
            if (getQualifiedClassName(object1) != getQualifiedClassName(object2)) {
                
                Logger.debug(
                    "classes don't match, name1: {0}, name2: {1}",
                    this,
                    getQualifiedClassName(object1),
                    getQualifiedClassName(object2));
                
                return false;
            }
            
            var compareResult:Number = ObjectUtil.compare(object1, object2);
            
            Logger.debug("compare result: {0}", this, true, compareResult);
            
            return (compareResult == 0);
        
        }
        
    }

}