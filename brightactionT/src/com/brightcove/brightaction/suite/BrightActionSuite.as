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
package com.brightcove.brightaction.suite {
    
    import com.brightcove.brightaction.api.FieldsEnumTest;
    import com.brightcove.brightaction.api.MediaRequestErrorTest;
    import com.brightcove.brightaction.api.MediaRequestErrorTypeTest;
    import com.brightcove.brightaction.api.MediaRequestTest;
    import com.brightcove.brightaction.api.MediaRequestTest_VideoRead;
    import com.brightcove.brightaction.api.SearchFieldTest;
    import com.brightcove.brightaction.error.AssertTest;
    import com.brightcove.brightaction.model.AbstractEnumTest;
    import com.brightcove.brightaction.model.CuePointTest;
    import com.brightcove.brightaction.model.GeoFilteredCountriesEnumTest;
    import com.brightcove.brightaction.model.ItemStateEnumTest;
    import com.brightcove.brightaction.model.RenditionTest;
    import com.brightcove.brightaction.model.VideoTest;
    import com.brightcove.brightaction.serialization.DeserializerTest;
    import com.brightcove.brightaction.utils.LoggerTest;
    import com.brightcove.brightaction.utils.ObjectCheckerTest;
    import com.brightcove.brightaction.utils.ObjectComparerTest;
    import com.brightcove.brightaction.utils.StringUtilsTest;
    
    /** This suite contains all of the BrightAction API wrapper tests */
    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class BrightActionSuite {
        
        // Utils
        public var assertTest:AssertTest;
        public var stringUtilsTest:StringUtilsTest;
        public var objectComparerTest:ObjectComparerTest;
        public var objectCheckerTest:ObjectCheckerTest;
        public var loggerTest:LoggerTest;
        
        // Models
        public var cuePointTest:CuePointTest;
        public var videoTest:VideoTest;
        public var renditionTest:RenditionTest;
        public var geoFilteredCountriesEnumTest:GeoFilteredCountriesEnumTest;
        public var abstractEnumTest:AbstractEnumTest;
        public var itemStateEnumTest:ItemStateEnumTest;
        
        // API Requests
        public var deserializerTest:DeserializerTest;
        public var requestErrorTest:MediaRequestErrorTest;
        public var mediaRequestErrorTypeTest:MediaRequestErrorTypeTest;
        public var mediaRequestTest:MediaRequestTest;
        public var fieldsEnumTest:FieldsEnumTest;
        public var searchFieldTest:SearchFieldTest;
        public var mediaRequestTest_VideoRead:MediaRequestTest_VideoRead;

    }

}