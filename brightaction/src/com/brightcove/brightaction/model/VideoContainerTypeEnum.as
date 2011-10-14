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
     * The format of the wrapper that provides metadata and describes how the video and audio are 
     * stored in the file. Valid values are FLV, MP4, and M2TS. See Supported Video Codecs and 
     * Containers for more information.
     * 
     * @author amanning
     */
    public class VideoContainerTypeEnum extends AbstractEnum {
        
        /** Sorenson video codec */
        public static const FLV:VideoContainerTypeEnum = new VideoContainerTypeEnum("FLV");

        /** Sorenson video codec */
        public static const MP4:VideoContainerTypeEnum = new VideoContainerTypeEnum("MP4");

        /** Sorenson video codec */
        public static const M2TS:VideoContainerTypeEnum = new VideoContainerTypeEnum("M2TS");
         
        /** A list of all available enum types, implemented by each sub-class for the lookup */
        private static const LIST:Array = [FLV, MP4, M2TS];
        
        /**
         * Given the value representation of the enum, return an enum that matches that value
         *
         * @param value the value to lookup
         *
         */
        public static function createFromValue(value:Object):VideoContainerTypeEnum {
            
            return (AbstractEnum.createFromValue(value, LIST) as VideoContainerTypeEnum);
            
        }

        /** Class Constructor- initialize properties */
        function VideoContainerTypeEnum(value:String) {
            
            super(value);
            
        }
                
    }

}
