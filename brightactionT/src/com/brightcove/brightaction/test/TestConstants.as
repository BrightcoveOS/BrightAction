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
package com.brightcove.brightaction.test {

    import org.flexunit.Assert;
    import org.flexunit.async.Async;

    /**
     * Common testing related constants
     * 
     * @author amanning
     */
    public class TestConstants {

        //------------------------------------------------------------------------------------------
        // Member Variables
        //------------------------------------------------------------------------------------------
        /** Remote call timeout for async tests */
        public static const ASYNC_TIMEOUT:Number = 10000;

        /** 
         * A brightcove testing read token, accesses a read token provided by public documentation 
         * 
         * In Production: 0Z2dtxTdJAxtbZ-d0U7Bhio2V1Rhr5Iafl5FFtDPY8E.
         * Local: riBfgveLvpTe0QVZp5zTCqHTL8HpgjZUZ1taBVa6Cs4.
         */
        public static var TEST_READ_TOKEN:String = '0Z2dtxTdJAxtbZ-d0U7Bhio2V1Rhr5Iafl5FFtDPY8E.';
        
        /** 
         * A brightcove testing API domain, for local testing
         */
        public static var TEST_API_DOMAIN:String = 'http://localhost:8080';
        
    }

}