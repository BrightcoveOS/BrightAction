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

    import com.brightcove.brightaction.utils.ObjectChecker;
    
    /**
     * The CuePoint object is a marker set at a precise time point in the duration of a video.
     * 
     * @author amanning
     */
    public class CuePoint {

        /** Given a list of generic Cue Point Objects, return a list of typed Cue Points */
        public static function createFromList(genericList:Array):Array {
            
            var result:Array = [];
            
            for each(var cueObject:Object in genericList) {
                
                result.push(createFromObject(cueObject));
                
            }
            
            return result;
            
        }
        
        /** 
         * Given an object representation of the CuePoint, return a typed CuePoint 
         * 
         * @param object    Object representation of a CuePoint
         * @return          a typed CuePoint
         */
        public static function createFromObject(object:Object):CuePoint {
            
            if(object == null) { return null; }
            
            var result:CuePoint = new CuePoint(
                ObjectChecker.ifDefined(object, "name") as String,
                CuePointTypeEnum.createFromValue(ObjectChecker.ifDefined(object, "type")),
                Number(ObjectChecker.ifDefined(object, "time")),
                ObjectChecker.ifDefined(object, "videoId") as Number,
                ObjectChecker.ifDefined(object, "forceStop"),
                ObjectChecker.ifDefined(object, "metaData") as String);
            
            return result;
            
        }
        
        /** Required. A name for the cue point, so that you can refer to it. */
        private var _name:String;
        
        public function get name():String {
            return _name;
        }
        
        public function set name(name:String):void {
            _name = name;
        }
        
        /** 
         * A comma-separated list of the ids of one or more videos that this cue point applies to. 
         */
        private var _videoId:Number;
        
        public function get videoId():Number {
            return _videoId;
        }
        
        public function set videoId(videoId:Number):void {
            _videoId = videoId;
        }

        /** 
         * Required. The time of the cue point, measured in milliseconds from the beginning of the 
         * video. 
         */
        private var _time:Number;
        
        public function get time():Number {
            return _time;
        }
        
        public function set time(time:Number):void {
            _time = time;
        }

        /** 
         * If true, the video stops playback at the cue point. This setting is valid only for AD 
         * type cue points.
         */
        private var _forceStop:Boolean;
        
        public function get forceStop():Boolean {
            return _forceStop;
        }
        
        public function set forceStop(forceStop:Boolean):void {
            _forceStop = forceStop;
        }

        /** 
         * Required. An integer code corresponding to the type of cue point. One of 0 (AD), 
         * 1 (CODE), or 2 (CHAPTER). An AD cue point is used to trigger mid-roll ad requests. A 
         * CHAPTER cue point indicates a chapter or scene break in the video. A CODE cue point 
         * causes an event that you can listen for and respond to.
         */
        private var _type:CuePointTypeEnum;
        
        public function get type():CuePointTypeEnum {
            return _type;
        }
        
        public function set type(type:CuePointTypeEnum):void {
            _type = type;
        }

        /** A string that can be passed along with a CODE cue point. */
        private var _metadata:String;
        
        public function get metadata():String {
            return _metadata;
        }
        
        public function set metadata(metadata:String):void {
            _metadata = metadata;
        }

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        /**
         * Class constructor, create an instance of a Cue Point.  
         *
         * @param name          Required. A name for the cue point, so that you can refer to it.
         * 
         * @param type          Required. An integer code corresponding to the type of cue point. 
         *                      One of 0 (AD), 1 (CODE), or 2 (CHAPTER). An AD cue point is used to 
         *                      trigger mid-roll ad requests. A CHAPTER cue point indicates a 
         *                      chapter or scene break in the video. A CODE cue point causes an 
         *                      event that you can listen for and respond to.
         * 
         * @param time          Required. The time of the cue point, measured in milliseconds from 
         *                      the beginning of the video.
         * 
         * @param videoId       A comma-separated list of the ids of one or more videos that this 
         *                      cue point applies to.
         * 
         * @param forceStop     If true, the video stops playback at the cue point. This setting is 
         *                      valid only for AD type cue points.
         * 
         * @param metadata      A string that can be passed along with a CODE cue point.
         */
        public function CuePoint(
                name:String,
                type:CuePointTypeEnum,
                time:Number,
                videoId:Number,
                forceStop:Boolean = false,
                metadata:String = "") {

            _name = name;
            _type = type;
            _time = time;
            _videoId = videoId;
            _forceStop = forceStop;
            _metadata = metadata;
    
        }
        
    }

}