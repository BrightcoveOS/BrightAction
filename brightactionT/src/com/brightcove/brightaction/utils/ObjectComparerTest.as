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
    public class ObjectComparerTest {

        //------------------------------------------------------------------------------------------
        // Methods
        //------------------------------------------------------------------------------------------
        [Test]
        public function testValidConstruction():void {

            Assert.assertNotNull(new ObjectComparer());

        }

        [Test]
        public function testCompare_nulls_equals():void {
            
            Assert.assertTrue(
                "should be equal",
                new ObjectComparer().equals(null, null)
            );
            
        }

        [Test]
        public function testCompare_anonObjects_Equals():void {

            Assert.assertTrue(
                "should be equal",
                new ObjectComparer().equals(
                    {a:1,b:2,c:3},
                    {a:1,b:2,c:3})
                );
                                
        }

        [Test]
        public function testCompare_anonObjects_EqualsSameVar():void {

            var object:Object = {a:1,b:2,c:3};
            Assert.assertTrue("should be equal", new ObjectComparer().equals(object,object));
                                
        }

        [Test]
        public function testCompare_anonObjects_EqualsSameVarNull():void {

            Assert.assertTrue("should be equal", new ObjectComparer().equals(null,null));
                                
        }

        [Test]
        public function testCompare_anonObjects_NotEquals():void {

            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(
                    {a:1,b:2,c:3},
                    {a:1,b:2,c:4})
                );
                                
        }

        [Test]
        public function testCompare_anonObjectsAndPrimative_NotEquals():void {

            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(
                    {a:1,b:2,c:3},
                    false)
                );
                                
        }
        
        [Test]
        public function testCompare_anonObjects_NotEqualsNull():void {

            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(
                    null,
                    {a:1,b:2,c:4})
                );
                                
        }

        [Test]
        public function testCompare_types_equals():void {

            var customer1:FakeCustomer = new FakeCustomer();
            customer1.customerId = 123;
            customer1.name = "testName";
            
            var customer2:FakeCustomer = new FakeCustomer();
            customer2.customerId = 123;
            customer2.name = "testName";
            
            Assert.assertTrue("should be equal", new ObjectComparer().equals(customer1,customer2));
                                
        }

        [Test]
        public function testCompare_typesEqual_valuesNot():void {

            var customer1:FakeCustomer = new FakeCustomer();
            customer1.customerId = 123;
            customer1.name = "testName";
            
            var customer2:FakeCustomer2 = new FakeCustomer2();
            customer2.customerId = 123;
            customer2.name = "testName";
            
            Assert.assertFalse(
                "should not be equal, types different",
                new ObjectComparer().equals(customer1,customer2));
                                
        }

        [Test]
        public function testCompare_typesNotEqual_valuesEqual():void {

            var customer1:FakeCustomer = new FakeCustomer();
            customer1.customerId = 123;
            customer1.name = "testName";
            
            var customer2:FakeCustomer = new FakeCustomer();
            customer2.customerId = 1235;
            customer2.name = "testNames";
            
            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(customer1,customer2));
                                
        }

        [Test]
        public function testCompare_typesNotEqual():void {

            var customer:FakeCustomer = new FakeCustomer();
            customer.customerId = 123;
            customer.name = "testName";
            
            var order:FakeOrder = new FakeOrder();
            order.orderId = 123;
            order.value = 3400;
            
            Assert.assertFalse(
                "should not be equal, types different",
                new ObjectComparer().equals(customer,order));
                                
        }

        [Test]
        public function testCompareCollection_primativeEqual():void {

            var collection1:Array = [1, 2, 3,[false,false,true],"string"];
            var collection2:Array = [1, 2, 3,[false,false,true],"string"];
            
            Assert.assertTrue(
                "should be equal",
                new ObjectComparer().equals(collection1,collection2));
                                                
        }
        
        [Test]
        public function testCompareCollection_primativesNotEqual():void {

            var collection1:Array = [1, 2, 3,[false,false,true],"string"];
            var collection2:Array = [1, 2, 3,[false,false,[]],"string"];
            
            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(collection1,collection2));
                                                
        }
        
        [Test]
        public function testCompareCollection_oneCollectionOneNot():void {

            var collection1:Array = [1, 2, 3,[false,false,true],"string"];
            var object:Object = {a:1,b:2,c:3};
            
            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(collection1,object));
                                                
        }

        [Test]
        public function testCompareCollection_typesValuesEqual():void {

            var customer:FakeCustomer = new FakeCustomer();
            customer.customerId = 123;
            customer.name = "testName";
            
            var order:FakeOrder = new FakeOrder();
            order.orderId = 123;
            order.value = 3400;
            
            var collection1:Array = [customer, customer, order];
            var collection2:Array = [customer, customer, order];
            
            Assert.assertTrue(
                "should be equal",
                new ObjectComparer().equals(collection1,collection2));
                                                
        }

        [Test]
        public function testCompareCollection_typesValuesNotEqual():void {

            var customer:FakeCustomer = new FakeCustomer();
            customer.customerId = 123;
            customer.name = "testName";
            
            var order:FakeOrder = new FakeOrder();
            order.orderId = 123;
            order.value = 3400;
            
            var collection1:Array = [customer, customer, customer];
            var collection2:Array = [customer, customer, order];
            
            Assert.assertFalse(
                "should not be equal",
                new ObjectComparer().equals(collection1,collection2));
                                                
        }

        [Test]
        public function testCompareCollection_typesNotEqual():void {

            var customer1:FakeCustomer = new FakeCustomer();
            customer1.customerId = 123;
            customer1.name = "testName";
            
            var customer2:FakeCustomer2 = new FakeCustomer2();
            customer2.customerId = 123;
            customer2.name = "testName";
            
            var collection1:Array = [customer1, customer1, customer1];
            var collection2:Array = [customer2, customer2, customer2];
            
            Assert.assertFalse(
                "should be not be equal",
                new ObjectComparer().equals(collection1,collection2));
                                                
        }

        [Test]
        public function testCompareGenericObject_propertiesInDifferentOrder():void {
            
            var object1:Object = {alpha:1, beta:2, gamma:3};
            var object2:Object = {beta:2, alpha:1, gamma:3};
            
            Assert.assertTrue(
                "should be equal",
                new ObjectComparer().equals(object1, object2));
            
        }
        
    }        

}

//--------------------------------------------------------------------------------------------------
// Inner Classes
//--------------------------------------------------------------------------------------------------
/**
 * Fake object to use in testing to verify comparision
 *  
 * @author amanning
 */
class FakeCustomer {
    
    public var customerId:Number;
    public var name:String;

}

/**
 * Fake object to use in testing to verify comparision
 *  
 * @author amanning
 */
class FakeCustomer2 {
    
    public var customerId:Number;
    public var name:String;

}

/**
 * Fake object to use in testing to verify comparision
 *  
 * @author amanning
 */
class FakeOrder {
    
    public var orderId:Number;
    public var value:Number;

}
