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
package com.brightcove.brightaction.utils {

    import org.flexunit.Assert;

    /**
     * Test the Object which compares other objects
     * 
     * @author amanning
     */
    public class ObjectCheckerTest {

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        [Test]
        public function testValidConstruction():void {

            Assert.assertNotNull(new ObjectChecker());

        }

        [Test]
        public function testIfDefined_null():void {
            
            Assert.assertNull(ObjectChecker.ifDefined(null, "foo"));
            Assert.assertNull(ObjectChecker.ifDefined({a:1}, null));
            Assert.assertNull(ObjectChecker.ifDefined(null, null));
            
        }

        [Test]
        public function testIfDefined_NotDefined():void {
            
            Assert.assertNull(ObjectChecker.ifDefined({a:1}, "b"));
            Assert.assertNull(ObjectChecker.ifDefined({a:1,b:2,c:3}, "d"));
            
        }

        [Test]
        public function testIfDefined_Defined():void {
            
            Assert.assertEquals("should be equal", ObjectChecker.ifDefined({a:1}, "a"), 1);
            Assert.assertEquals("should be equal", ObjectChecker.ifDefined({a:1,b:2,c:3}, "c"), 3);
            
        }

    }        

}