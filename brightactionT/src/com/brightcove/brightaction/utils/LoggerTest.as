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
     * Test the Logging Utility
     *
     * @author amanning
     */
    public class LoggerTest {
        
        /** Run before every test */
        [Before]
        public function setUp():void {
            
            Logger.enableAllLogging();
        
        }
        
        [Test]
        public function testSetGetLogLevel():void {
            
            Logger.setLogLevel([LogTypeEnum.INFO]);
            
            Assert.assertEquals("length should match", 1, Logger.getLogLevel().length);
            Assert.assertEquals("levels should match", LogTypeEnum.INFO, Logger.getLogLevel()[0]);
        
        }
        
        [Test(expects="Error")]
        public function testSeLogLevel_Invalid():void {
            
            Logger.setLogLevel(["not valid"]);
        
        }
        
        [Test]
        public function testSetLogLevel_valid():void {
            
            try {
                Logger.setLogLevel(["not valid"]);
            } catch (e:Error) {
                //expected
                return;
            }
            
            Assert.fail("the log level wasn't valid, it should have failed");
        
        }
        
        [Test]
        public function testDisableEnableLogging():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [WARN][LoggerTest] This is a warn",
                Logger.buildWarn("This is a warn", this));
            
            Logger.disableAllLogging();
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildWarn("This is a warn", this));
            
            Logger.enableAllLogging();
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [WARN][LoggerTest] This is a warn",
                Logger.buildWarn("This is a warn", this));
        
        }
        
        [Test]
        public function testError():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [ERROR][LoggerTest] This is an error",
                Logger.buildError("This is an error", this));
            
            Logger.setLogLevel(null);
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildError("This is an error", this));
        
        }
        
        [Test]
        public function testWarn():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [WARN][LoggerTest] This is a warn",
                Logger.buildWarn("This is a warn", this));
            
            Logger.setLogLevel(null);
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildWarn("This is a warn", this));
        
        }
        
        [Test]
        public function testDebug():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [DEBUG][LoggerTest] This is a debug",
                Logger.buildDebug("This is a debug", this));
            
            Logger.setLogLevel(null);
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildWarn("This is a warn", this));
        
        }
        
        [Test]
        public function testInfo():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [INFO][LoggerTest] This is an info",
                Logger.buildInfo("This is an info", this));
            
            Logger.setLogLevel(null);
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildInfo("This is an info", this));
        
        }
        
        [Test]
        public function testError_logAnError():void {
            
            Logger.error("this is an error", this);
        
        }
        
        [Test]
        public function testCreation():void {
            
            Assert.assertNotNull("can new it up, but it does nothing", new Logger());
        
        }
        
        [Test]
        public function testDisabledLogLevelsTheEnabled():void {
            
            Logger.setLogLevel(null);
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildInfo("This is an info"));
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildWarn("This is an warn"));
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildError("This is an error"));
            
            Logger.enableAllLogging();
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [INFO][unknown] This is an info",
                Logger.buildInfo("This is an info"));
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [DEBUG][unknown] This is an info",
                Logger.buildDebug("This is an info"));
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [WARN][unknown] This is an info",
                Logger.buildWarn("This is an info"));
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [ERROR][unknown] This is an error",
                Logger.buildError("This is an error"));
            
            Logger.setLogLevel([]);
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildInfo("This is an info"));
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildWarn("This is an warn"));
            
            Assert.assertEquals(
                "Log string should match",
                "",
                Logger.buildError("This is an error"));
        
        }
        
        [Test]
        public function testInfo_replace():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [INFO][LoggerTest] This is 1 an 2 info 3",
                Logger.buildInfo("This is {0} an {1} info {2}", this, 1, 2, 3));
        
        }
        
        [Test]
        public function testNullType():void {
            
            Assert.assertEquals(
                "Log string should match",
                "BrightAction Log >> [INFO][unknown] info",
                Logger.buildInfo("info", null));
        
        
        
        }
    
    }

}

