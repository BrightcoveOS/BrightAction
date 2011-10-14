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
     * The result data from a media request, either a 
     *
     * @author amanning
     */
    public class MediaResponse {
        
        /**  The error data, if any, resulting from the Media Request */
        private var _error:Object;
        
        public function get error():Object {
            return _error;
        }

        /** The resulting Item Collection */
        private var _itemCollection:ItemCollection;
        
        public function get itemCollection():ItemCollection {
            return _itemCollection;
        }
        
        /**
         * Class constructor 
         * 
         * @param itemCollection    The resulting Item Collection 
         * @param error             The error data, if any, resulting from the Media Request
         */
        function MediaResponse(error:Object, itemCollection:ItemCollection) {
            
            _error = error;
            _itemCollection = itemCollection;
        
        
        }

    }
    
}