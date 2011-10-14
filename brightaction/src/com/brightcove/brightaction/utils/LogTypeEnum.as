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
    
    import com.brightcove.brightaction.model.AbstractEnum;
    
    /**
     * An Enumeration of the different types of log messages- ERROR, WARN, or INFO.
     *
     * @author amanning
     */
    public class LogTypeEnum extends AbstractEnum {
        
        /** Error Logs, when something went wrong, badly wrong */
        public static const ERROR:LogTypeEnum = new LogTypeEnum("ERROR");
        
        /** Warning Logs, when something might have gone wrong, it could be bad. */
        public static const WARN:LogTypeEnum = new LogTypeEnum("WARN");
        
        /** Info Logs, documents important events */
        public static const INFO:LogTypeEnum = new LogTypeEnum("INFO");

        /** Info Logs, documents the flow of what is going on */
        public static const DEBUG:LogTypeEnum = new LogTypeEnum("DEBUG");

        /** Class Constructor- initialize properties */
        function LogTypeEnum(value:String) {
            
            super(value);
        
        }
    
    }

}
