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
package com.brightcove.brightaction.error {

    import com.brightcove.brightaction.error.Assert;

    /**
     * Test the Assertion Object
     * 
     * @author amanning
     */
    public class AssertTest {

        [Test]
        public function testValidConstruction():void {
            
            var assert:Assert = new Assert();
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testNotNull_null():void {
            
            Assert.notNull(null);
            
        }

        [Test]
        public function testNotNull_notNull():void {
            
            Assert.notNull("not null");
            
        }

        [Test]
        public function testTrue_true():void {
            
            Assert.isTrue(true);
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testTrue_false():void {
            
            Assert.isTrue(false);
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testEmpty_null():void {
            
            Assert.notEmpty(null);
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testEmpty_emptyList():void {
            
            Assert.notEmpty([]);
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testEmpty_emptyString():void {
            
            Assert.notEmpty("");
            
        }

        [Test(expects="com.brightcove.brightaction.error.AssertionError")]
        public function testEmpty_emptyStringWhitespace():void {
            
            Assert.notEmpty("  ");
            
        }

        [Test]
        public function testEmpty_notEmpty():void {
            
            Assert.notEmpty("string");
            Assert.notEmpty(["string"]);
            Assert.notEmpty([1,2,3,4]);
            
        }

        
    }

}