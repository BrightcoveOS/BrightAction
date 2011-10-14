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
     * An integer code corresponding to the type of cue point. One of 0 (AD), 1 (CODE), or 
     * 2 (CHAPTER). An AD cue point is used to trigger mid-roll ad requests. A CHAPTER cue point 
     * indicates a chapter or scene break in the video. A CODE cue point causes an event that you 
     * can listen for and respond to.
     * 
     * @author amanning
     */
    public class CuePointTypeEnum extends AbstractEnum {
        
        /**
         * Given the value representation of the enum, return an enum that matches that value
         *
         * @param value the value to lookup
         *
         */
        public static function createFromValue(value:Object):CuePointTypeEnum {
            
            return (AbstractEnum.createFromValue(value, LIST) as CuePointTypeEnum);
            
        }

        /** Ad cue point */
        public static const AD:CuePointTypeEnum = new CuePointTypeEnum(0);
         
        /** Code cue point */
        public static const CODE:CuePointTypeEnum = new CuePointTypeEnum(1);
        
        /** Chapter cue point */
        public static const CHAPTER:CuePointTypeEnum = new CuePointTypeEnum(2);

        /** A list of all available enum types, implemented by each sub-class for the lookup */
        private static const LIST:Array = [AD, CODE, CHAPTER];

        /** Class Constructor- initialize properties */
        public function CuePointTypeEnum(value:Number) {
            
            super(value);
            
        }
                
    }

}
