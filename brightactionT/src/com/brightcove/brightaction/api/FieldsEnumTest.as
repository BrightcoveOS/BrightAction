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
    import com.brightcove.brightaction.model.BCVideo;
    import com.brightcove.brightaction.test.TestConstants;
    
    import flash.events.Event;
    
    import flexunit.framework.Test;
    
    import org.flexunit.Assert;
    import org.flexunit.async.Async;
    
    /**
     * Test the Object which represents a list of video fields
     *
     * @author amanning
     */
    public class FieldsEnumTest {
        
        [Test]
        public function testListToString_null():void {
            
            Assert.assertNull("list should be null", FieldsEnum.listToString(null));
        
        }

        [Test]
        public function testListToString_empty():void {
            
            Assert.assertNull("list should be null", FieldsEnum.listToString([]));
            
        }

    }
}