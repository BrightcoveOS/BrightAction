/**
 *
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
    
    import com.brightcove.brightaction.error.Assert;
    import com.brightcove.brightaction.model.MediaResponse;
    import com.brightcove.brightaction.serialization.Deserializer;
    import com.brightcove.brightaction.utils.Logger;
    
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    /**
     * A request to the Brightcove Media API
     *
     * @author amanning
     */
    public class MediaRequest extends EventDispatcher {
        
        /**
         * The name of the event dispatch when the media request has been executed and a result
         * has been populated
         */
        public static const RESULT_NAME:String = "MEDIA_REQUEST_RESULT";
        
        /**
         * The name of the event dispatch when the media request has been executed and a fault
         * has been processed
         */
        public static const FAULT_NAME:String = "MEDIA_REQUEST_FAULT";
        
        /** The URL for the media API */
        public static const API_URL:String = "http://api.brightcove.com/services/library";
        
        /** The Brightcove Media API read token */
        private var _readToken:String;
        
        public function get readToken():String {
            
            return _readToken;
        
        }
        
        /** Brightcove Media API fault, if request caused a fault */
        private var _error:MediaRequestError;
        
        public function get error():MediaRequestError {
            
            return _error;
        
        }
        
        /** Brightcove Media API result data, if request was successful */
        private var _resultData:Object;
        
        public function get resultData():Object {
            
            return _resultData;
        
        }
        
        /** If the JSON result data should be serialized into typed objects, false otherwise */
        private var _serializeResultData:Boolean = true;
        
        /** The object used to load URLs */
        private var _loader:URLLoader;
        
        /** The path to the brightcove api services */
        private var _apiPath:String;
        
        /**
         * Class constructor
         *
         * @param readToken     the Brightcove Media API read token
         * @param apiPath       an optional URL for invoking the media requests, the default is the
         *                      published media API path:
         *                      'http://api.brightcove.com/services/library'
         * @param serialize     If set to true, then the result data should be serialized from
         *                      generic JSON into strongly typed ActionScript objects
         */
        public function MediaRequest(
            readToken:String,
            serialize:Boolean = true,
            apiPath:String="http://api.brightcove.com/services/library") {
            
            
            Assert.notEmpty(readToken, "readToken can not be null");
            Assert.notEmpty(apiPath, "api path can not be empty string");
            
            Logger.debug("Media Request readToken: {0}, apiPath: {1}", this, readToken, apiPath);
            
            _readToken = readToken;
            _apiPath = apiPath;
            _serializeResultData = serialize;
        
        }
        
        /**
         * Find all videos in the Brightcove media library for this account. This method has the
         * limitation of returning only videos available for play, and does not include videos
         * marked as inactive, currently in the upload process, or outside the scheduled play time.
         * See Searching for Unavailable Videos with the Media API for information about solutions
         * to these limitations.
         *
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param sortBy           The field by which to sort the results. A SortByType: One of
         *                         PUBLISH_DATE, CREATION_DATE, MODIFIED_DATE, PLAYS_TOTAL,
         *                         PLAYS_TRAILING_WEEK.
         * @param sortOrder        How to order the results: ascending (ASC) or descending (DESC).
         * @param getItemCount     If true, also return how many total results there are.
         * @param fieldList        A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return             The request URL to the Brightcove Media APIs
         */
        public function findAllVideos(
            pageSize:Number = 100,
            pageNumber:Number = 0,
            sortBy:SortByTypeEnum = null,
            sortOrder:SortOrderTypeEnum = null,
            getItemCount:Boolean = false,
            fieldList:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                sortBy,
                sortOrder,
                getItemCount,
                fieldList,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_ALL_VIDEOS,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Searches videos according to the criteria provided by the user. The criteria are
         * constructed using field/value pairs specified in the command. Consider using the
         * search_videos method for video searches rather than using the other find_video read
         * methods. The search_videos method offers more flexible search and sorting options than
         * the find_video methods, and is especially more flexible than the find_videos_by_text and
         * find_videos_by_tags methods. For more examples of the search_videos method, see:
         * Searching for Videos with the Media API.
         *
         * @param all              Specifies the field:value pairs for search criteria that MUST be
         *                         present in the index in order to return a hit in the result set.
         *                         The format is fieldName:value. If the field's name is not
         *                         present, it is assumed to be displayName, shortDescription, and
         *                         longDescription.
         * @param any              Specifies the field:value pairs for search criteria AT LEAST ONE
         *                         of which must be present to return a hit in the result set. The
         *                         format is fieldName:value. If the field's name is not present,
         *                         it is assumed to be displayName, shortDescription, and
         *                         longDescription.
         * @param none             Specifies the field:value pairs for search criteria that MUST NOT
         *                         be present to return a hit in the result set. The format is
         *                         fieldName:value. If the field's name is not present, it is
         *                         assumed to be displayName, shortDescription, and longDescription.
         * @param sortBy           The field by which to sort the results. A SortByType: One of
         *                         PUBLISH_DATE, CREATION_DATE, MODIFIED_DATE, PLAYS_TOTAL,
         *                         PLAYS_TRAILING_WEEK.
         * @param exact            If true, disables fuzzy search and requires an exact match of
         *                         search terms. A fuzzy search does not require an exact match of
         *                         the indexed terms, but will return a hit for terms that are
         *                         closely related based on language-specific criteria. The fuzzy
         *                         search is available only if your account is based in the United
         *                         States.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function searchVideos(
            all:Array = null,
            any:Array = null,
            none:Array = null,
            sortBy:SortByTypeEnum = null,
            exact:Boolean = false,
            pageSize:Number = 100,
            pageNumber:Number = 0,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                sortBy,
                null,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            extendedParameters += arrayToList(all, "&all=");
            extendedParameters += arrayToList(any, "&any=");
            extendedParameters += arrayToList(none, "&none=");
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.SEARCH_VIDEOS,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Finds a single video with the specified ID. See Accessing Video Content with the Media
         * API for various examples of the find_video_by_id method.
         *
         * @param videoId          The ID of the video you would like to retrieve.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param isFiltered       If set to false, the 'unfiltered' version of this method will be
         *                         called, it also returns videos that are unscheduled, inactive, or
         *                         deleted
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideoById(
            videoId:Number,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            isFiltered:Boolean = true,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            Assert.notEmpty(videoId.toString(), "videoId is required");
            
            var extendedParameters:String = "&video_id=" + videoId.toString();
            
            extendedParameters += appendCommonVideoParameters(            
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                (isFiltered) ? 
                MediaRequestType.FIND_VIDEO_BY_ID: 
                MediaRequestType.FIND_VIDEO_BY_ID_UNFILTERED,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Finds videos related to the given video. Combines the name and short description of the
         * given video and searches for any partial matches in the name, short description, long
         * description, tags, and custom fields of all videos in the Brightcove media library for
         * this account. More precise ways of finding related videos include tagging your videos
         * by subject and using the find_videos_by_tags method to find videos that share the same
         * tags: or creating a playlist that includes videos that you know are related. Consider
         * using the search_videos method, which offers more flexible search and sorting options.
         *
         * @param videoId          The ID of the video you would like to retrieve.
         * @param referenceId      The publisher-assigned reference ID of the video we'd like
         *                         related videos for.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findRelatedVideos(
            videoId:Number = -1,
            referenceId:String = "",
            pageSize:Number = 100,
            pageNumber:Number = 0,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.isTrue(
                (videoId != -1 || referenceId.length > 0),
                "Must specify a Video ID or a Reference ID");
            
            if (videoId != -1) {
                extendedParameters += "&video_id=" + videoId.toString();
            }
            
            if (referenceId.length > 0) {
                extendedParameters += "&reference_id=" + referenceId.toString();
            }
            
            extendedParameters += appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                null,
                null,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_RELATED_VIDEOS,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Find multiple videos, given their IDs.
         *
         * @param videoIds         A comma-separated list of video IDs for the videos we want to retrieve in
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param isFiltered       If set to false, the 'unfiltered' version of this method will be
         *                         called, it also returns videos that are unscheduled, inactive, or
         *                         deleted
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideosByIds(
            videoIds:Array,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            isFiltered:Boolean = false,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.notEmpty(videoIds, "videoIds is required");
            
            extendedParameters += "&video_ids=" + videoIds.toString();
            
            extendedParameters += appendCommonVideoParameters(            
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                (isFiltered) ? 
                MediaRequestType.FIND_VIDEOS_BY_IDS :
                MediaRequestType.FIND_VIDEOS_BY_IDS_UNFILTERED,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Find a video based on its publisher-assigned reference ID.
         *
         * @param referenceId      The publisher-assigned reference ID for the video we're
         *                         searching for.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param isFiltered       If set to false, the 'unfiltered' version of this method will be
         *                         called, it also returns videos that are unscheduled, inactive, or
         *                         deleted
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideoByReferenceId(
            referenceId:String,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            isFiltered:Boolean = true,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            Assert.notEmpty(referenceId, "referenceId is required");
            
            var extendedParameters:String = "&reference_id=" + referenceId;
            
            extendedParameters += appendCommonVideoParameters(            
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                (isFiltered) ? 
                MediaRequestType.FIND_VIDEO_BY_REFERENCE_ID :
                MediaRequestType.FIND_VIDEO_BY_REFERENCE_ID_UNFILTERED,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Find multiple videos based on their publisher-assigned reference IDs.
         *
         * @param referenceIds     The list of reference IDs for the videos we'd like to retrieve.
         *                         This value is limited to 150 characters. The value cannot
         *                         contain commas to work around this issue, avoid using commas
         *                         in reference_id values.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param isFiltered       If set to false, the 'unfiltered' version of this method will be
         *                         called, it also returns videos that are unscheduled, inactive, or
         *                         deleted
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideosByReferenceIds(
            referenceIds:Array,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            isFiltered:Boolean = true,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.notEmpty(referenceIds, "referenceIds is required");
            
            extendedParameters += "&reference_ids=" + referenceIds.toString();
            
            extendedParameters += appendCommonVideoParameters(            
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                (isFiltered) ? MediaRequestType.FIND_VIDEOS_BY_REFERENCE_IDS :
                MediaRequestType.FIND_VIDEOS_BY_REFERENCE_IDS_UNFILTERED,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Retrieves the videos uploaded by the specified user id. This method can be used to find
         * videos submitted using the consumer-generated media (CGM) module.
         *
         * @param userId           The ID of the user whose videos we'd like to retrieve.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideosByUserId(
            userId:Number,
            pageSize:Number = 100,
            pageNumber:Number = 0,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.notEmpty(userId.toString(), "userId is required");
            
            extendedParameters += "&user_id=" + userId.toString();
            
            extendedParameters += appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                null,
                null,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_VIDEOS_BY_USER_ID,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Gets all the videos associated with the given campaign ID. Campaigns are a feature of
         * the consumer-generated media (CGM) module.
         *
         * @param campaignId       The ID of the campaign you'd like to fetch videos for.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideosByCampaignId(
            campaignId:Number,
            pageSize:Number = 100,
            pageNumber:Number = 0,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.notEmpty(campaignId.toString(), "campaignId is required");
            
            extendedParameters += "&campaign_id=" + campaignId.toString();
            
            extendedParameters += appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                null,
                null,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_VIDEOS_BY_CAMPAIGN_ID,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Gets all the videos that have been modified since the given time.
         *
         * @param fromDate         The date of the oldest Video which you would like returned.
         * @param filter           A list of FilterTypeEnums, specifying which categories of videos
         *                         you would like returned. Valid filter values are PLAYABLE,
         *                         UNSCHEDULED, INACTIVE, and DELETED.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param sortBy           The field by which to sort the results. A SortByType: One of
         *                         PUBLISH_DATE, CREATION_DATE, MODIFIED_DATE, PLAYS_TOTAL,
         *                         PLAYS_TRAILING_WEEK.
         * @param sortOrder        How to order the results: ascending (ASC) or descending (DESC).
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findModifiedVideos(
            fromDate:Date,
            filter:Array=null,
            pageSize:Number = 100,
            pageNumber:Number = 0,
            sortBy:SortByTypeEnum = null,
            sortOrder:SortOrderTypeEnum = null,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.notNull(fromDate, "fromDate is required");
            
            extendedParameters += "&from_date=" + fromDate.time.toString();
            
            extendedParameters += arrayToList(filter, "&filter=")
            
            extendedParameters += appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                sortBy,
                sortOrder,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_MODIFIED_VIDEOS,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Searches through all the videos in this account, and returns a collection of videos
         * whose name, short description, or long description contain a match for the specified
         * text. Unlike some other Read methods, this method does not provide parameters for
         * sorting the result set. The result set is sorted by relevance. Consider using the
         * search_videos method, which offers more flexible search and sorting options.  The
         * find_videos_by_text method returns substring matches – words from your search string
         * plus a wildcard (*) at the end; thus, if your search string is "war", the result set
         * will include results such as "warrior", "warfare", and "warbler." Substrings that don't
         * match the beginning of a word are not returned; thus, if your search string is "war",
         * the result set would not include results such as "swarthy" or "inward".
         *
         * @param text             The text we're searching for.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideosByText(
            text:String,
            pageSize:Number = 100,
            pageNumber:Number = 0,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            var extendedParameters:String = "";
            
            Assert.notEmpty(text, "text is required");
            extendedParameters += "&text=" + text;
            
            extendedParameters += appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                null,
                null,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_VIDEOS_BY_TEXT,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Performs a search on all the tags of the videos in this account, and returns a
         * collection of videos that contain the specified tags. Note that tags are not
         * case-sensitive. This method does not provide parameters for sorting the result set.
         * Consider using the search_videos method, which offers more flexible search and sorting
         * options.
         *
         * @param andTags          Limit the results to those that contain all of these tags.
         * @param orTags           Limit the results to those that contain at least one of these
         *                         tags.
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param getItemCount     If true, also return how many total results there are.
         * @param videoFields      A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         * @param executeRequest   If true (default), then execute this request, otherwise just
         *                         return the request URL.
         * @return                 The request URL to the Brightcove Media APIs
         */
        public function findVideosByTags(
            andTags:Array = null,
            orTags:Array = null,
            pageSize:Number = 100,
            pageNumber:Number = 0,
            getItemCount:Boolean = false,
            videoFields:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false,
            requestShouldBeExecuted:Boolean = true):String {
            
            Assert.isTrue(
                (andTags != null && andTags.length > 0) ||
                (orTags != null && orTags.length > 0),
                "either andTags or orTags must be populated");
            
            var extendedParameters:String = "";
            
            extendedParameters += arrayToList(andTags, "&and_tags=");
            extendedParameters += arrayToList(orTags, "&or_tags=");
            
            extendedParameters += appendCommonCollectionParameters(            
                pageSize,
                pageNumber,
                null,
                null,
                getItemCount,
                videoFields,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return executeRequest(
                extendedParameters, 
                MediaRequestType.FIND_VIDEOS_BY_TAGS,
                requestShouldBeExecuted);
        
        }
        
        /**
         * Given a type of search term list, return the correctly formatted URL parameter
         *
         * @param termList  a list of possible search terms, or null if none
         * @param paramName the name of the URL param
         * @return          correctly formatted URL parameter
         */
        private function arrayToList(termList:Array, paramName:String):String {
            
            if (termList == null || termList.length < 1) {
                return "";
            }
            
            var result:String = paramName;
            
            for (var i:Number = 0; i < termList.length; i++) {
                
                result += termList[i].toString();
                
                if (i < (termList.length - 1)) {
                    result += ',';
                }
                
            }
            
            return result;
        
        }
        
        /**
         * Given a request information, append on the  standard parameters based upon the values
         * submitted
         *
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param sortBy           The field by which to sort the results. A SortByType: One of
         *                         PUBLISH_DATE, CREATION_DATE, MODIFIED_DATE, PLAYS_TOTAL,
         *                         PLAYS_TRAILING_WEEK.
         * @param sortOrder        How to order the results: ascending (ASC) or descending (DESC).
         * @param getItemCount     If true, also return how many total results there are.
         * @param fieldList        A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         */
        private function appendCommonCollectionParameters(      
            pageSize:Number = 100,
            pageNumber:Number = 0,
            sortBy:SortByTypeEnum = null,
            sortOrder:SortOrderTypeEnum = null,
            getItemCount:Boolean = false,
            fieldList:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false):String {
            
            Assert.isTrue(pageSize <= 100, "the max page size is 100");
            Assert.isTrue(pageSize >= 1, "the min page size is 1");
            
            var result:String = "";
            
            result += "&page_size=" + pageSize;
            result += "&page_number=" + pageNumber;
            
            if (getItemCount) {
                result += '&get_item_count=true'
            }
            
            if (sortBy != null) {
                result += "&sort_by=" + sortBy.value;
            }
            
            if (sortOrder != null) {
                result += "&sort_order=" + sortOrder.value;
            }
            
            result += appendCommonVideoParameters(
                fieldList,
                customFields,
                mediaDelivery,
                output,
                allVideoFields);
            
            return result;
        
        }
        
        /**
         * Given a request information, append on the  standard parameters based upon the values
         * submitted
         *
         * @param pageSize         Number of items returned per page.
         * @param pageNumber       The zero-indexed number of the page to return.
         * @param sortBy           The field by which to sort the results. A SortByType: One of
         *                         PUBLISH_DATE, CREATION_DATE, MODIFIED_DATE, PLAYS_TOTAL,
         *                         PLAYS_TRAILING_WEEK.
         * @param sortOrder        How to order the results: ascending (ASC) or descending (DESC).
         * @param getItemCount     If true, also return how many total results there are.
         * @param fieldList        A list of the fields you wish to have populated
         *                         in the Videos contained in the returned object. If you omit this
         *                         parameter, the method returns the following fields of the video:
         *                         <code>id, name, shortDescription, longDescription, creationDate,
         *                         publishedDate , lastModifiedDate, linkURL, linkText, tags,
         *                         videoStillURL, thumbnailURL, referenceId, length, economics,
         *                         playsTotal, playsTrailingWeek.</code> If you use a token with URL
         *                         access, this method also returns <code>FLVURL, renditions,
         *                         FLVFullLength, videoFullLength</code>.
         * @param customFields     A comma-separated list of the custom fields you wish to have
         *                         populated in the videos contained in the returned object. If you
         *                         omit this parameter, no custom fields are returned, unless you
         *                         include the value customFields in the video_fields parameter.
         * @param mediaDelivery    This is a MediaDeliveryTypeEnum with a value of http, http_ios or
         *                         default. It is meaningful only if used together with the
         *                         video_fields=FLVURL, videoFullLength, or renditions parameters.
         *                         If universal delivery service is enabled for your account, set
         *                         this optional parameter to http to return video by HTTP, rather
         *                         than streaming. For Apple HTTP Live Streaming videos, set this
         *                         optional parameter to http_ios to return the HTTP URL of the
         *                         master index file as the videoFullLength parameter. For more
         *                         information, see Delivering Videos with Apple HTTP Live Streaming.
         * @param output           The default output is JSON, but you can get the output in XML,
         *                         using RSS or MRSS. Use the output argument with the read methods
         *                         to specify the format of the output. Valid values of the output
         *                         argument are: json (the default), mrss (RSS with Media RSS and
         *                         Brightcove extensions), and tm (for distribution through
         *                         TubeMogul OneLoad). See RSS Output from the Media API and
         *                         Creating Feeds for TubeMogul OneLoad with the Media API for code
         *                         examples.
         * @param allVideoFields   If set to true, all available Video Fields will be included false
         *                         otherwise
         */
        private function appendCommonVideoParameters(      
            fieldList:Array = null,
            customFields:Array = null,
            mediaDelivery:MediaDeliveryTypeEnum = null,
            output:OutputTypeEnum = null,
            allVideoFields:Boolean = false):String {
            
            var result:String = "";
            
            result += buildVideoFields(fieldList, allVideoFields);
            result += buildCustomFields(customFields);
            
            if (mediaDelivery != null) {
                result += "&media_delivery=" + mediaDelivery.value;
            }
            
            if (output != null) {
                result += "&output=" + output.value;
            }
            
            return result;
        
        }
        
        /**
         * Given a list of custom fields strings, return the formatted URL parameter to request
         * the tags in the Media API
         *
         * @param customTags     list of custom tag strings
         * @return               the formatted URL parameter
         */
        private function buildCustomFields(customFields:Array):String {
            
            var result:String = '';
            
            if (customFields != null && customFields.length > 0) {
                result += '&custom_fields=';
                
                for (var i:Number = 0; i < customFields.length; i++) {
                    
                    result += customFields[i];
                    
                    if (i < (customFields.length - 1)) {
                        result += ',';
                    }
                    
                }
                
            }
            
            return result;
        
        }
        
        /**
         * Given a field list, or the option to include all fields, return the correctly formatted
         * query string for specifing the Video Fields
         */
        private function buildVideoFields(fieldList:Array, allVideoFields:Boolean):String {
            
            var result:String = "";
            
            // check video fields
            if (allVideoFields) {
                
                result = "&video_fields=" + FieldsEnum.allToString();
                
            } else if (fieldList != null && fieldList.length > 0) {
                
                result = "&video_fields=" + FieldsEnum.listToString(fieldList);
                
            }
            
            return result;
        
        }
        
        /**
         * Execute the Brightcove Media API asynchronous request for the token based upon the given
         * Media Request type.
         *
         * If a result has been returned, populate this object with the result converted into native
         * AS3 objects, not JSON, and dispatch an event notifing listeners of this object that the
         * request has been completed.
         *
         * If a fault has been returned, store the fault in this object and dispatch a Fault event
         * notifying listeners that a fault has occured.
         *
         * @param  extendedParameters      Query arguments to be added to the path of the Media API
         *                                 request
         * @param  requestType             The type of request being executed, for example
         *                                 "Load All Videos"
         * @param  requestShouldBeExecuted If set to true, then contstruct and execute the request
         *                                 otherwise just construct and return the request URL
         * @return                         the request URL
         */
        public function executeRequest(
            extendedParameters:String,
            requestType:MediaRequestType,
            requestShouldBeExecuted:Boolean = true):String {
            
            // initilize existing result data
            _resultData = null;
            _error = null;
            
            var url:String = _apiPath + 
                "?command=" + 
                requestType.toString() +
                "&token=" +
                _readToken + 
                extendedParameters;
            
            if (requestShouldBeExecuted) {
                
                var request:URLRequest = new URLRequest(url);
                
                _loader = getLoader();
                _loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
                _loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
                
                _loader.load(request);
                
            }
            
            return url;
        
        }
        
        /** Construct an error object and dispatch a fault event */
        private function handleErrors(error:MediaRequestError):void {
            
            _error = error;
            dispatchEvent(new Event(MediaRequest.FAULT_NAME));
        
        }
        
        /** "fault" event listener to the remote call to the Brightcove media APIs */
        protected function ioErrorHandler(event:Event):void {
            
            handleErrors(new MediaRequestError(MediaRequestErrorType.IO_ERROR, event));
        
        }
        
        /**
         * Return true if the result of the call should be considerd a fault, false otherwise
         *
         * @param result    the media API result as an ActionScript object
         */
        private function checkAndSetFault(result:Object):void {
            
            if (result == null) {
                return;
            }
            
            if (MediaRequestError.hasError(result)) {
                
                handleErrors(MediaRequestError.createFromResponse(result));
                
            }
        
        }
        
        /** "result" event listener to the remote call to the Brightcove media APIs */
        protected function loaderCompleteHandler(event:Event):void {
            
            //Get the returned JSON data string
            var response:String = event.target.data as String;
            
            //The list of returned videos is embedded in the "items" property
            //of the root JSON object, so we will decode to a container
            
            //TODO Make the JSON decoding pluggable
            
            
            var deserializer:Deserializer = new Deserializer();
            var result:MediaResponse = (_serializeResultData) ? 
                deserializer.json2VideoList(response):
                deserializer.json2Object(response);
            
            checkAndSetFault(result.error);
            
            if (_error != null) {
                return;
            }
            
            _resultData = result.itemCollection;
            
            dispatchEvent(new Event(MediaRequest.RESULT_NAME));
        
        }
        
        /** Factory for the loader, used to inject mocks for testing */
        protected function getLoader():URLLoader {
            
            return new URLLoader();
        
        }
    
    
    }

}