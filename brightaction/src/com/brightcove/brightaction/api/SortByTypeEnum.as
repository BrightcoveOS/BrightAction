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
     * The field by which to sort the results. A SortByType: One of PUBLISH_DATE, CREATION_DATE, 
     * MODIFIED_DATE, PLAYS_TOTAL, PLAYS_TRAILING_WEEK
     * 
     * @author amanning
     */
    public class SortByTypeEnum extends AbstractEnum {

        /** Date title was published. */
        public static const PUBLISH_DATE:SortByTypeEnum = new SortByTypeEnum("PUBLISH_DATE");
        
        /** Date title was created. */
        public static const CREATION_DATE:SortByTypeEnum = new SortByTypeEnum("CREATION_DATE");

        /* Date title was last modified. */
        public static const MODIFIED_DATE:SortByTypeEnum = new SortByTypeEnum("MODIFIED_DATE");
        
        /** Number of times this title has been viewed. */
        public static const PLAYS_TOTAL:SortByTypeEnum = new SortByTypeEnum("PLAYS_TOTAL");
        
        /** Number of times this title has been viewed in the past 7 days (excluding today) */
        public static const PLAYS_TRAILING_WEEK:SortByTypeEnum = 
            new SortByTypeEnum("PLAYS_TRAILING_WEEK");
        
        /** 
         * Class Constructor- initialize properties
         * 
         * @param value     the text id representing the Enum, will be sent via the API request
         *                  in lowercase
         */
        public function SortByTypeEnum(value:String) {
            
            super(value, true);
            
        }
        

    }

}
