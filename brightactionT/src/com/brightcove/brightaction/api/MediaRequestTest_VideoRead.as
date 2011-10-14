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
    
    import com.brightcove.brightaction.model.SearchField;
    import com.brightcove.brightaction.model.SearchFieldsEnum;
    
    import org.flexunit.Assert;
    
    /**
     * Test the Object which represents API requests to the Brightcove APIs
     *
     * @author amanning
     */
    public class MediaRequestTest_VideoRead {
        
        // Find All Videos
        [Test]
        public function testfindAll_Basic():void {
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=10&page_number=23",
                new MediaRequest("testtoken").findAllVideos(
                10, 
                23,
                null,
                null,
                false, 
                [],
                [],
                null, 
                null, 
                false, 
                false));
        
        }
        
        [Test]
        public function testFindAll_Fields_RequestOne():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&video_fields=cuepoints",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                null,
                null,
                false,
                fields,
                [],
                null,
                null,
                false,
                false));
        
        }
        
        [Test]
        public function testFindAll_FieldsRequestMultiple():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.ACCOUNTID, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&" +
                "video_fields=cuepoints,accountid,enddate",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                null,
                null,
                false,
                fields, 
                [],
                null,
                null,
                false,
                false));
        
        }
        
        [Test]
        public function testFindAll_FieldsRequestAll():void {
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&token=" +
                "testtoken&page_size=100&page_number=1&video_fields=id,name,shortdescription," +
                "longdescription,creationdate,publisheddate,lastmodifieddate,startdate,enddate," +
                "linkurl,linktext,tags,videostillurl,thumbnailurl,referenceid,length," +
                "economics,itemstate,playstotal,playstrailingweek,version,cuepoints," +
                "submissioninfo,customfields,releasedate,flvurl,renditions,geofiltered," +
                "georestricted,geofilterexclude,excludelistedcountries,geofilteredcountries," +
                "allowedcountries,accountid,flvfulllength,videofulllength",
                
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                null,
                null,
                false,
                [],
                [],
                null,
                null,
                true,
                false));
        
        }
        
        [Test]
        public function testFindAll_FieldsSortBy():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.ACCOUNTID, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&video_fields=cuepoints,accountid,enddate",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                null,
                false,
                fields,
                [],
                null,
                null,
                false,
                false));
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=publish_date" +
                "&video_fields=cuepoints,accountid,enddate",
                new MediaRequest("testtoken").findAllVideos(
                100,
                1,
                SortByTypeEnum.PUBLISH_DATE,
                null,
                false,
                fields,
                [],
                null,
                null,
                false,
                false));
        
        }
        
        [Test]
        public function testFindAll_TotalCount():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.ACCOUNTID, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&get_item_count=true&" +
                "sort_by=creation_date&sort_order=DESC&video_fields=cuepoints,accountid,enddate",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1, 
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                true,
                fields,
                [],
                null,
                null,
                false,
                false));
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=ASC&video_fields=cuepoints,accountid,enddate",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1, 
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.ASC,
                false,
                fields,
                [],
                null,
                null,
                false,
                false));
        
        }
        
        [Test]
        public function testFindAll_customFields():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.ACCOUNTID, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=DESC&video_fields=cuepoints,accountid,enddate" +
                "&custom_fields=alpha,beta,gamma",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["alpha", "beta", "gamma"],
                null,
                null,
                false,
                false));
            
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=DESC&video_fields=cuepoints,accountid,enddate" +
                "&custom_fields=omega",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["omega"],
                null,
                null,
                false,
                false));
        }
        
        [Test]
        public function testFindAll_mediaDelivery():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.ACCOUNTID, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=DESC&video_fields=cuepoints,accountid,enddate" +
                "&custom_fields=alpha,beta,gamma&media_delivery=default",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["alpha", "beta", "gamma"],
                MediaDeliveryTypeEnum.DEFAULT,
                null,
                false,
                false));
            
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=DESC&video_fields=cuepoints,accountid,enddate" +
                "&custom_fields=omega&media_delivery=http",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["omega"],
                MediaDeliveryTypeEnum.HTTP,
                null,
                false,
                false));
        }
        
        [Test]
        public function testFindAll_output():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.ACCOUNTID, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=DESC&video_fields=cuepoints,accountid,enddate" +
                "&custom_fields=alpha,beta,gamma&media_delivery=default&output=json",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["alpha", "beta", "gamma"],
                MediaDeliveryTypeEnum.DEFAULT,
                OutputTypeEnum.JSON,
                false,
                false));
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_all_videos&" +
                "token=testtoken&page_size=100&page_number=1&sort_by=creation_date" +
                "&sort_order=DESC&video_fields=cuepoints,accountid,enddate" +
                "&custom_fields=omega&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findAllVideos(
                100, 
                1,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["omega"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        }
        
        // Search Videos
        [Test]
        public function testSearchVideos_Basic():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL, FieldsEnum.ENDDATE];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=search_videos&" +
                "token=testtoken&page_size=100&page_number=0&get_item_count=true&" +
                "sort_by=creation_date&video_fields=cuepoints,videostillurl,enddate&" +
                "custom_fields=field1&media_delivery=http&output=mrss" +
                "&all=display_name:gibbous",
                new MediaRequest("testtoken").searchVideos(
                [new SearchField(SearchFieldsEnum.DISPLAY_NAME,"gibbous")],
                null,
                [],
                SortByTypeEnum.CREATION_DATE,
                false,
                100,
                0,
                true,
                fields,
                ["field1"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        [Test]
        public function testSearchVideos_allSearchLists():void {
            
            var fields:Array = [FieldsEnum.ECONOMICS, FieldsEnum.ACCOUNTID];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=search_videos" +
                "&token=testtoken&page_size=80&page_number=2&sort_by=plays_total" +
                "&video_fields=economics,accountid&custom_fields=field2,field3" +
                "&media_delivery=http&output=mrss&all=display_name:gibbous" +
                "&any=reference_id:testRef-1&none=tag:tag1,tag:tag2",
                new MediaRequest("testtoken").searchVideos(
                [new SearchField(SearchFieldsEnum.DISPLAY_NAME,"gibbous")],
                [new SearchField(SearchFieldsEnum.REFERENCE_ID,"testRef-1")],
                [new SearchField(SearchFieldsEnum.TAG,"tag1"), 
                new SearchField(SearchFieldsEnum.TAG,"tag2")],
                SortByTypeEnum.PLAYS_TOTAL,
                true,
                80,
                2,
                false,
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        // Find Video By Id
        [Test]
        public function testFindVideoById():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_video_by_id&" +
                "token=testtoken&video_id=12345&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideoById(
                12345,
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                true,
                false,
                false));
        
        }

        [Test]
        public function testFindVideoById_unfiltered():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_video_by_id_unfiltered&token=testtoken&video_id=12345&video_fields=cuepoints,videostillurl&custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideoById(
                    12345,
                    fields,
                    ["field2", "field3"],
                    MediaDeliveryTypeEnum.HTTP,
                    OutputTypeEnum.MRSS,
                    false,
                    false,
                    false));
            
        }

        // Find Related
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindRelated_invalid():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            new MediaRequest("testtoken").findRelatedVideos(
                -1, 
                "",
                100,
                0,
                false,
                null,
                null,
                null,
                null,
                false,
                false);
        
        }
        
        [Test]
        public function testFindRelated_videoId():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_related_videos&" +
                "token=testtoken&video_id=12345&page_size=100&page_number=2&" +
                "get_item_count=true&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findRelatedVideos(
                12345,
                "",
                100,
                2,
                true,
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        [Test]
        public function testFindRelated_referenceId():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_related_videos&" +
                "token=testtoken&reference_id=my-ref&page_size=100&page_number=2&" +
                "get_item_count=true&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findRelatedVideos(
                -1,
                "my-ref",
                100,
                2,
                true,
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        // Find Videos By Ids
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindVideosByIds_nullIds():void {
            
            new MediaRequest("testtoken").findVideosByIds(null);
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindVideosByIds_noIds():void {
            
            new MediaRequest("testtoken").findVideosByIds([]);
        
        }
        
        [Test]
        public function testFindVideosByIds_withIds():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_ids&" +
                "token=testtoken&video_ids=123,456&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideosByIds(
                ["123","456"],
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                true,
                false,
                false));
        
        }
        
        [Test]
        public function testFindVideosByIds_withIds_unfiltered():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_ids_unfiltered&" +
                "token=testtoken&video_ids=123,456&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideosByIds(
                    ["123","456"],
                    fields,
                    ["field2", "field3"],
                    MediaDeliveryTypeEnum.HTTP,
                    OutputTypeEnum.MRSS,
                    false,
                    false,
                    false));
            
        }
        
        // Find Video by reference Id
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindVideoByRefId_nullIds():void {
            
            new MediaRequest("testtoken").findVideoByReferenceId(null);
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindVideoByRefId_noIds():void {
            
            new MediaRequest("testtoken").findVideoByReferenceId("");
        
        }
        
        [Test]
        public function testFindVideoByRefId_withIds():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_video_by_reference_id&" +
                "token=testtoken&reference_id=my-ref-1&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideoByReferenceId(
                "my-ref-1",
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                true,
                false,
                false));
        
        }

        [Test]
        public function testFindVideoByRefId_withIdsUnfiltered():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=" +
                "find_video_by_reference_id_unfiltered&" +
                "token=testtoken&reference_id=my-ref-1&video_fields=cuepoints,videostillurl&" +
                "custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideoByReferenceId(
                    "my-ref-1",
                    fields,
                    ["field2", "field3"],
                    MediaDeliveryTypeEnum.HTTP,
                    OutputTypeEnum.MRSS,
                    false,
                    false,
                    false));
            
        }

        // Find Videos By Reference IDs
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindVideosByReferenceIds_nullIds():void {
            
            new MediaRequest("testtoken").findVideosByReferenceIds(null);
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testFindVideosByReferenceIds_noIds():void {
            
            new MediaRequest("testtoken").findVideosByReferenceIds([]);
        
        }
        
        [Test]
        public function testFindVideosByReferenceIds_withIds_filtered():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_reference_ids&" +
                "token=testtoken&reference_ids=tester,tester2&" +
                "video_fields=cuepoints,videostillurl&custom_fields=field2,field3&" +
                "media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideosByReferenceIds(
                ["tester","tester2"],
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                true,
                false,
                false));
        
        }

        [Test]
        public function testFindVideosByReferenceIds_withIds_unfiltered():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?" +
                "command=find_videos_by_reference_ids_unfiltered&" +
                "token=testtoken&reference_ids=tester,tester2&" +
                "video_fields=cuepoints,videostillurl&custom_fields=field2,field3&" +
                "media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideosByReferenceIds(
                    ["tester","tester2"],
                    fields,
                    ["field2", "field3"],
                    MediaDeliveryTypeEnum.HTTP,
                    OutputTypeEnum.MRSS,
                    false,
                    false,
                    false));
            
        }

        // Find Videos by User Id
        [Test]
        public function testFindVideosByUserId_withIds():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_user_id&" +
                "token=testtoken&user_id=1234&page_size=100&page_number=0&get_item_count=true&" +
                "video_fields=cuepoints,videostillurl&custom_fields=field1&media_delivery=http&" +
                "output=mrss",
                new MediaRequest("testtoken").findVideosByUserId(
                1234,
                100,
                0,
                true,
                fields,
                ["field1"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        // Find Videos by Campaign Id
        [Test]
        public function testFindVideosByCampaignId_withIds():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_campaign_id&" +
                "token=testtoken&campaign_id=1234&page_size=100&page_number=0&get_item_count=true&" +
                "video_fields=cuepoints,videostillurl&custom_fields=field1&media_delivery=http&" +
                "output=mrss",
                new MediaRequest("testtoken").findVideosByCampaignId(
                1234,
                100,
                0,
                true,
                fields,
                ["field1"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        
        //Find modified videos
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function findModified_noIds():void {
            
            new MediaRequest("testtoken").findModifiedVideos(null);
        
        }
        
        [Test]
        public function findModified_withFilter():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            var filter:Array = [FilterTypeEnum.PLAYABLE, FilterTypeEnum.DELETED];
            var testDate:Date = new Date("Jan 2 2011");
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_modified_videos&token=testtoken&from_date=1293922800000&filter=PLAYABLE,DELETED&page_size=100&page_number=0&sort_by=creation_date&sort_order=ASC&video_fields=cuepoints,videostillurl&custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findModifiedVideos(
                testDate,
                filter,
                100,
                0,
                SortByTypeEnum.CREATION_DATE,
                SortOrderTypeEnum.ASC,
                false,
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }
        
        [Test]
        public function findModified_noFilter():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            var testDate:Date = new Date("Jan 2 2011");
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_modified_videos&token=testtoken&from_date=1293922800000&page_size=100&page_number=0&sort_by=modified_date&sort_order=DESC&video_fields=cuepoints,videostillurl&custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findModifiedVideos(
                testDate,
                null,
                100,
                0,
                SortByTypeEnum.MODIFIED_DATE,
                SortOrderTypeEnum.DESC,
                false,
                fields,
                ["field2", "field3"],
                MediaDeliveryTypeEnum.HTTP,
                OutputTypeEnum.MRSS,
                false,
                false));
        
        }

        //Find videos by text
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function findByText_noText():void {
            
            new MediaRequest("testtoken").findVideosByText(null);
            
        }
        
        [Test]
        public function findByText_withText():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_text&token=testtoken&text=testtext&page_size=100&page_number=0&video_fields=cuepoints,videostillurl&custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideosByText(
                    "testtext",
                    100,
                    0,
                    false,
                    fields,
                    ["field2", "field3"],
                    MediaDeliveryTypeEnum.HTTP,
                    OutputTypeEnum.MRSS,
                    false,
                    false));
            
        }

        //Find videos by tags
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function findByTags_noTags():void {
            
            new MediaRequest("testtoken").findVideosByTags();
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function findByTags_emptyTags():void {
            
            new MediaRequest("testtoken").findVideosByTags([],[]);
            
        }

        [Test]
        public function findByTags_bothAndOr():void {
            
            var fields:Array = [FieldsEnum.CUEPOINTS, FieldsEnum.VIDEOSTILLURL];
            
            Assert.assertEquals(
                "request should match",
                "http://api.brightcove.com/services/library?command=find_videos_by_tags&token=testtoken&and_tags=alpha,beta&or_tags=gamma&page_size=100&page_number=0&video_fields=cuepoints,videostillurl&custom_fields=field2,field3&media_delivery=http&output=mrss",
                new MediaRequest("testtoken").findVideosByTags(
                    ["alpha", "beta"],
                    ["gamma"],
                    100,
                    0,
                    false,
                    fields,
                    ["field2", "field3"],
                    MediaDeliveryTypeEnum.HTTP,
                    OutputTypeEnum.MRSS,
                    false,
                    false));
            
        }

    }

}