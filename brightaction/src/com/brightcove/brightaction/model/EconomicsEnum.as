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
     * A Enumeration of the types of economics associated with a BrightcoveVideo
     * 
     * @author amanning
     */
    public class EconomicsEnum extends AbstractEnum {
        
        /** Free with no Ads */
        public static const FREE:EconomicsEnum = new EconomicsEnum("FREE");
         
        /** Ad requests are enabled for this Video. */
        public static const AD_SUPPORTED:EconomicsEnum = new EconomicsEnum("AD_SUPPORTED");
        
        /** A list of all available enum types, implemented by each sub-class for the lookup */
        private static const LIST:Array = [FREE, AD_SUPPORTED];
        
        /**
         * Given the value representation of the enum, return an enum that matches that value
         *
         * @param value the value to lookup
         *
         */
        public static function createFromValue(value:Object):EconomicsEnum {
            
            return (AbstractEnum.createFromValue(value, EconomicsEnum.LIST) as EconomicsEnum);
            
        }

        /** Class Constructor- initialize properties */
        function EconomicsEnum(value:String) {
        
            super(value);
        
        }

    }

}
