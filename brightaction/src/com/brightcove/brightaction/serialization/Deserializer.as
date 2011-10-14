/**
 *
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
package com.brightcove.brightaction.serialization {
    
    import com.adobe.serialization.json.JSON;
    import com.brightcove.brightaction.model.BCVideo;
    import com.brightcove.brightaction.model.CuePoint;
    import com.brightcove.brightaction.model.EconomicsEnum;
    import com.brightcove.brightaction.model.ItemCollection;
    import com.brightcove.brightaction.model.ItemStateEnum;
    import com.brightcove.brightaction.model.MediaResponse;
    import com.brightcove.brightaction.model.Rendition;
    import com.brightcove.brightaction.utils.Logger;
    import com.brightcove.brightaction.utils.ObjectChecker;
    
    /**
     * An Object responsible for serializing JSON from the Brightcove Media APIs into native
     * ActionScript objects.
     *
     * @author amanning
     */
    public class Deserializer implements IBrightcoveDeserializer {
        
        /** Given a json-decoded object, build an Item Collection out of it */
        private function itemCollectionFromJSON(json:String):MediaResponse {
            
            if (json == null) {
                return null;
            }
            
            if (json.length == 0) {
                return null;
            }
            
            var decodedObject:Object = (JSON.decode(json) as Object);
            
            if (decodedObject.hasOwnProperty("items") &&
                decodedObject.hasOwnProperty("page_size") &&
                decodedObject.hasOwnProperty("page_number") &&
                decodedObject.hasOwnProperty("total_count")) {
                
                Logger.debug("decoding as Item Collection", this);
                
                var itemCollection:ItemCollection = new ItemCollection();
                itemCollection.items = decodedObject.items;
                itemCollection.pageSize = decodedObject.page_size;
                itemCollection.pageNumber = decodedObject.page_number;
                itemCollection.totalCount = decodedObject.total_count;
                
                return new MediaResponse(null,itemCollection);
                
            }
            
            return new MediaResponse(decodedObject, null);
        
        }
        
        /**
         * Given a valid JSON list of videos, convert it into generic native AS objects
         *
         * @param json  the valid JSON string to convert
         * @return      generic object representation of the JSON string
         */
        public function json2Object(json:String):MediaResponse {
            
            Logger.debug("json2Object", this);
            
            return itemCollectionFromJSON(json);
        
        }
        
        /**
         * Given a valid JSON list of videos, convert the items property into a typed ActionScript
         * Object
         *
         * @param json          the valid JSON string to convert
         * @return              an ArrayCollection of typed videos
         */
        public function json2VideoList(json:String):MediaResponse {

            Logger.debug("json2VideoList", this);
            
            var result:MediaResponse = itemCollectionFromJSON(json);

            if(result == null) { return null; }

            if (result.error != null) {
                
                Logger.debug("Error found {0}", this, true, result.error);
                return result;
                
            }
            
            // iterate over the set and generate Video Objects
            var typedItems:Array = new Array();
            
            for each (var item:Object in result.itemCollection.items) {
                
                typedItems.push(createVideoFromObject(item));
                
            }
            
            result.itemCollection.items = typedItems;
            
            return result;
        
        }
        
        /**
         * Given a JSON generic object representing a Video, return a typed Video object
         *
         * @param objectToConvert   a JSON generic object representing a Video
         * @return                  a typed video object
         */
        private function createVideoFromObject(objectToConvert:Object):BCVideo {
            
            var video:BCVideo = 
                new BCVideo(
                    ifDefined(objectToConvert,"id") as Number,
                    ifDefined(objectToConvert,"accountId") as Number,
                    ifDefined(objectToConvert,"length") as Number,
                    convertDate(Number(ifDefined(objectToConvert, "publishedDate"))),
                    convertDate(Number(ifDefined(objectToConvert,"lastModifiedDate"))) ,
                    ifDefined(objectToConvert,"videoStillURL") as String,
                    ifDefined(objectToConvert,"thumbnailURL") as String,
                    ifDefined(objectToConvert,"FLVURL") as String,
                    ifDefined(objectToConvert,"videoFullLength") as String,
                    ifDefined(objectToConvert,"name")  as String,
                    ifDefined(objectToConvert,"shortDescription") as String,
                    ifDefined(objectToConvert,"longDescription") as String,
                    convertDate(Number(ifDefined(objectToConvert,"creationDate"))),
                    convertDate(Number(ifDefined(objectToConvert,"startDate"))),
                    convertDate(Number(ifDefined(objectToConvert,"endDate"))),
                    ifDefined(objectToConvert,"linkURL") as String,
                    ifDefined(objectToConvert,"linkText") as String,
                    ifDefined(objectToConvert,"tags") as Array,
                    ifDefined(objectToConvert,"referenceId") as String,
                    EconomicsEnum.createFromValue(ifDefined(objectToConvert,"economics")),
                    ItemStateEnum.createFromValue(ifDefined(objectToConvert,"itemState")),
                    ifDefined(objectToConvert,"playsTotal") as Number,
                    ifDefined(objectToConvert,"playsTrailingWeek") as Number,
                    CuePoint.createFromList(objectToConvert.cuePoints),
                    ifDefined(objectToConvert,"customFields") as Object,
                    Rendition.createFromList(objectToConvert.renditions),
                    ifDefined(objectToConvert,"geoRestricted") as Boolean,
                    ifDefined(objectToConvert,"geoFilterExclude") as Boolean,
                    ifDefined(objectToConvert,"geoFilteredCountries") as Array);
        
            return video;
        
        }
        
        /**
         * Given a UNIX date, the format for the Media APIs, return an ActionScript Date Object
         * 
         * @param unixDate  a UNIX date, the format for the Media APIs
         * @return          the format for the Media APIs, return an ActionScript Date Object
         */ 
        private function convertDate(unixDate:Number):Date {
            
            if(unixDate <= 0) { return null; }
            
            return new Date(unixDate);
        
        }
        
        /**
         * Return the object if it is defined, null otherwise
         * 
         * @param object    object that may contain property
         * @param property  the property name
         * @return          the value of the property if it exists, null otherwise
         */
        private function ifDefined(object:Object, property:String):Object {
            
            return ObjectChecker.ifDefined(object, property);
            
        }
    
    }

}