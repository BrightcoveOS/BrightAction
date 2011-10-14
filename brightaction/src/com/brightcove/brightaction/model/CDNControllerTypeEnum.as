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
    
    /**
     * [Optional — required for live streaming only] Depending on your CDN, one of 
     * LIMELIGHT_LIVE or AKAMAI_LIVE.
     * 
     * @author amanning
     */
    public class CDNControllerTypeEnum extends AbstractEnum {
        
        /** Akamai CDN, not live, without TTL */
        public static const DEFAULT:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("DEFAULT");

        /** Akamai CDN, not live, without TTL */
        public static const AKAMAI_STREAMING:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("AKAMAI_STREAMING");

        /** Akamai CDN, not live, with TTL */
        public static const AKAMAI_SECURE_STREAMING:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("AKAMAI_SECURE_STREAMING");

        /** Akamai CDN, live, without DVR */
        public static const AKAMAI_LIVE:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("AKAMAI_LIVE");

        /** live with DVR (whether your account's main CDN is Akamai or not) */
        public static const AKAMAI_HD_LIVE:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("AKAMAI_HD_LIVE");

        /** Limelight CDN, live */
        public static const LIMELIGHT_LIVE:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("LIMELIGHT_LIVE");

        /** Limelight Live Controller Type */
        public static const LIMELIGHT_MEDIAVAULT:CDNControllerTypeEnum = 
            new CDNControllerTypeEnum("LIMELIGHT_MEDIAVAULT");

        /** A list of all available enum types, implemented by each sub-class for the lookup */
        private static const LIST:Array = [
            DEFAULT,
            AKAMAI_STREAMING, 
            AKAMAI_SECURE_STREAMING, 
            AKAMAI_LIVE,
            AKAMAI_HD_LIVE,
            LIMELIGHT_LIVE,
            LIMELIGHT_MEDIAVAULT];

        /**
         * Given the value representation of the enum, return an enum that matches that value
         *
         * @param value the value to lookup
         *
         */
        public static function createFromValue(value:Object):CDNControllerTypeEnum {
            
            return (AbstractEnum.createFromValue(value, LIST) as CDNControllerTypeEnum);
            
        }

        
        /** Class Constructor- initialize properties */
        public function CDNControllerTypeEnum(value:String) {
            
            super(value);
            
        }
                
    }

}
