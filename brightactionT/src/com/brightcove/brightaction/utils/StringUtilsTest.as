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
    public class StringUtilsTest {

        [Test]
        public function testNoReplace_noParams():void {

            Assert.assertEquals(
                "no replacement", 
                "luminosity",
                StringUtils.substitute("luminosity"));

        }

        [Test]
        public function testNoReplace_nullParams():void {
            
            Assert.assertEquals(
                "no replacement", 
                "luminosity",
                StringUtils.substitute("luminosity",null));
            
        }

        [Test]
        public function testNoReplace_oneParamSingle():void {
            
            Assert.assertEquals(
                "no replacement", 
                "luminosity ground",
                StringUtils.substitute("luminosity {0}", "ground"));
            
        }

        [Test]
        public function testNoReplace_oneParamMulti():void {
            
            Assert.assertEquals(
                "no replacement", 
                "ground luminosity ground",
                StringUtils.substitute("{0} luminosity {0}", "ground"));
            
        }

        [Test]
        public function testNoReplace_multiParamSingle():void {
            
            Assert.assertEquals(
                "no replacement", 
                "ground luminosity beam",
                StringUtils.substitute("{0} luminosity {1}", "ground", "beam"));
            
        }

        [Test]
        public function testNoReplace_multiParamMulti():void {
            
            Assert.assertEquals(
                "no replacement", 
                "ground luminosity beam:Light|beam",
                StringUtils.substitute("{0} luminosity {1}:{2}|{1}", "ground", "beam","Light"));
            
        }

        [Test]
        public function testNoReplace_multiParamMultiWithArray():void {
            
            Assert.assertEquals(
                "no replacement", 
                "ground luminosity beam:Light|beam",
                StringUtils.substitute("{0} luminosity {1}:{2}|{1}",["ground","beam","Light"]));
            
        }

    }        

}