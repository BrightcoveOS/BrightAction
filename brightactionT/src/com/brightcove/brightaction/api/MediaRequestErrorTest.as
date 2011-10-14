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

    import org.flexunit.Assert;

    /**
     * Test the Object which represents API requests to the Brightcove APIs
     * 
     * @author amanning
     */
    public class MediaRequestErrorTest {

        //------------------------------------------------------------------------------------------
        // Member Variables
        //------------------------------------------------------------------------------------------
        // Test Errors
        private var _stubbErrorObject:Object = {error:"error message", message:"test message"};
        private var _stubbReturnObjectNoError:Object = {error:"", message:"test message2"};
        private var _stubbReturnObjectNoError2:Object = {message:"test message3"};
        private var _stubbReturnObjectNullError2:Object = {error:null, message:"test message3"};
        
        // Stubbed Actual Errors
        private var _stubbedInvalidTokenError:Object = 
        {
            code:301, 
            error:"One or more validation errors have occured",
            errors:[{code:304, error:"token OUT_OF_RANGE"}]
        };
        
        private var _stubbedUnknownError:Object = 
        {
            code:10010101012038901283102381208312083, 
            error:"unknown error has occured"
        };
        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        [Test]
        public function testValidConstruction():void {
            
            var error:MediaRequestError = new MediaRequestError(
                MediaRequestErrorType.INVALID_TOKEN,
                this._stubbErrorObject);
            
            
            Assert.assertNotNull("error should not be null", error);
            
            Assert.assertEquals(
                "error types should match",
                MediaRequestErrorType.INVALID_TOKEN, 
                error.errorType());
            
            Assert.assertEquals(
                "error messages should match",
                "test message", 
                error.errorDetail().message);
            
        }
        
        [Test]
        public function testErrorDetected():void {
            
            Assert.assertTrue(
                "error should be detected",
                MediaRequestError.hasError(_stubbErrorObject))
            
            
        }
        
        [Test]
        public function testErrorDetected_noError1():void {
            
            Assert.assertFalse(
                "error should not be detected",
                MediaRequestError.hasError(_stubbReturnObjectNoError))
            
            
        }
        
        [Test]
        public function testErrorDetected_noError2():void {
            
            Assert.assertFalse(
                "error should not be detected",
                MediaRequestError.hasError(_stubbReturnObjectNoError2))
            
        }

        [Test]
        public function testErrorDetected_nullError():void {
            
            Assert.assertFalse(
                "error should not be detected",
                MediaRequestError.hasError(_stubbReturnObjectNullError2))
            
        }

        [Test]
        public function testCreateFromResponse_invalidToken():void {
            
            Assert.assertEquals(
                "invalid token error should be created",
                MediaRequestErrorType.VALIDATION_ERROR,
                MediaRequestError.createFromResponse(_stubbedInvalidTokenError).errorType());
            
        }

        [Test]
        public function testCreateFromResponse_nullError():void {
            
            Assert.assertEquals(
                "unknown error should be created",
                MediaRequestErrorType.UNKNOWN_ERROR,
                MediaRequestError.createFromResponse(_stubbedUnknownError).errorType());
            
        }

        [Test]
        public function testCreateFromResponse_noError():void {
            
            Assert.assertNull(
                "no error found",
                MediaRequestError.createFromResponse(_stubbReturnObjectNoError));
            
        }



    }        


}