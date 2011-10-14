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
     * Test the Object which represents an Abstract Enumeration
     *
     * @author amanning
     */
    public class AbstractEnumTest {
        
        [Test]
        public function testCreateFromValue_null():void {

            Assert.assertNull(
                "null list, should be null",
                 AbstractEnum.createFromValue("test", null));
            
        }

        [Test]
        public function testCreateFromValue_empty():void {
            
            Assert.assertNull(
                "null list, should be null",
                AbstractEnum.createFromValue("test", []));
            
        }

        [Test]
        public function testCreateFromValue_noMatch():void {
            
            Assert.assertNull(
                "null list, should be null",
                AbstractEnum.createFromValue(CuePointTypeEnum.CHAPTER, [CuePointTypeEnum.AD]));
            
        }

    }

}