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
     * The Rendition object represents one of the multi-bitrate streaming renditions of a video.
     *
     * @author amanning
     */
    public class Rendition {
        
        /** Given a list of generic Rendition Objects, return a list of typed Renditions */
        public static function createFromList(genericList:Array):Array {
            
            var result:Array = [];
            
            for each(var renditionObject:Object in genericList) {
                
                result.push(createFromObject(renditionObject));
                
            }
            
            return result;
            
        }
        
        /** 
         * Given an object representation of the Rendition, return a typed Rendition 
         * 
         * @param object    Object representation of a Rendition
         * @return          a typed Rendition
         */
        public static function createFromObject(object:Object):Rendition {
            
            if(object == null) { return null; }
            
            var result:Rendition = new Rendition(
                ObjectChecker.ifDefined(object, "url") as String,
                ObjectChecker.ifDefined(object, "audioOnly") as Boolean,
                CDNControllerTypeEnum.createFromValue(
                    ObjectChecker.ifDefined(object, "controllerType")),
                ObjectChecker.ifDefined(object, "encodingRate") as Number,
                ObjectChecker.ifDefined(object, "frameHeight") as Number,
                ObjectChecker.ifDefined(object, "frameWidth") as Number,
                ObjectChecker.ifDefined(object, "size") as Number,
                ObjectChecker.ifDefined(object, "id") as Number,
                ObjectChecker.ifDefined(object, "referenceId") as String,
                VideoCodecTypeEnum.createFromValue(
                    ObjectChecker.ifDefined(object, "videoCodec")),
                VideoContainerTypeEnum.createFromValue(
                    ObjectChecker.ifDefined(object, "videoContainer")),
                ObjectChecker.ifDefined(object, "videoDuration") as Number,
                ObjectChecker.ifDefined(object, "remoteStreamName") as String,
                ObjectChecker.ifDefined(object, "remoteUrl") as String,
                ObjectChecker.ifDefined(object, "uploadTimestampMillis") as Number,
                ObjectChecker.ifDefined(object, "displayName") as String);
                
            
            return result;
            
        }

        /** The URL of the rendition file. */
        private var _url:String;
        
        // Read Only
        public function get url():String {
            return _url;
        }
        
        /** 	
         * If true, this rendition is audio-only and has no video content. Audio-only 
         * renditions can be used for mobile streaming over low-bandwidth connections. It is 
         * recommended that videos in iOS applications should include a 64 kbps audio-only 
         * rendition. 
         */
        public function set audioOnly(value:Boolean):void {
            _audioOnly = value;
        }
        
        private var _audioOnly:Boolean;
        
        public function get audioOnly():Boolean {
            return _audioOnly;
        }
        
        /**
         * The value of the controllerType field in the Rendition object can depend on how you are 
         * delivering content and what CDN you are using.
         */
        private var _controllerType:CDNControllerTypeEnum;
        
        public function get controllerType():CDNControllerTypeEnum {
            return _controllerType;
        }
        
        public function set controllerType(controllerType:CDNControllerTypeEnum):void {
            _controllerType = controllerType;
        }
        
        /** The rendition's encoding rate, in bits per second. */
        private var _encodingRate:Number;
        
        public function get encodingRate():Number {
            return _encodingRate;
        }
        
        /** The rendition's display height, in pixels. */
        private var _frameHeight:Number;
        
        public function get frameHeight():Number {
            return _frameHeight;
        }
        
        /** The rendition's display width, in pixels. */
        private var _frameWidth:Number;
        
        public function get frameWidth():Number {
            return _frameWidth;
        }
        
        /** Required. The file size of the rendition, in bytes. */
        private var _size:Number;
        
        public function get size():Number {
            return _size;
        }
        
        /**
         * Required, for remote assets. The complete path to the file hosted on the remote server.
         * If the file is served using progressive download, then you must include the file name
         * and extension for the file. You can also use a URL that re-directs to a URL that
         * includes the file name and extension. If the file is served using Flash streaming, use
         * the remoteStreamName attribute to provide the stream name.
         */
        private var _remoteUrl:String;
        
        public function get remoteUrl():String {
            return _remoteUrl;
        }
        
        public function set remoteUrl(remoteUrl:String):void {
            _remoteUrl = remoteUrl;
        }
        
        /**
         * [Optional — required for streaming remote assets only] A stream name for Flash streaming
         * appended to the value of the remoteUrl property.
         */
        private var _remoteStreamName:String;
        
        public function get remoteStreamName():String {
            return _remoteStreamName;
        }
        
        public function set remoteStreamName(remoteStreamName:String):void {
            _remoteStreamName = remoteStreamName;
        }
        
        /** Required. Valid values are SORENSON, ON2, and H264. */
        private var _videoCodec:VideoCodecTypeEnum;
        
        public function get videoCodec():VideoCodecTypeEnum {
            return _videoCodec;
        }
        
        public function set videoCodec(videoCodec:VideoCodecTypeEnum):void {
            _videoCodec = videoCodec;
        }

        /** 
         * The format of the wrapper that provides metadata and describes how the video and audio 
         * are stored in the file. Valid values are FLV, MP4, and M2TS.
         */
        private var _videoContainer:VideoContainerTypeEnum;
        
        public function get videoContainer():VideoContainerTypeEnum {
            return _videoContainer;
        }
        
        public function set videoContainer(videoContainer:VideoContainerTypeEnum):void {
            _videoContainer = videoContainer;
        }

        /** The length of the remote video asset in milliseconds. */
        private var _videoDuration:Number;
        
        public function get videoDuration():Number {
            return _videoDuration;
        }
        
        public function set videoDuration(videoDuration:Number):void {
            _videoDuration = videoDuration;
        }
        
        /** The identifier for the Rendition */
        private var _id:Number;
        
        public function get id():Number {
            return _id;
        }
        
        /** The reference identifier for the Rendition */
        private var _referenceId:String;
        
        public function get referenceId():String {
            return _referenceId;
        }

        /** The timestamp of the upload as Millis */
        private var _uploadTimestampMillis:Number;
        
        public function get uploadTimestampMillis():Number {
            return _uploadTimestampMillis;
        }
        
        /** A display name for the rendition */
        private var _displayName:String;
        
        public function get displayName():String {
            return _displayName;
        }

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        /**
         * Class constructor, create an instance of a Cue Point.
         *
         * @param url                       The URL of the rendition file.
         * 
         * @param audioOnly                 If true, this rendition is audio-only and has no video 
         *                                  content. Audio-only renditions can be used for mobile 
         *                                  streaming over low-bandwidth connections. It is 
         *                                  recommended that videos in iOS applications should 
         *                                  include a 64 kbps audio-only rendition.
         *
         * @param controllerType            The value of the controllerType field in the Rendition 
         *                                  object can depend on how you are delivering content and 
         *                                  what CDN you are using.
         *
         * @param encodingRate              The rendition's encoding rate, in bits per second.
         *
         * @param frameHeight               The rendition's display height, in pixels.
         *
         * @param frameWidth                The rendition's display width, in pixels.
         *
         * @param size                      Required. The file size of the rendition, in bytes.
         * 
         * @param id                        The identifier for the Rendition
         * 
         * @param referenceId               The reference identifier for the Rendition
         * 
         * @param videoCodec                Required. Valid values are SORENSON, ON2, and H264.
         * @param videoDuration             The length of the remote video asset in milliseconds.
         * @param videoContainer            The format of the wrapper that provides metadata and 
         *                                  describes how the video and audio are stored in the 
         *                                  file. Valid values are FLV, MP4, and M2TS. 
         * 
         * @param remoteStreamName          [Optional — required for streaming remote assets only] A
         *                                  stream name for Flash streaming appended to the value of
         *                                  the remoteUrl property.
         *
         * @param remoteUrl                 Required, for remote assets. The complete path to the
         *                                  file hosted on the remote server. If the file is served
         *                                  using progressive download, then you must include the
         *                                  file name and extension for the file. You can also use a
         *                                  URL that re-directs to a URL that includes the file name
         *                                  and extension. If the file is served using Flash
         *                                  streaming, use the remoteStreamName attribute to provide
         *                                  the stream name.
         * @param uploadTimestampMillis     The timestamp of the upload as Millis
         * @param displayName               A display name for the rendition
         */
        public function Rendition(
            url:String,
            audioOnly:Boolean,
            controllerType:CDNControllerTypeEnum,
            encodingRate:Number,
            frameHeight:Number,
            frameWidth:Number,
            size:Number,
            id:Number,
            referenceId:String,
            videoCodec:VideoCodecTypeEnum,
            videoContainer:VideoContainerTypeEnum,
            videoDuration:Number = 0,
            remoteStreamName:String = "",
            remoteUrl:String = "",
            uploadTimestampMillis:Number = 0,
            displayName:String = "") {
            
            _url = url;
            _audioOnly = audioOnly;
            _controllerType = controllerType;
            _encodingRate = encodingRate;
            _frameHeight = frameHeight;
            _frameWidth = frameWidth;
            _size = size;
            _id = id;
            _referenceId = referenceId;
            _videoCodec = videoCodec;
            _videoContainer = videoContainer;
            _videoDuration = videoDuration;
            _remoteStreamName = remoteStreamName;
            _remoteUrl = remoteUrl;
            _uploadTimestampMillis = uploadTimestampMillis;
            _displayName = displayName;
        
        }
        
    }

}