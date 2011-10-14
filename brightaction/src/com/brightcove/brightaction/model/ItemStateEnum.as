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
    
    /**
     * An Enumeration of ItemStateEnum. One of ACTIVE, INACTIVE, or DELETED. You can set this 
     * property only to ACTIVE or INACTIVE; you cannot delete a video by setting its itemState to 
     * DELETED.
     * 
     * @author amanning
     */
    public class ItemStateEnum extends AbstractEnum {

        /** The Video is Active */
        public static const ACTIVE:ItemStateEnum = new ItemStateEnum("ACTIVE", true);
        
        /** The Video is Inactive */
        public static const INACTIVE:ItemStateEnum = new ItemStateEnum("INACTIVE", true);
        
        /** The Video is Deleted */
        public static const DELETED:ItemStateEnum = new ItemStateEnum("DELETED", false);

        /** A list of all available enum types, implemented by each sub-class for the lookup */
        private static const LIST:Array = [ACTIVE, INACTIVE, DELETED];
        
        /**
         * Given the value representation of the enum, return an enum that matches that value
         *
         * @param value the value to lookup
         *
         */
        public static function createFromValue(value:Object):ItemStateEnum {
            
            return (AbstractEnum.createFromValue(value, LIST) as ItemStateEnum);
            
        }

        /** 
         * Mutable, if set to true the this value can be updated, false otherwise it is just 
         * read-only.
         */ 
        private var _updateable:Boolean = false;
        
        public function get updateable():Boolean {
            return _updateable;
        }

        /** 
         * Class Constructor- initialize properties
         * 
         * @param value         the value of the 
         * @param updatable     if the property is mutable
         * 
         */
        public function ItemStateEnum(value:String, updatable:Boolean) {
            
            super(value);
            _updateable = updatable;
            
        }
                
    }

}
