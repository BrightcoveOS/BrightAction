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
     * The set of Searchable fields that can be searched using the Media API
     * 
     * @author amanning
     */
    public class SearchFieldsEnum extends AbstractEnum {
        
        /** The Video Display Name - <code>displayName</code> in Video Object */
        public static const DISPLAY_NAME:SearchFieldsEnum = new SearchFieldsEnum("DISPLAY_NAME");

        /** The Reference ID - <code>referenceId</code> in Video Object */
        public static const REFERENCE_ID:SearchFieldsEnum = new SearchFieldsEnum("REFERENCE_ID");

        /** The Tag - <code>tag</code> in Video Object */
        public static const TAG:SearchFieldsEnum = new SearchFieldsEnum("TAG");

        /** The Custom Fields - <code>customFields</code> in Video Object */
        public static const CUSTOM_FIELDS:SearchFieldsEnum = new SearchFieldsEnum("CUSTOM_FIELDS");

        /** The Search Text - <code>searchText</code> in Video Object */
        public static const SEARCH_TEXT:SearchFieldsEnum = new SearchFieldsEnum("SEARCH_TEXT");

        /** Class Constructor-  properties */
        public function SearchFieldsEnum(value:String) {
            
            super(value, true);
            
        }
                
    }

}
