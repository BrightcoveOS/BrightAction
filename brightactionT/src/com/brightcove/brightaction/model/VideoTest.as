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

    import com.brightcove.brightaction.utils.ObjectComparer;
    
    import org.flexunit.Assert;

    /**
     * Test the Object which represents a Brightcove Video- this object is used in deserializing
     * generic JSON objects from the Brightcove Media APIs into more stongly type ActionScript 
     * objects
     * 
     * @author amanning
     */
    public class VideoTest {

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        [Test]
        public function testConstruction_NoInitializers():void {

            Assert.assertNotNull('Empty video should have been created',new BCVideo());
            
        }
        
        [Test]
        public function testConstruction_SetAllPrimatives():void {
            
            var id:Number = 1234;
            var accountId:Number = 456;
            var length:Number = 2334;
            var publishedDate:Date = new Date(2010,12,1,4,56,23);
            var lastModifiedDate:Date = new Date(209,1,1,4,56,23);
            var videoStillURL:String = "video still URL";
            var thumbnailURL:String = "thumbnail URL";
            var FLVURL:String = "FLV URL";
            var videoFullLength:String = "video full length";
            var name:String = "the name";
            var shortDescription:String = "short description";
            var longDescription:String = "long description";
            var startDate:Date = new Date(2008,5,1,4,56,23);
            var creationDate:Date = new Date(2008,5,1,4,56,23);
            var endDate:Date = new Date(2000,12,1,4,1,23);;
            var linkURL:String = "link url";
            var linkText:String = "link text";
            var tags:Array = null;
            var referenceId:String = "reference Id";
            var economics:EconomicsEnum = null;
            var itemState:ItemStateEnum = null;
            var playsTotal:Number = 1234;
            var playsTrailingWeek:Number = 556;
            var cuePoints:Array = null;
            var customFields:Object = null;
            var renditions:Array = null;
            var geoRestricted:Boolean = true;
            var geoFilterExclude:Boolean = true;
            var geoFilteredCountries:Array = null;
            
            var video:BCVideo = 
                new BCVideo(
                    id,
                    accountId,
                    length,
                    publishedDate,
                    lastModifiedDate,
                    videoStillURL,
                    thumbnailURL,
                    FLVURL,
                    videoFullLength,
                    name,
                    shortDescription,
                    longDescription,
                    creationDate,
                    startDate,
                    endDate,
                    linkURL,
                    linkText,
                    tags,
                    referenceId,
                    economics,
                    itemState,
                    playsTotal,
                    playsTrailingWeek,
                    cuePoints,
                    customFields,
                    renditions,
                    geoRestricted,
                    geoFilterExclude,
                    geoFilteredCountries);
                    

            Assert.assertEquals("values should match", video.id, 1234);
            Assert.assertEquals("values should match", video.accountId, 456);
            Assert.assertEquals("values should match", video.length, 2334);

            Assert.assertEquals(
                "values should match", 
                video.publishedDate.toString(), 
                new Date(2010,12,1,4,56,23).toString());

            Assert.assertEquals(
                "values should match", 
                video.creationDate.toString(), 
                new Date(2008,5,1,4,56,23).toString());

            Assert.assertEquals(
                "values should match", 
                video.lastModifiedDate.toString(), 
                new Date(209,1,1,4,56,23).toString());

            Assert.assertEquals("values should match", video.videoStillURL, "video still URL");
            Assert.assertEquals("values should match", video.thumbnailURL, "thumbnail URL");
            Assert.assertEquals("values should match", video.FLVURL, "FLV URL");
            Assert.assertEquals("values should match", video.videoFullLength, "video full length");
            Assert.assertEquals("values should match", video.name, "the name");
            Assert.assertEquals("values should match", video.shortDescription, "short description");
            Assert.assertEquals("values should match", video.longDescription, "long description");

            Assert.assertEquals(
                "values should match", 
                video.startDate.toString(), 
                new Date(2008,5,1,4,56,23).toString());

            Assert.assertEquals(
                "values should match",
                video.endDate.toString(),
                new Date(2000,12,1,4,1,23).toString());

            Assert.assertEquals("values should match", video.linkURL, "link url");
            Assert.assertEquals("values should match", video.linkText, "link text");
            Assert.assertEquals("values should match", video.tags, null);
            Assert.assertEquals("values should match", video.referenceId, "reference Id");
            Assert.assertEquals("values should match", video.economics, null);
            Assert.assertEquals("values should match", video.itemState, null);
            Assert.assertEquals("values should match", video.playsTotal, 1234);
            Assert.assertEquals("values should match", video.playsTrailingWeek, 556);
            Assert.assertEquals("values should match", video.cuePoints, null);
            Assert.assertEquals("values should match", video.customFields, null);
            Assert.assertEquals("values should match", video.renditions, null);
            Assert.assertEquals("values should match", video.geoRestricted, true);
            Assert.assertEquals("values should match", video.geoFilterExclude, true);
            Assert.assertEquals("values should match", video.geoFilteredCountries, null);

            video.economics = EconomicsEnum.AD_SUPPORTED;
            Assert.assertEquals(EconomicsEnum.AD_SUPPORTED, video.economics);

            video.endDate = new Date(2000,12,1,5,1,23);
            Assert.assertEquals(
                "values should match",
                video.endDate.toString(),
                new Date(2000,12,1,5,1,23).toString());

            video.itemState = ItemStateEnum.DELETED;
            Assert.assertEquals(ItemStateEnum.DELETED, video.itemState);

            video.linkText = "link text";
            Assert.assertEquals("link text", video.linkText);

            video.linkURL = "amazon.com";
            Assert.assertEquals("amazon.com", video.linkURL);

            video.name = "dueter";
            Assert.assertEquals("dueter", video.name);

            video.name = "dueter";
            Assert.assertEquals("dueter", video.name);
            
            video.referenceId = "id12345"
            Assert.assertEquals("id12345", video.referenceId);

            video.shortDescription = "this is a short desc"
            Assert.assertEquals("this is a short desc", video.shortDescription);

            video.longDescription = "this is a long desc"
            Assert.assertEquals("this is a long desc", video.longDescription);

            video.tags = ["a", "b"];
            Assert.assertEquals(2, video.tags.length);

        }
        
        [Test]
        public function testConstruction_Arrays():void {
            
            var tags:Array = ["tag alpha", "tag beta", "tag gamma"];
            var cuePoints:Array = [
                new CuePoint("cuepoint1",CuePointTypeEnum.CODE, 2345, 1234),
                new CuePoint("cuepoint2",CuePointTypeEnum.AD, 23456, 1234)];
            
            var rendition1:Rendition = new Rendition(
                "http://testurl.com/test.flv",
                false,
                CDNControllerTypeEnum.AKAMAI_HD_LIVE,
                1234,
                12,
                45,
                78,
                34,
                "apple",
                VideoCodecTypeEnum.H264,
                VideoContainerTypeEnum.FLV,
                555,
                "remote stream name 1",
                "remote url2");

            var rendition2:Rendition = new Rendition(
                "http://testurl.com/test.flv2",
                true,
                CDNControllerTypeEnum.AKAMAI_STREAMING,
                12345,
                1,
                0,
                789,
                3,
                "123424234",
                VideoCodecTypeEnum.SORENSON,
                VideoContainerTypeEnum.M2TS,
                777,
                "remote stream name 2",
                "remote url2");

            var renditions:Array = [rendition1, rendition2];

            var geoFilteredCountries:Array = [
                GeoFilteredCountriesEnum.United_Kingdom, 
                GeoFilteredCountriesEnum.France, 
                GeoFilteredCountriesEnum.United_States];

            var video:BCVideo = 
                new BCVideo(
                    NaN,
                    NaN,
                    NaN,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    tags,
                    null,
                    null,
                    null,
                    NaN,
                    NaN,
                    cuePoints,
                    null,
                    renditions,
                    false,
                    false,
                    geoFilteredCountries);
            
            Assert.assertNotNull("should not be null", video.tags);
            Assert.assertEquals("tag values match", tags.toString(), video.tags.toString());
            
            Assert.assertNotNull("should not be null", video.cuePoints);
            Assert.assertTrue(
                "cue points match",
                new ObjectComparer().equals(cuePoints, video.cuePoints));
            
            Assert.assertNotNull("should not be null", video.renditions);
            Assert.assertTrue(
                "renditions match",
                new ObjectComparer().equals(renditions, video.renditions));
            
            Assert.assertNotNull("should not be null", video.geoFilteredCountries);
            Assert.assertTrue(
                "renditions match",
                new ObjectComparer().equals(geoFilteredCountries, video.geoFilteredCountries));
            
        }
       
    }

}