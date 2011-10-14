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
     * A Enumeration of the types of supported Geo Filtered Countries
     *
     * @author amanning
     */
    public class GeoFilteredCountriesEnum extends AbstractEnum {
        
        /** Class Constructor- initialize properties */
        function GeoFilteredCountriesEnum(value:String) {
            
            super(value);
        
        }
        
        /**
         * Given a two letter country code, return the corresponding Country Enum
         * 
         * @param countryCode   two letter country code 
         * @return              corresponding Country Enum
         * @see http://www.iso.org/iso/english_country_names_and_code_elements
         */
        public static function countryFromCode(countryCode:String):GeoFilteredCountriesEnum {
            
            if(countryCode == null) { return null; }
            if(countryCode.length != 2) { return null; }
            if(!lookup.hasOwnProperty(countryCode)) {return null;}
            
            var foo:Object = lookup;
            
            return lookup[countryCode];
        
        }
        
        /** List of all available Geo-Filterable countries */
        private static const countries:Array = [
            Afghanistan, Aland_Islands, Albania, Algeria, American_Samoa, Andorra, Angola, 
            Anguilla, Antarctica, Antigua_Barbuda, Argentina, Armenia, Aruba,
            Australia, Austria, Azerbaijan, Bahamas, Bahrain, Bangladesh, Barbados, Belarus, 
            Belgium, Belize, Benin, Bermuda, Bhutan, Bolivia, Bosnia_Herzegovina, Botswana, 
            Bouvet_Island, Brazil, British_Indian_Ocean_Territory, Brunei_Darussalam, Bulgaria, 
            Burkina_Faso, Burundi, Cambodia, Cameroon, Canada, Cape_Verde, Cayman_Islands, 
            Central_African_Republic, Chad, Chile, China, Christmas_Island, Cocos_Islands, 
            Colombia, Comoros, Congo, Congo_Democratic_Republic, Cook_Islands, Costa_Rica, 
            Cote_DIvoire, Croatia, Cuba, Cyprus, Czech_Republic, Denmark, Djibouti, Dominica, 
            Dominican_Republic, Ecuador, Egypt, El_Salvador, Equatorial_Guinea, Eritrea, 
            Estonia, Ethiopia, Falkland_Islands, Faroe_Islands, Fiji, Finland, France, 
            French_Guiana, French_Polynesia, French_Southern_Territories, Gabon, Gambia, 
            Georgia, Germany, Ghana, Gibraltar, Greece, Greenland, Grenada, Guadeloupe, 
            Guam, Guatemala, Guernsey, Guinea, Guinea_Bissau, Guyana, Haiti, Heard_Island_McDonald_Islands, 
            Vatican_City, Honduras, Hong_Kong, Hungary, Iceland, India, Indonesia, Iran, Iraq, 
            Ireland, Israel, Italy, Jamaica, Japan, Jordan, Jersey, Kazakhstan, Kenya, Kiribati, 
            Isle_of_Man, Korea_Democratic_Peoples_Republic, Korea_Republic_of, Kuwait, Kyrgyzstan, 
            Lao_Peoples_Democratic_Republic, Latvia, Lebanon, Lesotho, Liberia, 
            Libyan_Arab_Jamahiriya, Liechtenstein, Lithuania, Luxembourg, Macao, Macedonia, 
            Madagascar, Malawi, Malaysia, Maldives, Mali, Malta, Marshall_Islands, 
            Martinique, Mauritania, Mauritius, Mayotte, Mexico, Micronesia, Moldova, Monaco, 
            Mongolia, Montenegro, Montserrat, Morocco, Mozambique, Myanmar, Namibia, Nauru, 
            Nepal, Netherlands, Netherlands_Antilles, New_Caledonia, New_Zealand, Nicaragua, 
            Niger, Nigeria, Niue, Norfolk_Island, Northern_Mariana_Islands, Norway, Oman, 
            Pakistan, Palau, Palestinian_Territory_Occupied, Panama, Papua_New_Guinea, 
            Paraguay, Peru, Philippines, Pitcairn, Poland, Portugal, Puerto_Rico, Qatar, 
            Reunion, Romania, Russian_Federation, Rwanda, Saint_Barthelemy, Saint_Helena, 
            Saint_Kitts_Nevis, Saint_Lucia, Saint_Martin, Saint_Pierre_Miquelon, 
            Saint_Vincent_and_The_Grenadines, Samoa, San_Marino, Sao_Tome_and_Principe, 
            Saudi_Arabia, Senegal, Serbia, Seychelles, Sierra_Leone, Singapore, Slovakia, 
            Slovenia, Solomon_Islands, Somalia, South_Africa, South_Georgia, Spain, Sri_Lanka, 
            Sudan, Suriname, Svalbard_and_Jan_Mayen, Swaziland, Sweden, Switzerland, Syrian, 
            Taiwan, Tajikistan, Tanzania, Thailand, Timor_Leste, Togo, Tokelau, Tonga, 
            Trinidad_and_Tobago, Tunisia, Turkey, Turkmenistan, Turks_Caicos_Islands, Tuvalu, 
            Uganda, Ukraine, United_Arab_Emirates, United_Kingdom, United_States, 
            United_States_Minor_Outlying_Islands, Uruguay, Uzbekistan, Vanuatu, Venezuela, 
            Viet_Nam, Virgin_Islands_British, Virgin_Islands_US, Wallis_and_Futuna, 
            Western_Sahara, Yemen, Zambia, Zimbabwe, US_Military];
        
        public static const Afghanistan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("af");
        public static const Aland_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ax");
        public static const Albania:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("al");
        public static const Algeria:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("dz");
        public static const American_Samoa:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("AS");
        public static const Angola:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ao");
        public static const Andorra:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ad");
        public static const Anguilla:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ai");
        public static const Antarctica:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("aq");
        public static const Antigua_Barbuda:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ag");
        public static const Argentina:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ar");
        public static const Armenia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("am");
        public static const Aruba:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("aw");
        public static const Australia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("au");
        public static const Austria:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("at");
        public static const Azerbaijan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("az");
        public static const Bahamas:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bs");
        public static const Bahrain:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bh");
        public static const Bangladesh:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bd");
        public static const Barbados:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bb");
        public static const Belarus:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("by");
        public static const Belgium:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("be");
        public static const Belize:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bz");
        public static const Benin:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bj");
        public static const Bermuda:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bm");
        public static const Bhutan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bt");
        public static const Bolivia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bo");
        public static const Bosnia_Herzegovina:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ba");
        public static const Botswana:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bw");
        public static const Bouvet_Island:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bv");
        public static const Brazil:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("br");
        public static const British_Indian_Ocean_Territory:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("io");
        public static const Brunei_Darussalam:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bn");
        public static const Bulgaria:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bg");
        public static const Burkina_Faso:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bf");
        public static const Burundi:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bi");
        public static const Cambodia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kh");
        public static const Cameroon:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cm");
        public static const Canada:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ca");
        public static const Cape_Verde:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cv");
        public static const Cayman_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ky");
        public static const Central_African_Republic:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cf");
        public static const Chad:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("td");
        public static const Chile:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cl");
        public static const China:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cn");
        public static const Christmas_Island:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cx");
        public static const Cocos_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cc");
        public static const Colombia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("co");
        public static const Comoros:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("km");
        public static const Congo:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cg");
        public static const Congo_Democratic_Republic:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cd");
        public static const Cook_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ck");
        public static const Costa_Rica:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cr");
        public static const Cote_DIvoire:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ci");
        public static const Croatia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("hr");
        public static const Cuba:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cu");
        public static const Cyprus:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cy");
        public static const Czech_Republic:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("cz");
        public static const Denmark:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("dk");
        public static const Djibouti:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("dj");
        public static const Dominica:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("dm");
        public static const Dominican_Republic:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("DO");
        public static const Ecuador:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ec");
        public static const Egypt:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("eg");
        public static const El_Salvador:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sv");
        public static const Equatorial_Guinea:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gq");
        public static const Eritrea:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("er");
        public static const Estonia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ee");
        public static const Ethiopia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("et");
        public static const Falkland_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("fk");
        public static const Faroe_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("fo");
        public static const Fiji:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("fj");
        public static const Finland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("fi");
        public static const France:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("fr");
        public static const French_Guiana:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gf");
        public static const French_Polynesia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pf");
        public static const French_Southern_Territories:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tf");
        public static const Gabon:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ga");
        public static const Gambia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gm");
        public static const Georgia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ge");
        public static const Germany:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("de");
        public static const Ghana:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gh");
        public static const Gibraltar:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gi");
        public static const Greece:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gr");
        public static const Greenland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gl");
        public static const Grenada:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gd");
        public static const Guadeloupe:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gp");
        public static const Guam:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gu");
        public static const Guatemala:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gt");
        public static const Guernsey:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gg");
        public static const Guinea:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gn");
        public static const Guinea_Bissau:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gw");
        public static const Guyana:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gy");
        public static const Haiti:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ht");
        public static const Heard_Island_McDonald_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("hm");
        public static const Vatican_City:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("va");
        public static const Honduras:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("hn");
        public static const Hong_Kong:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("hk");
        public static const Hungary:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("hu");
        public static const Iceland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("IS");
        public static const India:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("IN");
        public static const Indonesia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("id");
        public static const Iran:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ir");
        public static const Iraq:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("iq");
        public static const Ireland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ie");
        public static const Isle_of_Man:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("im");
        public static const Israel:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("il");
        public static const Italy:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("it");
        public static const Jamaica:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("jm");
        public static const Japan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("jp");
        public static const Jordan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("jo");
        public static const Jersey:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("je");
        public static const Kazakhstan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kz");
        public static const Kenya:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ke");
        public static const Kiribati:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ki");
        public static const Korea_Democratic_Peoples_Republic:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kp");
        public static const Korea_Republic_of:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kr");
        public static const Kuwait:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kw");
        public static const Kyrgyzstan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kg");
        public static const Lao_Peoples_Democratic_Republic:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("la");
        public static const Latvia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lv");
        public static const Lebanon:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lb");
        public static const Lesotho:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ls");
        public static const Liberia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lr");
        public static const Libyan_Arab_Jamahiriya:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ly");
        public static const Liechtenstein:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("li");
        public static const Lithuania:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lt");
        public static const Luxembourg:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lu");
        public static const Macao:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mo");
        public static const Macedonia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mk");
        public static const Madagascar:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mg");
        public static const Malawi:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mw");
        public static const Malaysia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("my");
        public static const Maldives:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mv");
        public static const Mali:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ml");
        public static const Malta:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mt");
        public static const Marshall_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mh");
        public static const Martinique:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mq");
        public static const Mauritania:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mr");
        public static const Mauritius:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mu");
        public static const Mayotte:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("yt");
        public static const Mexico:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mx");
        public static const Micronesia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("fm");
        public static const Moldova:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("md");
        public static const Monaco:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mc");
        public static const Mongolia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mn");
        public static const Montenegro:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("me");
        public static const Montserrat:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ms");
        public static const Morocco:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ma");
        public static const Mozambique:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mz");
        public static const Myanmar:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mm");
        public static const Namibia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("na");
        public static const Nauru:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("nr");
        public static const Nepal:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("np");
        public static const Netherlands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("nl");
        public static const Netherlands_Antilles:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("an");
        public static const New_Caledonia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("nc");
        public static const New_Zealand:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("nz");
        public static const Nicaragua:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ni");
        public static const Niger:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ne");
        public static const Nigeria:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ng");
        public static const Niue:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("nu");
        public static const Norfolk_Island:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("nf");
        public static const Northern_Mariana_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mp");
        public static const Norway:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("no");
        public static const Oman:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("om");
        public static const Pakistan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pk");
        public static const Palau:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pw");
        public static const Palestinian_Territory_Occupied:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ps");
        public static const Panama:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pa");
        public static const Papua_New_Guinea:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pg");
        public static const Paraguay:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("py");
        public static const Peru:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pe");
        public static const Philippines:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ph");
        public static const Pitcairn:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pn");
        public static const Poland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pl");
        public static const Portugal:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pt");
        public static const Puerto_Rico:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pr");
        public static const Qatar:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("qa");
        public static const Reunion:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("re");
        public static const Romania:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ro");
        public static const Russian_Federation:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ru");
        public static const Rwanda:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("rw");
        public static const Saint_Barthelemy:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("bl");
        public static const Saint_Helena:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sh");
        public static const Saint_Kitts_Nevis:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("kn");
        public static const Saint_Lucia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lc");
        public static const Saint_Martin:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("mf");
        public static const Saint_Pierre_Miquelon:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("pm");
        public static const Saint_Vincent_and_The_Grenadines:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("vc");
        public static const Samoa:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ws");
        public static const San_Marino:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sm");
        public static const Sao_Tome_and_Principe:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("st");
        public static const Saudi_Arabia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sa");
        public static const Senegal:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sn");
        public static const Serbia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("rs");
        public static const Seychelles:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sc");
        public static const Sierra_Leone:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sl");
        public static const Singapore:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sg");
        public static const Slovakia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sk");
        public static const Slovenia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("si");
        public static const Solomon_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sb");
        public static const Somalia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("so");
        public static const South_Africa:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("za");
        public static const South_Georgia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gs");
        public static const Spain:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("es");
        public static const Sri_Lanka:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("lk");
        public static const Sudan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sd");
        public static const Suriname:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sr");
        public static const Svalbard_and_Jan_Mayen:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sj");
        public static const Swaziland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sz");
        public static const Sweden:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("se");
        public static const Switzerland:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ch");
        public static const Syrian:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("sy");
        public static const Taiwan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tw");
        public static const Tajikistan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tj");
        public static const Tanzania:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tz");
        public static const Thailand:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("th");
        public static const Timor_Leste:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tl");
        public static const Togo:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tg");
        public static const Tokelau:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tk");
        public static const Tonga:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("to");
        public static const Trinidad_and_Tobago:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tt");
        public static const Tunisia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tn");
        public static const Turkey:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tr");
        public static const Turkmenistan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tm");
        public static const Turks_Caicos_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tc");
        public static const Tuvalu:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("tv");
        public static const Uganda:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ug");
        public static const Ukraine:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ua");
        public static const United_Arab_Emirates:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ae");
        public static const United_Kingdom:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("gb");
        public static const United_States:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("us");
        public static const United_States_Minor_Outlying_Islands:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("um");
        public static const Uruguay:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("uy");
        public static const Uzbekistan:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("uz");
        public static const Vanuatu:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("vu");
        public static const Venezuela:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ve");
        public static const Viet_Nam:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("vn");
        public static const Virgin_Islands_British:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("vg");
        public static const Virgin_Islands_US:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("vi");
        public static const Wallis_and_Futuna:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("wf");
        public static const Western_Sahara:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("eh");
        public static const Yemen:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("ye");
        public static const Zambia:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("zm");
        public static const Zimbabwe:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("zw");
        public static const US_Military:GeoFilteredCountriesEnum = new GeoFilteredCountriesEnum("usmil");
    
        /** A lookup table for country codes and names */
        private static const lookup:Object = {
            af:Afghanistan,
            ax:Aland_Islands,
            al:Albania,
            dz:Algeria,
            AS:American_Samoa,
            ad:Andorra,
            ao:Angola,
            ai:Anguilla,
            aq:Antarctica,
            ag:Antigua_Barbuda,
            ar:Argentina,
            am:Armenia,
            aw:Aruba,
            au:Australia,
            at:Austria,
            az:Azerbaijan,
            bs:Bahamas,
            bh:Bahrain,
            bd:Bangladesh,
            bb:Barbados,
            by:Belarus,
            be:Belgium,
            bz:Belize,
            bj:Benin,
            bm:Bermuda,
            bt:Bhutan,
            bo:Bolivia,
            ba:Bosnia_Herzegovina,
            bw:Botswana,
            bv:Bouvet_Island,
            br:Brazil,
            io:British_Indian_Ocean_Territory,
            bn:Brunei_Darussalam,
            bg:Bulgaria,
            bf:Burkina_Faso,
            bi:Burundi,
            kh:Cambodia,
            cm:Cameroon,
            ca:Canada,
            cv:Cape_Verde,
            ky:Cayman_Islands,
            cf:Central_African_Republic,
            td:Chad,
            cl:Chile,
            cn:China,
            cx:Christmas_Island,
            cc:Cocos_Islands,
            co:Colombia,
            km:Comoros,
            cg:Congo,
            cd:Congo_Democratic_Republic,
            ck:Cook_Islands,
            cr:Costa_Rica,
            ci:Cote_DIvoire,
            hr:Croatia,
            cu:Cuba,
            cy:Cyprus,
            cz:Czech_Republic,
            dk:Denmark,
            dj:Djibouti,
            dm:Dominica,
            DO:Dominican_Republic,
            ec:Ecuador,
            eg:Egypt,
            sv:El_Salvador,
            gq:Equatorial_Guinea,
            er:Eritrea,
            ee:Estonia,
            et:Ethiopia,
            fk:Falkland_Islands,
            fo:Faroe_Islands,
            fj:Fiji,
            fi:Finland,
            fr:France,
            gf:French_Guiana,
            pf:French_Polynesia,
            tf:French_Southern_Territories,
            ga:Gabon,
            gm:Gambia,
            ge:Georgia,
            de:Germany,
            gh:Ghana,
            gi:Gibraltar,
            gr:Greece,
            gl:Greenland,
            gd:Grenada,
            gp:Guadeloupe,
            gu:Guam,
            gt:Guatemala,
            gg:Guernsey,
            gn:Guinea,
            gw:Guinea_Bissau,
            gy:Guyana,
            ht:Haiti,
            hm:Heard_Island_McDonald_Islands,
            hn:Honduras,
            hk:Hong_Kong,
            hu:Hungary,
            IS:Iceland,
            IN:India,
            id:Indonesia,
            ir:Iran,
            iq:Iraq,
            ie:Ireland,
            im:Isle_of_Man,
            il:Israel,
            it:Italy,
            jm:Jamaica,
            jp:Japan,
            je:Jersey,
            jo:Jordan,
            kz:Kazakhstan,
            ke:Kenya,
            ki:Kiribati,
            kp:Korea_Democratic_Peoples_Republic,
            kr:Korea_Republic_of,
            kw:Kuwait,
            kg:Kyrgyzstan,
            la:Lao_Peoples_Democratic_Republic,
            lv:Latvia,
            lb:Lebanon,
            ls:Lesotho,
            lr:Liberia,
            ly:Libyan_Arab_Jamahiriya,
            li:Liechtenstein,
            lt:Lithuania,
            lu:Luxembourg,
            mo:Macao,
            mk:Macedonia,
            mg:Madagascar,
            mw:Malawi,
            my:Malaysia,
            mv:Maldives,
            ml:Mali,
            mt:Malta,
            mh:Marshall_Islands,
            mq:Martinique,
            mr:Mauritania,
            mu:Mauritius,
            yt:Mayotte,
            mx:Mexico,
            fm:Micronesia,
            md:Moldova,
            mc:Monaco,
            mn:Mongolia,
            me:Montenegro,
            ms:Montserrat,
            ma:Morocco,
            mz:Mozambique,
            mm:Myanmar,
            na:Namibia,
            nr:Nauru,
            np:Nepal,
            nl:Netherlands,
            an:Netherlands_Antilles,
            nc:New_Caledonia,
            nz:New_Zealand,
            ni:Nicaragua,
            ne:Niger,
            ng:Nigeria,
            nu:Niue,
            nf:Norfolk_Island,
            mp:Northern_Mariana_Islands,
            no:Norway,
            om:Oman,
            pk:Pakistan,
            pw:Palau,
            ps:Palestinian_Territory_Occupied,
            pa:Panama,
            pg:Papua_New_Guinea,
            py:Paraguay,
            pe:Peru,
            ph:Philippines,
            pn:Pitcairn,
            pl:Poland,
            pt:Portugal,
            pr:Puerto_Rico,
            qa:Qatar,
            re:Reunion,
            ro:Romania,
            ru:Russian_Federation,
            rw:Rwanda,
            bl:Saint_Barthelemy,
            sh:Saint_Helena,
            kn:Saint_Kitts_Nevis,
            lc:Saint_Lucia,
            mf:Saint_Martin,
            pm:Saint_Pierre_Miquelon,
            vc:Saint_Vincent_and_The_Grenadines,
            ws:Samoa,
            sm:San_Marino,
            st:Sao_Tome_and_Principe,
            sa:Saudi_Arabia,
            sn:Senegal,
            rs:Serbia,
            sc:Seychelles,
            sl:Sierra_Leone,
            sg:Singapore,
            sk:Slovakia,
            si:Slovenia,
            sb:Solomon_Islands,
            so:Somalia,
            za:South_Africa,
            gs:South_Georgia,
            es:Spain,
            lk:Sri_Lanka,
            sd:Sudan,
            sr:Suriname,
            sj:Svalbard_and_Jan_Mayen,
            sz:Swaziland,
            se:Sweden,
            ch:Switzerland,
            sy:Syrian,
            tw:Taiwan,
            tj:Tajikistan,
            tz:Tanzania,
            th:Thailand,
            tl:Timor_Leste,
            tg:Togo,
            tk:Tokelau,
            to:Tonga,
            tt:Trinidad_and_Tobago,
            tn:Tunisia,
            tr:Turkey,
            tm:Turkmenistan,
            tc:Turks_Caicos_Islands,
            tv:Tuvalu,
            ug:Uganda,
            ua:Ukraine,
            ae:United_Arab_Emirates,
            gb:United_Kingdom,
            us:United_States,
            um:United_States_Minor_Outlying_Islands,
            uy:Uruguay,
            uz:Uzbekistan,
            vu:Vanuatu,
            va:Vatican_City,
            ve:Venezuela,
            vn:Viet_Nam,
            vg:Virgin_Islands_British,
            vi:Virgin_Islands_US,
            wf:Wallis_and_Futuna,
            eh:Western_Sahara,
            ye:Yemen,
            zm:Zambia,
            zw:Zimbabwe,
            usmil:US_Military}

    
    }

}
