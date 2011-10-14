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
    
    import com.brightcove.brightaction.model.ItemCollection;
    import com.brightcove.brightaction.test.TestConstants;
    
    import flash.events.Event;
    
    import org.flexunit.Assert;
    
    /**
     * Test the Object which represents API requests to the Brightcove APIs
     *
     * @author amanning
     */
    public class MediaRequestTest {
        
        /** A Media API result with data */
        private static const RESULT_WITH_DATA:String = '{"items":[{"id":808469607001,"name":"capture test","adKeys":null,"shortDescription":"capture test","longDescription":null,"creationDate":"1299073713831","publishedDate":"1299073713831","lastModifiedDate":"1299073821196","linkURL":null,"linkText":null,"tags":[],"videoStillURL":"http:\/\/brightcove.vo.llnwd.net\/d14\/unsecured\/media\/13340629\/13340629_808588419001_vs-808561235001.jpg?pubId=13340629","thumbnailURL":"http:\/\/brightcove.vo.llnwd.net\/d14\/unsecured\/media\/13340629\/13340629_808588420001_th-808561235001.jpg?pubId=13340629","referenceId":null,"length":16433,"economics":"AD_SUPPORTED","playsTotal":1,"playsTrailingWeek":0},{"id":13379205,"name":"Battlestar","adKeys":null,"shortDescription":"This is a test title","longDescription":"new long","creationDate":"1143360000000","publishedDate":"1182887736449","lastModifiedDate":"1268992574850","linkURL":null,"linkText":null,"tags":[],"videoStillURL":"http:\/\/brightcove.vo.llnwd.net\/d10\/unsecured\/media\/13340629\/13340629_71127973001_wake19-179-1268215004720.jpg?pubId=13340629","thumbnailURL":"http:\/\/brightcove.vo.llnwd.net\/d10\/unsecured\/media\/13340629\/13340629_71127972001_wake19-179-1268215004522.jpg?pubId=13340629","referenceId":null,"length":25583,"economics":"FREE","playsTotal":7,"playsTrailingWeek":0},{"id":1568084817,"name":"Crazy Japanese Ad","adKeys":null,"shortDescription":"vv","longDescription":"new long","creationDate":"1211439600000","publishedDate":"1211481500409","lastModifiedDate":"1268992586861","linkURL":null,"linkText":null,"tags":[],"videoStillURL":"http:\/\/brightcove.vo.llnwd.net\/d10\/unsecured\/media\/13340629\/13340629_71127670001_scold19-174-1268214969355.jpg?pubId=13340629","thumbnailURL":"http:\/\/brightcove.vo.llnwd.net\/d10\/unsecured\/media\/13340629\/13340629_71127669001_scold19-174-1268214969071.jpg?pubId=13340629","referenceId":null,"length":25522,"economics":"FREE","playsTotal":0,"playsTrailingWeek":0},{"id":1885474309,"name":"My Lake","adKeys":null,"shortDescription":"Lake","longDescription":"new long","creationDate":"1225237719591","publishedDate":"1225237719591","lastModifiedDate":"1227633262560","linkURL":null,"linkText":null,"tags":[],"videoStillURL":"http:\/\/brightcove.vo.llnwd.net\/d6\/unsecured\/media\/13340629\/13340629_1885530764_vs-13340629-vid1885540070-img0000.jpg?pubId=13340629","thumbnailURL":"http:\/\/brightcove.vo.llnwd.net\/d6\/unsecured\/media\/13340629\/13340629_1885530765_th-13340629-vid1885540070-img0000.jpg?pubId=13340629","referenceId":null,"length":16624,"economics":"AD_SUPPORTED","playsTotal":2,"playsTrailingWeek":0},{"id":1917521109,"name":"Punisher","adKeys":null,"shortDescription":"Punisher","longDescription":"new long","creationDate":"1226529813657","publishedDate":"1226529813657","lastModifiedDate":"1238004522147","linkURL":null,"linkText":null,"tags":[],"videoStillURL":"http:\/\/brightcove.vo.llnwd.net\/d7\/unsecured\/media\/13340629\/13340629_17530993001_asset-1238004522077.jpg?pubId=13340629","thumbnailURL":"http:\/\/brightcove.vo.llnwd.net\/d7\/unsecured\/media\/13340629\/13340629_17530992001_asset-1238004521899.jpg?pubId=13340629","referenceId":null,"length":66131,"economics":"AD_SUPPORTED","playsTotal":0,"playsTrailingWeek":0},{"id":17525885001,"name":"Spiderman 3","adKeys":null,"shortDescription":"spidey3","longDescription":null,"creationDate":"1238004338304","publishedDate":"1238004338304","lastModifiedDate":"1268992598607","linkURL":null,"linkText":null,"tags":[],"videoStillURL":"http:\/\/brightcove.vo.llnwd.net\/d7\/unsecured\/media\/13340629\/13340629_19930935001_asset-1239912727324.jpg?pubId=13340629","thumbnailURL":"http:\/\/brightcove.vo.llnwd.net\/d7\/unsecured\/media\/13340629\/13340629_19930934001_asset-1239912727109.jpg?pubId=13340629","referenceId":null,"length":97138,"economics":"AD_SUPPORTED","playsTotal":2,"playsTrailingWeek":0},{"id":82237405001,"name":"MMTest","adKeys":null,"shortDescription":"MMTest","longDescription":null,"creationDate":"1272629619248","publishedDate":"1272629619248","lastModifiedDate":"1272629650293","linkURL":null,"linkText":null,"tags":[],"videoStillURL":null,"thumbnailURL":null,"referenceId":null,"length":8775,"economics":"AD_SUPPORTED","playsTotal":0,"playsTrailingWeek":0}],"page_number":0,"page_size":100,"total_count":-1}';
        
        // Errors
        /** A Media API result with data */
        private static const VALIDATION_ERROR:String = '{"error":"One or more validation errors have occurred","code":301,"errors":[{"error": "page_size OUT_OF_RANGE","code":304}]}';
        
        /** A Media API result with data */
        private static const INVALID_TOKEN:String = '{"error": "invalid token","code":210}';
        
        /** A Media API result with no error*/
        private static const EMPTY_RESULT:String = '{}';
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testAllVideos_invalid_nullToken():void {
            
            var request:MediaRequest = new MediaRequest(null);
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testAllVideos_invalid_emptyStringToken():void {
            
            var request:MediaRequest = new MediaRequest('');
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testAllVideos_invalid_whiteSpaceToken():void {
            
            var request:MediaRequest = new MediaRequest('   ');
        
        }
        
        [Test]
        public function testValidConstruction():void {
            
            var request:MediaRequest = new MediaRequest(
                "test token", 
                true,
                "http://anewpath.com");
            
            Assert.assertEquals(
                "tokens should match", 
                "test token", 
                request.readToken);
        
        }
        
        [Test]
        public function testGetLoader():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            Assert.assertNotNull(
                "loader should not be null", 
                mediaRequest.getSuperLoader());
            
        }

        [Test]
        public function testExecuteRequest_buildGoodRequest():void {
            
            var request:MediaRequest = new MediaRequest(
                "testtoken", 
                false,
                "http://anewpath.com");
            
            var requestString:String = request.executeRequest(
                "&extended",
                MediaRequestType.FIND_ALL_VIDEOS,
                false);
            
            Assert.assertEquals(
                "request should match",
                "http://anewpath.com?command=find_all_videos&token=testtoken&extended",
                requestString);
        
        }
        
        [Test]
        public function testExecuteRequest_noExtended():void {
            
            var request:MediaRequest = new MediaRequest(
                "testtoken",
                true,
                "http://anewpath.com");
            
            var requestString:String = request.executeRequest(
                "",
                MediaRequestType.FIND_ALL_VIDEOS,
                false);
            
            Assert.assertEquals(
                "request should match",
                "http://anewpath.com?command=find_all_videos&token=testtoken",
                requestString);
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testCallLoadVideos_overMaxPage():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            mediaRequest.findAllVideos(101);
        
        }
        
        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testCallLoadVideos_underMinPage():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            mediaRequest.findAllVideos(0);
        
        }
        
        [Test]
        public function testMakeRequest():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            mediaRequest.findAllVideos(100, 2, null);
            
            Assert.assertEquals(
                "request should match", 
                "http://api.brightcove.com/services/library?command=find_all_videos&token=0Z2dtxTdJAxtbZ-d0U7Bhio2V1Rhr5Iafl5FFtDPY8E.&page_size=100&page_number=2", 
                mediaRequest.loader.requestURL);
        
        }
        
        [Test]
        public function testMakeRequest_differentPage():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            mediaRequest.findAllVideos(55, 32, null);
            
            Assert.assertEquals(
                "request should match", 
                "http://api.brightcove.com/services/library?command=find_all_videos&token=0Z2dtxTdJAxtbZ-d0U7Bhio2V1Rhr5Iafl5FFtDPY8E.&page_size=55&page_number=32", 
                mediaRequest.loader.requestURL);
        
        
        }
        
        [Test]
        public function testCompleteError_noError():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            var event:TestEvent = new TestEvent();
            event.target = new Object();
            event.target.data = EMPTY_RESULT;
            
            mediaRequest.getLoaderCompleteHandler(event as Event);
            
            Assert.assertNull("should have no results", mediaRequest.resultData);
            Assert.assertNull("should have no error", mediaRequest.error);
        
        }
        
        [Test]
        public function testCompleteError_invalidToken():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            var event:TestEvent = new TestEvent();
            event.target = new Object();
            event.target.data = INVALID_TOKEN;
            
            mediaRequest.getLoaderCompleteHandler(event as Event);
            
            Assert.assertNull("should have no results", mediaRequest.resultData);
            Assert.assertNotNull("should have one error", mediaRequest.error);
            Assert.assertEquals(
                "should be correct type", 
                MediaRequestErrorType.INVALID_TOKEN,
                mediaRequest.error.errorType());
        
        }
        
        [Test]
        public function testCompleteError_validationError():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            var event:TestEvent = new TestEvent();
            event.target = new Object();
            event.target.data = VALIDATION_ERROR;
            
            mediaRequest.getLoaderCompleteHandler(event as Event);
            
            Assert.assertNull("should have no results", mediaRequest.resultData);
            Assert.assertNotNull("should have one error", mediaRequest.error);
            Assert.assertEquals(
                "should be correct type", 
                MediaRequestErrorType.VALIDATION_ERROR,
                mediaRequest.error.errorType());
        
        }
        
        [Test]
        public function testComplete_noSerialization():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(
                TestConstants.TEST_READ_TOKEN,
                false);
            
            var event:TestEvent = new TestEvent();
            event.target = new Object();
            event.target.data = RESULT_WITH_DATA;
            
            mediaRequest.getLoaderCompleteHandler(event as Event);
            
            Assert.assertNotNull("should have results", mediaRequest.resultData);
            Assert.assertNull("should have one error", mediaRequest.error);
            
            Assert.assertTrue(
                "result should be correct length", 
                mediaRequest.resultData is ItemCollection);
            
            Assert.assertEquals(
                "result should be correct length", 
                7,
                (mediaRequest.resultData as ItemCollection).items.length);
            
            Assert.assertTrue(
                "should be non-serialized simple objects",
                ((mediaRequest.resultData as ItemCollection).items[0] is Object));
        
        }
        
        [Test]
        public function testIOErrorHandler_error():void {
            
            var mediaRequest:TestMediaRequest = new TestMediaRequest(TestConstants.TEST_READ_TOKEN);
            
            mediaRequest.invokeIOErrorHandler(new Event("some_error"));
            
            Assert.assertNull("should have no results", mediaRequest.resultData);
            Assert.assertNotNull("should have an error", mediaRequest.error);
            
        }

    
    }
    
}

import com.brightcove.brightaction.api.MediaRequest;
import com.brightcove.brightaction.utils.Logger;

import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

/**
 * A test MediaRequestClass, used to override the loader so that this test doesn't make any remote
 * calls
 */
class TestMediaRequest extends MediaRequest {
    
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
    public function TestMediaRequest(
        readToken:String,
        serialize:Boolean = true,
        apiPath:String="http://api.brightcove.com/services/library") {
        
        super(readToken, serialize, apiPath);
    
    }
    
    public var loader:TestLoader = new TestLoader();
    
    /** Return the test loader, rather than the standard URL loader */
    override protected function getLoader():URLLoader {
        
        return loader;
    
    }

    /** "fault" event listener to the remote call to the Brightcove media APIs */
    public function invokeIOErrorHandler(event:Event):void {
        
        super.ioErrorHandler(event);
        
    }

    /** Return the test loader, rather than the standard URL loader */
    public function getSuperLoader():URLLoader {
        
        return super.getLoader();
        
    }

    /** "result" event listener to the remote call to the Brightcove media APIs */
    public function getLoaderCompleteHandler(event:Event):void {
        
        return loaderCompleteHandler(event);
    
    }

}

/** A Fake loader class used to dispatch stubbed responses and events */
class TestLoader extends URLLoader {
    
    public var requestURL:String = requestURL;
    
    override public function load(request:URLRequest):void {
        
        Logger.debug("load, request URL: {0}", this, request.url);
        requestURL = request.url;
    
    }

}

/** A Fake Event Class for stubbing server responses */
class TestEvent extends Event {
    
    function TestEvent():void {
        
        super("TestEvent");
    
    }
    
    /** Stubbed event target */
    private var _target:Object;
    
    public function set target(target:Object):void {
        
        _target = target;
    
    }
    
    override public function get target():Object {
        
        return _target;
    
    }

}


