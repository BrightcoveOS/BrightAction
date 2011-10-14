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
    
    import org.flexunit.Assert;
    
    /**
     * Test the Object which represents a Brightcove Rendition
     *
     * @author amanning
     */
    public class RenditionTest {
        
        [Test]
        public function testCreateFromObject_null():void {
            
            Assert.assertNull(Rendition.createFromObject(null));
        
        }
        
        [Test]
        public function testConstruction_BaseInitializers():void {
            
            var url:String = "http://testurl.com/test.flv";
            var audioOnly:Boolean = false;
            var controllerType:CDNControllerTypeEnum = CDNControllerTypeEnum.AKAMAI_HD_LIVE;
            var encodingRate:Number = 1234;
            var frameHeight:Number = 567;
            var frameWidth:Number = 100;
            var size:Number = 300;
            var id:Number = 445;
            var videoDuration:Number = 1111;
            var referenceId:String = "hello world";
            var videoCodec:VideoCodecTypeEnum = VideoCodecTypeEnum.H264;
            var videoContainer:VideoContainerTypeEnum = VideoContainerTypeEnum.FLV;
            var remoteStreamName:String = "remote stream name";
            var remoteUrl:String = "remote url";
            
            var rendition:Rendition = new Rendition(
                url,
                audioOnly,
                controllerType,
                encodingRate,
                frameHeight,
                frameWidth,
                size,
                id,
                referenceId,
                videoCodec,
                videoContainer,
                videoDuration,
                remoteStreamName,
                remoteUrl);
            
            Assert.assertNotNull('Rendition should have been created', rendition);
            
            Assert.assertEquals("should match", "http://testurl.com/test.flv", rendition.url);
            
            Assert.assertEquals("should match", false, rendition.audioOnly);
            
            Assert.assertEquals(
                "should match", 
                CDNControllerTypeEnum.AKAMAI_HD_LIVE, 
                rendition.controllerType);
            
            Assert.assertEquals(
                "should match", 
                1234, 
                rendition.encodingRate);
            
            Assert.assertEquals(
                "should match", 
                567, 
                rendition.frameHeight);
            
            Assert.assertEquals(
                "should match", 
                100,
                rendition.frameWidth);
            
            Assert.assertEquals(
                "should match", 
                300,
                rendition.size);
            
            Assert.assertEquals(
                "should match", 
                id,
                445);
            
            Assert.assertEquals(
                "should match", 
                referenceId,
                "hello world");
            
            Assert.assertEquals(
                "should match", 
                VideoCodecTypeEnum.H264,
                rendition.videoCodec);
            
            Assert.assertEquals(
                "should match", 
                VideoContainerTypeEnum.FLV,
                rendition.videoContainer);
            
            Assert.assertEquals(
                "should match", 
                videoDuration,
                1111);
            
            Assert.assertEquals(
                "should match", 
                "remote stream name",
                rendition.remoteStreamName);
            
            Assert.assertEquals(
                "should match", 
                "remote url",
                rendition.remoteUrl);
            
            rendition.audioOnly = true;
            Assert.assertTrue(rendition.audioOnly);
            
            rendition.controllerType = CDNControllerTypeEnum.AKAMAI_STREAMING;
            Assert.assertEquals(CDNControllerTypeEnum.AKAMAI_STREAMING, rendition.controllerType);
            
            rendition.remoteStreamName = "stream name";
            Assert.assertEquals("stream name", rendition.remoteStreamName);
            
            rendition.remoteUrl = "some url";
            Assert.assertEquals("some url", rendition.remoteUrl);

            rendition.videoCodec = VideoCodecTypeEnum.SORENSON;
            Assert.assertEquals(VideoCodecTypeEnum.SORENSON, rendition.videoCodec);

            rendition.videoDuration = 5151;
            Assert.assertEquals(5151, rendition.videoDuration);

            rendition.videoContainer = VideoContainerTypeEnum.FLV;
            Assert.assertEquals(VideoContainerTypeEnum.FLV, rendition.videoContainer);

        }
    
    }

}