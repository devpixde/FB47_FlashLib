package flexUnitTests
{
	import de.devpix.core.StringUtils;
	import de.devpix.model.data.Tag;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
		
	public class TagTest
	{		
		
		public var tag : Tag;
		public var name : String;
		public var description : String = "Eine Test Beschreibung";
		public var secondName : String = "Zweiter Name";
		
		[Before]
		public function setUp():void
		{
			name = StringUtils.getRandomId(10)  + ' b,c\nddd'  ;
			tag = new Tag( name );
		}
		
		[After]
		public function tearDown():void
		{
			tag = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testGet_description():void
		{
			assertEquals( tag.description, '');
			tag.description = description;
			assertEquals( tag.description, description );
		}
		
		[Test]
		public function testSet_description():void
		{
			assertEquals( tag.description, '');
			tag.description = description;
			assertEquals( tag.description, description );
		}
		
		[Test]
		public function testGet_id():void
		{
			assertEquals( tag.id, name.toLowerCase().replace(/(\s|,)/g,'_'));
		}
		
		[Test]
		public function testGet_name():void
		{
			assertEquals( tag.name, name);
		}
		
		[Test]
		public function testSet_name():void
		{
			tag.name = secondName;
			assertEquals( tag.name, secondName);
		}
		
		[Test]
		public function test_init():void
		{
			var n : Object = new Tag('tagid');
			Assert.assertNotNull(n);
			Assert.assertTrue( n is Tag );
		}
	}
}