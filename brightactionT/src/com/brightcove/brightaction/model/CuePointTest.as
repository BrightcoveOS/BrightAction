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
     * Test the Object which represents a Brightcove Cue Point
     * 
     * @author amanning
     */
    public class CuePointTest {

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        [Test]
        public function testConstruction_BaseInitializers():void {

            var cuePoint:CuePoint = new CuePoint("name", CuePointTypeEnum.AD, 2345, 1234);

            Assert.assertNotNull('Cuepoint should have been created', cuePoint);
            Assert.assertEquals('should be equal', "name", cuePoint.name);
            Assert.assertEquals('should be equal', CuePointTypeEnum.AD, cuePoint.type);
            Assert.assertEquals('should be equal', 2345, cuePoint.time);

            Assert.assertEquals('should be equal', 1234, cuePoint.videoId);
            Assert.assertEquals('should be equal', false, cuePoint.forceStop);
            Assert.assertEquals('should be equal', "", cuePoint.metadata);
            
        }

        [Test]
        public function testConstruction_Full():void {

            var cuePoint:CuePoint = new CuePoint("",null,0,0);
            
            cuePoint.forceStop = true;
            cuePoint.metadata = "this is some metadata";
            cuePoint.name = "name";
            cuePoint.time = 2345;
            cuePoint.type = CuePointTypeEnum.AD;
            cuePoint.videoId = 340524;
            
            Assert.assertNotNull('Cuepoint should have been created', cuePoint);
            Assert.assertEquals('should be equal', "name", cuePoint.name);
            Assert.assertEquals('should be equal', CuePointTypeEnum.AD, cuePoint.type);
            Assert.assertEquals('should be equal', 2345, cuePoint.time);

            Assert.assertEquals('should be equal', 340524, cuePoint.videoId);
            Assert.assertEquals('should be equal', true, cuePoint.forceStop);
            Assert.assertEquals('should be equal', "this is some metadata", cuePoint.metadata);
            
        }

        [Test]
        public function testConstruction_CreateFromObject_Null():void {
            
            Assert.assertNull('Should be null', CuePoint.createFromObject(null));

        }

    }

}