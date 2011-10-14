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

    import com.brightcove.brightaction.model.AbstractEnum;
    import com.brightcove.brightaction.utils.Logger;
    
    /**
     * An enum iterating all the fields of this object, for efficient specification of what fields 
     * you want populated.
     * 
     * @author amanning
     */
    public class FieldsEnum extends AbstractEnum {

        public static const ID:FieldsEnum = new FieldsEnum("ID");
        public static const NAME:FieldsEnum = new FieldsEnum("NAME");
        public static const SHORTDESCRIPTION:FieldsEnum = new FieldsEnum("SHORTDESCRIPTION");
        public static const LONGDESCRIPTION:FieldsEnum = new FieldsEnum("LONGDESCRIPTION");
        public static const CREATIONDATE:FieldsEnum = new FieldsEnum("CREATIONDATE");
        public static const PUBLISHEDDATE:FieldsEnum = new FieldsEnum("PUBLISHEDDATE");
        public static const LASTMODIFIEDDATE:FieldsEnum = new FieldsEnum("LASTMODIFIEDDATE");
        public static const STARTDATE:FieldsEnum = new FieldsEnum("STARTDATE");
        public static const ENDDATE:FieldsEnum = new FieldsEnum("ENDDATE");
        public static const LINKURL:FieldsEnum = new FieldsEnum("LINKURL");
        public static const LINKTEXT:FieldsEnum = new FieldsEnum("LINKTEXT");
        public static const TAGS:FieldsEnum = new FieldsEnum("TAGS");
        public static const VIDEOSTILLURL:FieldsEnum = new FieldsEnum("VIDEOSTILLURL");
        public static const THUMBNAILURL:FieldsEnum = new FieldsEnum("THUMBNAILURL");
        public static const REFERENCEID:FieldsEnum = new FieldsEnum("REFERENCEID");
        public static const LENGTH:FieldsEnum = new FieldsEnum("LENGTH");
        public static const ECONOMICS:FieldsEnum = new FieldsEnum("ECONOMICS");
        public static const ITEMSTATE:FieldsEnum = new FieldsEnum("ITEMSTATE");
        public static const PLAYSTOTAL:FieldsEnum = new FieldsEnum("PLAYSTOTAL");
        public static const PLAYSTRAILINGWEEK:FieldsEnum = new FieldsEnum("PLAYSTRAILINGWEEK");
        public static const VERSION:FieldsEnum = new FieldsEnum("VERSION");
        public static const CUEPOINTS:FieldsEnum = new FieldsEnum("CUEPOINTS");
        public static const SUBMISSIONINFO:FieldsEnum = new FieldsEnum("SUBMISSIONINFO");
        public static const CUSTOMFIELDS:FieldsEnum = new FieldsEnum("CUSTOMFIELDS");
        public static const RELEASEDATE:FieldsEnum = new FieldsEnum("RELEASEDATE");
        public static const FLVURL:FieldsEnum = new FieldsEnum("FLVURL");
        public static const RENDITIONS:FieldsEnum = new FieldsEnum("RENDITIONS");
        public static const GEOFILTERED:FieldsEnum = new FieldsEnum("GEOFILTERED");
        public static const GEORESTRICTED:FieldsEnum = new FieldsEnum("GEORESTRICTED");
        public static const GEOFILTEREXCLUDE:FieldsEnum = new FieldsEnum("GEOFILTEREXCLUDE");
        public static const EXCLUDELISTEDCOUNTRIES:FieldsEnum = 
            new FieldsEnum("EXCLUDELISTEDCOUNTRIES");
        public static const GEOFILTEREDCOUNTRIES:FieldsEnum = 
            new FieldsEnum("GEOFILTEREDCOUNTRIES");
        
        public static const ALLOWEDCOUNTRIES:FieldsEnum = new FieldsEnum("ALLOWEDCOUNTRIES");
        public static const ACCOUNTID:FieldsEnum = new FieldsEnum("ACCOUNTID");
        public static const FLVFULLLENGTH:FieldsEnum = new FieldsEnum("FLVFULLLENGTH");
        public static const VIDEOFULLLENGTH:FieldsEnum = new FieldsEnum("VIDEOFULLLENGTH");
        
        /** The list of all field values */
        private static const allList:Array = [
            ID,
            NAME,
            SHORTDESCRIPTION,
            LONGDESCRIPTION,
            CREATIONDATE,
            PUBLISHEDDATE,
            LASTMODIFIEDDATE,
            STARTDATE,
            ENDDATE,
            LINKURL,
            LINKTEXT,
            TAGS,
            VIDEOSTILLURL,
            THUMBNAILURL,
            REFERENCEID,
            LENGTH,
            ECONOMICS,
            ITEMSTATE,
            PLAYSTOTAL,
            PLAYSTRAILINGWEEK,
            VERSION,
            CUEPOINTS,
            SUBMISSIONINFO,
            CUSTOMFIELDS,
            RELEASEDATE,
            FLVURL,
            RENDITIONS,
            GEOFILTERED,
            GEORESTRICTED,
            GEOFILTEREXCLUDE,
            EXCLUDELISTEDCOUNTRIES,
            GEOFILTEREDCOUNTRIES,
            ALLOWEDCOUNTRIES,
            ACCOUNTID,
            FLVFULLLENGTH,
            VIDEOFULLLENGTH];

        /**
         * Given a list of FieldEnums, return a comma delimited string of all of the values in
         * lowercase
         * 
         * @param list  list of FieldEnums
         * @return      a comma delimited string of all of the values in lowercase
         */
        public static function listToString(list:Array):String {
        
            Logger.debug("list2String", FieldsEnum);
            
            if (list == null || list.length < 1) { return null; }
            
            var result:String = "";
            
            for(var i:Number = 0; i < list.length; i++) {
                
                result += (list[i] as FieldsEnum).value;

                if(i < list.length - 1) { result += ','; }
                
            }

            Logger.debug("result {0}", FieldsEnum, true, result);
            return result;
        
        }

        /**
         * Return a comma delimited string of all of the values in lowercase
         * 
         * @param list  list of FieldEnums
         * @return      a comma delimited string of all of the values in lowercase
         */
        public static function allToString():String {
            
            return listToString(allList);
            
        }
        
        /** 
         * Class Constructor- initialize properties
         * 
         * @param value     the text id representing the FieldEnum, will be sent via the API request
         *                  in lowercase
         */
        public function FieldsEnum(value:String) {
            
            super(value, true);
            
        }
        
    }

}
