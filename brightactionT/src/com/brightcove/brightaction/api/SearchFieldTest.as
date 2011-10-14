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
     * Test the Object which represents a search Name / Value pair
     *
     * @author amanning
     */
    public class SearchFieldTest {
        
        [Test]
        public function testCreation_null():void {
            
            Assert.assertEquals(null, new SearchField(null, null).field);
            Assert.assertEquals(null, new SearchField(null, null).value);
        
        }

        [Test]
        public function testToString():void {

            Assert.assertEquals(
                "reference_id:a", 
                new SearchField(SearchFieldsEnum.REFERENCE_ID, "a").toString());
 
            Assert.assertEquals(
                ":b", 
                new SearchField(null, "b").toString());
            
        }

    }

}