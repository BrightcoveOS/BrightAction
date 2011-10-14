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
    public class BCVideo {

        // Read Only
        /** 
         * A number that uniquely identifies this Video, assigned by Brightcove when the Video is 
         * created.
         */
        private var _id:Number;
        
        public function get id():Number {
            return _id;
        }

        /**
         * A number, assigned by Brightcove, that uniquely identifies the account to which this 
         * Video belongs.
         */
        private var _accountId:Number;

        public function get accountId():Number {
            return _accountId;
        }
        
        // TODO provide some convience methods for turning this into a more readable form
        /** The length of this video in milliseconds. */
        private var _length:Number;
        
        public function get length():Number {
            return _length;
        }
        
        /** The date this Video was last made active */
        private var _publishedDate:Date;
        
        public function get publishedDate():Date {
            return _publishedDate;
        }
        
        /** The date this Video was last modified */
        private var _lastModifiedDate:Date;
        
        public function get lastModifiedDate():Date {
            return _lastModifiedDate;
        }
        
        /** The URL to the video still image associated with this Video. */
        private var _videoStillURL:String;
        
        public function get videoStillURL():String {
            return _videoStillURL;
        }        

        /** The URL to the thumbnail image associated with this Video. */
        private var _thumbnailURL:String;

        public function get thumbnailURL():String {
            return _thumbnailURL;
        }

        /** 
         * The URL of the video file for this Video. Note that this property can be accessed with 
         * the Media API only with a special read or write token.
         */
        private var _FLVURL:String;
        
        public function get FLVURL():String {
            return _FLVURL;
        }

        /** 
         * A single Rendition  that represents the the video file for this Video. Note that this 
         * property can be accessed with the Media API only with a special read or write token.
         */ 
        private var _videoFullLength:String;

        public function get videoFullLength():String {
            return _videoFullLength;
        }
                
        // Mutable Properties
        /** 
         * The title of this Video, limited to 255 characters. The name is a required property when
         * you create a video.
         */
        private var _name:String;
        
        public function get name():String {
            return _name;
        }
        
        public function set name(name:String):void {
            _name = name;
        }
        
        /** 
         * A short description describing this Video, limited to 250 characters. The 
         * shortDescription is a required property when you create a video.
         */
        private var _shortDescription:String;
        
        public function get shortDescription():String {
            return _shortDescription;
        }
        
        public function set shortDescription(shortDescription:String):void {
            _shortDescription = shortDescription;
        }

        /** A longer description of this Video, limited to 5000 characters. */
        private var _longDescription:String;
        
        public function get longDescription():String {
            return _longDescription;
        }
        
        public function set longDescription(longDescription:String):void {
            _longDescription = longDescription;
        }

        /** 
         * The date this Video was created, represented as the number of milliseconds since the 
         * UNIX epoch. 
         */
        private var _creationDate:Date;
        
        public function get creationDate():Date {
            return _creationDate;
        }

        /** The first date this Video is available to be played */
        private var _startDate:Date;
        
        public function get startDate():Date {
            return _startDate;
        }
        
        /** The last date this Video is available to be played. */
        private var _endDate:Date;
        
        public function get endDate():Date {
            return _endDate;
        }
        
        public function set endDate(endDate:Date):void {
            _endDate = endDate;
        }
        
        /** An optional URL to a related item, limited to 255 characters. */
        private var _linkURL:String;
        
        public function get linkURL():String {
            return _linkURL;
        }
        
        public function set linkURL(linkURL:String):void {
            _linkURL = linkURL;
        }
        
        /** The text displayed for the linkURL, limited to 255 characters. */
        private var _linkText:String;
        
        public function get linkText():String {
            return _linkText;
        }
        
        public function set linkText(linkText:String):void {
            _linkText = linkText;
        }
        
        /** 
         * A list of Strings representing the tags assigned to this Video. Each tag can be not more 
         * than 64 characters, and a video can have no more than 1200 tags. 
         */
        // TODO Consider providing an Iterator version of this as well
        private var _tags:Array;
        
        public function get tags():Array {
            return _tags;    
        }
        
        public function set tags(tags:Array):void {
            _tags = tags;
        }
        
        /** 
         * A user-specified id that uniquely identifies this Video, limited to 150 characters. A 
         * referenceId can be used as a foreign-key to identify this video in another system. Note 
         * that the find_videos_by_reference_ids method cannot handle referenceIds that contain 
         * commas, so you may want to avoid using commas in referenceId values.
         */
        private var _referenceId:String;
        
        public function get referenceId():String {
            return _referenceId;
        }
        
        public function set referenceId(referenceId:String):void {
            _referenceId = referenceId;
        }
        
        /** 
         * An EconomicsEnum. Either FREE or AD_SUPPORTED. AD_SUPPORTED means that ad requests are 
         * enabled for this Video.
         */
        private var _economics:EconomicsEnum;
        
        public function get economics():EconomicsEnum {
            return _economics;
        }

        public function set economics(economics:EconomicsEnum):void {
            _economics = economics;
        }
        
        /** 
         * An ItemStateEnum. One of ACTIVE, INACTIVE, or DELETED. You can set this property only to 
         * ACTIVE or INACTIVE; you cannot delete a video by setting its itemState to DELETED.
         */
        private var _itemState:ItemStateEnum;

        public function get itemState():ItemStateEnum {
            return _itemState;
        }

        public function set itemState(itemState:ItemStateEnum):void {
            _itemState = itemState;
        }
        
        // Read Only Properties        
        /** How many times this Video has been played since its creation. */
        private var _playsTotal:Number;
        
        public function get playsTotal():Number {
            return _playsTotal;
        }
        
        /** 
         * How many times this Video has been played within the past seven days, 
         * exclusive of today. 
         */
        private var _playsTrailingWeek:Number;

        public function get playsTrailingWeek():Number {
            return _playsTrailingWeek;
        }
        
        /** A List of the CuePoints  objects assigned to this Video. */
        private var _cuePoints:Array;
        
        public function get cuePoints():Array {
            return _cuePoints;
        }
        
        /** A map of names and values for custom fields set up for videos in your account. */
        private var _customFields:Object;
        
        public function get customFields():Object {
            return _customFields;
        }
        
        /** 
         * An array of Renditions  that represent the multi-bitrate streaming renditions available 
         * for this Video. A Video should have not more than 10 Renditions. Note that this property 
         * can be accessed with the Media API only with a special read or write token.
         */
        private var _renditions:Array;
        
        public function get renditions():Array {
            return _renditions;
        }
        
        /** True indicates that the video is geo-restricted. */
        private var _geoRestricted:Boolean;
        
        public function get geoRestricted():Boolean {
            return _geoRestricted;
        }
        
        /** 
         * If true, the video can be viewed in all countries except those listed in 
         * geoFilteredCountries; if false, the video can be viewed only in the countries listed in 
         * geoFilteredCountries.
         */
        private var _geoFilterExclude:Boolean;

        public function get geoFilterExclude():Boolean {
            return _geoFilterExclude;
        }
        
        /**
         * A list of the ISO-3166 two-letter codes of the countries to enforce geo-restriction rules 
         * on. Use lowercase for the country codes.
         */ 
        private var _geoFilteredCountries:Array;

        public function get geoFilteredCountries():Array {
            return _geoFilteredCountries;
        }
        
    
        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        /**
         * Class constructor, create an instance of a Brightcove Video.  
         * 
         * All properties are optional so primiatives may be initialized with default primative 
         * initializers if the field has not be requested from the Media APIs.  For example, if 
         * the geoRestricted field is not requested, this value will default to the Boolean
         * default initializer of false- this does not mean that the video is not Geo Restricted.  
         * 
         * The developer is responsible for knowing which fields have been returned and using that
         * data accordingly.
         *
         * @param id                    A number that uniquely identifies this Video, assigned by 
         *                              Brightcove when the Video is created.
         * 
         * @param accountId             A number, assigned by Brightcove, that uniquely identifies 
         *                              the account to which this Video belongs.
         * 
         * @param length                The length of this video in milliseconds.
         * 
         * @param publishedDate         The date this Video was last made active.
         * 
         * @param lastModifiedDate      The date this Video was last modified.
         * 
         * @param videoStillURL         The URL to the video still image associated with this Video.
         * 
         * @param thumbnailURL          The URL to the thumbnail image associated with this Video.
         * 
         * @param FLVURL                The URL of the video file for this Video. Note that this 
         *                              property can be accessed with the Media API only with a 
         *                              special read or write token.
         * 
         * @param videoFullLength       A single Rendition  that represents the the video file for 
         *                              this Video. Note that this property can be accessed with the 
         *                              Media API only with a special read or write token.
         * 
         * @param name                  The title of this Video, limited to 255 characters. The name 
         *                              is a required property when you create a video.
         * 
         * @param shortDescription      A short description describing this Video, limited to 250 
         *                              characters. The shortDescription is a required property when 
         *                              you create a video.
         * 
         * @param longDescription       A longer description of this Video, limited to 5000 
         *                              characters.
         * 
         * @param creationDate          The date this Video was created, represented as the number 
         *                              of milliseconds since the UNIX epoch.
         * 
         * @param startDate             The first date this Video is available to be played.
         * 
         * @param endDate               The last date this Video is available to be played.
         * 
         * @param linkURL               An optional URL to a related item, limited to 255 
         *                              characters.
         * 
         * @param linkText              The text displayed for the linkURL, limited to 255 
         *                              characters.
         * 
         * @param tags                  A list of Strings representing the tags assigned to this 
         *                              Video. Each tag can be not more than 64 characters, and a 
         *                              video can have no more than 1200 tags. 
         * 
         * @param referenceId           A user-specified id that uniquely identifies this Video, 
         *                              limited to 150 characters.
         * 
         * @param economics             An EconomicsEnum. Either FREE or AD_SUPPORTED. AD_SUPPORTED 
         *                              means that ad requests are enabled for this Video.
         * 
         * @param itemState             An ItemStateEnum. One of ACTIVE, INACTIVE, or DELETED. You 
         *                              can set this property only to ACTIVE or INACTIVE; you cannot 
         *                              delete a video by setting its itemState to DELETED.
         * 
         * @param playsTotal            How many times this Video has been played since its 
         *                              creation.
         * 
         * @param playsTrailingWeek     How many times this Video has been played within the past 
         *                              seven days, exclusive of today. 
         * 
         * @param cuePoints             A List of the CuePoints  objects assigned to this Video.
         * 
         * @param customFields          A map of names and values for custom fields set up for 
         *                              videos in your account.
         * 
         * @param renditions            An array of Renditions  that represent the multi-bitrate 
         *                              streaming renditions available for this Video. A Video 
         *                              should have not more than 10 Renditions. Note that this 
         *                              property can be accessed with the Media API only with a 
         *                              special read or write token.
         * 
         * @param geoRestricted         True indicates that the video is geo-restricted.
         * 
         * @param geoFilterExclude      If true, the video can be viewed in all countries except 
         *                              those listed in geoFilteredCountries; if false, the video 
         *                              can be viewed only in the countries listed in 
         *                              geoFilteredCountries.
         * 
         * @param geoFilteredCountries  A list of the ISO-3166 two-letter codes of the countries to 
         *                              enforce geo-restriction rules on. Use lowercase for the 
         *                              country codes.
         */
        public function BCVideo(
                id:Number = NaN,
                accountId:Number = NaN,
                length:Number = NaN,
                publishedDate:Date = null,
                lastModifiedDate:Date = null,
                videoStillURL:String = null,
                thumbnailURL:String = null,
                FLVURL:String = null,
                videoFullLength:String = null,
                name:String = null,
                shortDescription:String = null,
                longDescription:String = null,
                creationDate:Date = null,
                startDate:Date = null,
                endDate:Date = null,
                linkURL:String = null,
                linkText:String = null,
                tags:Array = null,
                referenceId:String = null,
                economics:EconomicsEnum = null,
                itemState:ItemStateEnum = null,
                playsTotal:Number = NaN,
                playsTrailingWeek:Number = NaN,
                cuePoints:Array = null,
                customFields:Object = null,
                renditions:Array = null,
                geoRestricted:Boolean = false,
                geoFilterExclude:Boolean = false,
                geoFilteredCountries:Array = null) {

            _id = id;
            _accountId = accountId;
            _length = length;
            _creationDate = creationDate;
            _publishedDate = publishedDate;
            _lastModifiedDate = lastModifiedDate;
            _videoStillURL = videoStillURL;
            _thumbnailURL = thumbnailURL;
            _FLVURL = FLVURL;
            _videoFullLength = videoFullLength;
            _name = name;
            _shortDescription = shortDescription;
            _longDescription = longDescription;
            _startDate = startDate;
            _endDate = endDate;
            _linkURL = linkURL;
            _linkText = linkText;
            _tags = tags;
            _referenceId = referenceId;
            _economics = economics;
            _itemState = itemState;
            _playsTotal = playsTotal;
            _playsTrailingWeek = playsTrailingWeek;
            _cuePoints = cuePoints;
            _customFields = customFields;
            _renditions = renditions;
            _geoRestricted = geoRestricted;
            _geoFilterExclude = geoFilterExclude;
            _geoFilteredCountries = geoFilteredCountries;
    
        }
    
    }

}