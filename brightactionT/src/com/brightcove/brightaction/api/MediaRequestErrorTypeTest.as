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
    public class MediaRequestErrorTypeTest {

        
        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        [Test]
        public function testNotFound_Neg1():void {

            Assert.assertNull(
                "error type should be null",
                MediaRequestErrorType.getErrorForCode(-1));                        
            
        }
        
        [Test]
        public function testNotFound_NaN():void {

            Assert.assertNull(
                "error type should be null",
                MediaRequestErrorType.getErrorForCode(NaN));                        
            
        }
        
        [Test]
        public function testNotFound_NotFound():void {

            Assert.assertNull(
                "error type should be null",
                MediaRequestErrorType.getErrorForCode(1234567890));                        
            
        }

        [Test]
        public function testNotFound_Valid():void {

            Assert.assertNotNull(
                "error type should be null",
                MediaRequestErrorType.getErrorForCode(210));                        
            
            Assert.assertEquals(
                "types should match",
                "INVALID_TOKEN",
                MediaRequestErrorType.getErrorForCode(210).toString());
        
        }

    }        


}