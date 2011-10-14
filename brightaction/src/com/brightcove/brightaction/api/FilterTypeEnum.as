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

    import com.brightcove.brightaction.model.AbstractEnum;
    import com.brightcove.brightaction.utils.Logger;
    
    /**
     * Specifies which categories of videos you would like returned. Valid filter values are 
     * PLAYABLE, UNSCHEDULED, INACTIVE, and DELETED.
     * 
     * @author amanning
     */
    public class FilterTypeEnum extends AbstractEnum {

        /** PLAYABLE - can be played.  They are active and scheduled. */
        public static const PLAYABLE:FilterTypeEnum = new FilterTypeEnum("PLAYABLE");

        /** UNSCHEDULED - Not currently scheduled to play */
        public static const UNSCHEDULED:FilterTypeEnum = new FilterTypeEnum("UNSCHEDULED");
        
        /** INACTIVE - Not active, and thus not playable */
        public static const INACTIVE:FilterTypeEnum = new FilterTypeEnum("INACTIVE");

        /** DELETED - Has been deleted in the system */
        public static const DELETED:FilterTypeEnum = new FilterTypeEnum("DELETED");

        /** 
         * Class Constructor- initialize properties
         * 
         * @param value     the text id representing the Enum
         */
        public function FilterTypeEnum(value:String) {
            
            super(value, true);
            
        }
        
    }

}
