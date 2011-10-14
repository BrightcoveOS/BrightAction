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
 
    /**
     * An enumeration modeling the different types of Media Requests
     * 
     * @author amanning
     */
    public class MediaRequestType {

        /** The URL parameter expected by the Brightcove Media APIs */
        private var _value:String;
        
        /** Return a string representation of this type */
        public function toString():String {
        
            return _value;
        
        }

        public static const FIND_ALL_VIDEOS:MediaRequestType = 
            new MediaRequestType("find_all_videos");

        public static const SEARCH_VIDEOS:MediaRequestType = new MediaRequestType("search_videos");

        public static const FIND_VIDEO_BY_ID:MediaRequestType = 
            new MediaRequestType("find_video_by_id");

        public static const FIND_RELATED_VIDEOS:MediaRequestType = 
            new MediaRequestType("find_related_videos");

        public static const FIND_VIDEOS_BY_IDS:MediaRequestType = 
            new MediaRequestType("find_videos_by_ids");

        public static const FIND_VIDEO_BY_REFERENCE_ID:MediaRequestType = 
            new MediaRequestType("find_video_by_reference_id");

        public static const FIND_VIDEOS_BY_REFERENCE_IDS:MediaRequestType = 
            new MediaRequestType("find_videos_by_reference_ids");

        public static const FIND_VIDEOS_BY_USER_ID:MediaRequestType = 
            new MediaRequestType("find_videos_by_user_id");

        public static const FIND_VIDEOS_BY_CAMPAIGN_ID:MediaRequestType = 
            new MediaRequestType("find_videos_by_campaign_id");

        public static const FIND_MODIFIED_VIDEOS:MediaRequestType = 
            new MediaRequestType("find_modified_videos");

        public static const FIND_VIDEOS_BY_TEXT:MediaRequestType = 
            new MediaRequestType("find_videos_by_text");

        public static const FIND_VIDEOS_BY_TAGS:MediaRequestType = 
            new MediaRequestType("find_videos_by_tags");

        public static const FIND_VIDEO_BY_ID_UNFILTERED:MediaRequestType = 
            new MediaRequestType("find_video_by_id_unfiltered");

        public static const FIND_VIDEOS_BY_IDS_UNFILTERED:MediaRequestType = 
            new MediaRequestType("find_videos_by_ids_unfiltered");

        public static const FIND_VIDEO_BY_REFERENCE_ID_UNFILTERED:MediaRequestType = 
            new MediaRequestType("find_video_by_reference_id_unfiltered");
        
        public static const FIND_VIDEOS_BY_REFERENCE_IDS_UNFILTERED:MediaRequestType = 
            new MediaRequestType("find_videos_by_reference_ids_unfiltered");

        /**
         * Class constructor - initialize the string representation of this enum
         * 
         * @param value     The string representation of this enum
         */ 
        function MediaRequestType(value:String) {
        
            _value = value;
        
        }
        
    }   

}