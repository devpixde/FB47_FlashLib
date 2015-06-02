package flexUnitTests
{
	import de.devpix.core.IdUtils;
	import de.devpix.model.data.MdNote;
	
	import flexunit.framework.Assert;
	
	public class MdNoteTest
	{	
		public var note : MdNote;
		
		[Before]
		public function setUp():void
		{
			note = new MdNote( IdUtils.getTimeId() );
		}
		
		[After]
		public function tearDown():void
		{
			note = null;
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
		public function testGet_changed():void
		{
			var noteChanged : Number = note.changed;
			note.title = "---";
			Assert.assertFalse( noteChanged === note.changed );
			Assert.assertEquals( note.changed.toString(),  14, note.changed.toString().length );
		}
		
		[Test]
		public function testGet_content():void
		{
			Assert.assertEquals( note.content, '' );
			note = new MdNote( IdUtils.getTimeId(), '', 'lorem ipsum' );
			Assert.assertEquals( note.content, 'lorem ipsum' );
			
		}
		
		[Test]
		public function testSet_content():void
		{
			note.content = 'content'
			Assert.assertEquals( note.content, 'content' );
		}
		
		[Test]
		public function testCreate():void
		{
			var myNote : Object = MdNote.create();
			Assert.assertTrue( myNote is MdNote );		
		}
		
		[Test]
		public function testGet_id():void
		{
			Assert.assertEquals( note.id.toString(),  14, note.id.toString().length );
		}
		
		[Test]
		public function testGet_tagIds():void
		{
			Assert.assertEquals( note.tagIds.toString(), ([]).toString());
		}
		
		[Test]
		public function testSet_tagIds():void
		{
			note.tagIds = ['a','b','c' ]
			Assert.assertEquals( note.tagIds.toString(), (['a','b','c' ]).toString());
		}
		
		[Test]
		public function testGet_title():void
		{
			Assert.assertEquals( note.title, '' );
			note = new MdNote( IdUtils.getTimeId(), 'Hallo Welt' );
			Assert.assertEquals( note.title, 'Hallo Welt' );
			
		}
		
		[Test]
		public function testSet_title():void
		{
			note.title = "Titel";
			Assert.assertEquals( note.title, 'Titel' );
		}
		
		[Test]
		public function testToString():void
		{
			var changedTimeId : Number = IdUtils.getTimeId() + 1;
			var title : String = "Titel";
			var titleLine : String = "=====";
			var tagIds : Array = ['aaaa','bbbb','cccc' ];
			var content : String = '###Some content\n * Hello World';
			
			note.title = title;
			note.tagIds = tagIds;
			note.content = content;
			
			var document : String = '<!--t:aaaa,bbbb,cccc-->\n<!--c:' +changedTimeId.toString() + '-->';
			document += '\n\n' + title;
			document += '\n' + titleLine;
			document += '\n\n' + content;
			Assert.assertEquals( 'Should be: ' + document, document, note.toString());
		}
		
		
	}
}