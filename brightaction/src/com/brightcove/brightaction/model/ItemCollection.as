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
     * A Video Object, representing a Brightcove Video in the Media APIs.  Some values are mutable-
     * such that they can be updated and then sent via the write APIs for changing the value of the
     * Video in the Brightcove Service.  Other, read only values, are not mutable and so can't be
     * changed.
     *
     * @author amanning
     */
    public class ItemCollection {
        
        /**  The total number of videos in the collection. */
        private var _totalCount:Number;
        
        public function get totalCount():Number {
            return _totalCount;
        }

        public function set totalCount(totalCount:Number):void {
            _totalCount = totalCount;
        }

        /** The actual items that this collection contains. */
        private var _items:Array;
        
        public function get items():Array {
            return _items;
        }

        public function set items(items:Array):void {
            _items = items;
        }

        /** Which page of the results this ItemCollection represents. */
        private var _pageNumber:Number;
        
        public function get pageNumber():Number {
            return _pageNumber;
        }

        public function set pageNumber(pageNumber:Number):void {
            _pageNumber = pageNumber;
        }

        /** How many items a page consists of. */
        private var _pageSize:Number;
        
        public function get pageSize():Number {
            return _pageSize;
        }

        public function set pageSize(pageSize:Number):void {
            _pageSize = pageSize;
        }

        
    }
    
}