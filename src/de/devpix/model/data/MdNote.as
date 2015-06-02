package de.devpix.model.data
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import de.devpix.core.IdUtils;
	import de.devpix.core.StringUtils;

	
	/**
	 * MdNote is the model for a markdown - formated Note that has tags and a changed - timestamp
	 * @author Ingo Klemm, info@devpix.de
	 * 
	 */	
	public class MdNote extends EventDispatcher
	{
		//------------------------------------------------------------------
		//
		//	declaration
		//
		//------------------------------------------------------------------
		
		private var _id : Number;
		private var _title : String;
		private var _titleLine : String;
		private var _content : String;
		private var _changed : Number;
		private var _tagIds : Array = [];
		
		[Event(name='changed', type='flash.events.Event']
		
		//------------------------------------------------------------------
		//
		//	constructor
		//
		//------------------------------------------------------------------
		/**
		 *  
		 * @param id id (timestamp of this note)
		 * @param title title of this note
		 * @param content markdown - formated content
		 * @param changed timeid of last change
		 * @param tagIds Array with tag-ids
		 * 
		 */		
		public function MdNote( id : Number, title : String = '', content : String = '', changed : Number = 0, tagIds : Array = null )
		{
			this._id = id;
			this._title = title;
			this._titleLine = titleLine;
			this._content = content;
			this._changed = ( changed === 0 ) ? id : changed;
			this._tagIds = tagIds ? tagIds : _tagIds;
		}
		
		
		//------------------------------------------------------------------
		//
		//	static
		//
		//------------------------------------------------------------------

		/**
		 * creates a MdNote - Object for the current time 
		 * @return 
		 * 
		 */		
		public static function create() : MdNote
		{
			return new MdNote( IdUtils.getTimeId());
		}
		
		
		//------------------------------------------------------------------
		//
		//	public
		//
		//------------------------------------------------------------------
		
		override public function toString() : String
		{
			return StringUtils.str( wrapMeta('t',_tagIds.sort().join(',')))
				.newline(wrapMeta('c',_changed.toString()))
				.newline()
				.newline(_title)
				.newline(_titleLine)
				.newline()
				.newline(_content)
				.toString();
		}
		
		
		//------------------------------------------------------------------
		//
		//	properties: getter/setter
		//
		//------------------------------------------------------------------
		
		/**
		 * id (timestamp) of the node format yyyymmddhhmmss. equals the filename of the note 
		 * @return 
		 * 
		 */		
		public function get id():Number
		{
			return _id;
		}
		
		/**
		 * Array of tag-ids for this note 
		 * @return 
		 * 
		 */		
		public function get tagIds():Array
		{
			return _tagIds;
		}
		
		/**
		 * @private
		 */
		public function set tagIds(value:Array):void
		{
			if( value.sort().toString() !== _tagIds.sort().toString() )
			{
				_tagIds = value;
				change();
			}
		}
		
		/**
		 * Timestamp of last change in id-format (yyyymmddhhmmss) 
		 * @return 
		 * 
		 */		
		public function get changed():Number
		{
			return _changed;
		}
		
		/**
		 * The markdown-formated conent of the note 
		 * @return 
		 * 
		 */		
		public function get content():String
		{
			return _content;
		}
		
		/**
		 * @private
		 */
		public function set content(value:String):void
		{
			if( value !== _content )
			{
				_content = value;
				change();
			}
		}
		
		/**
		 * Returns the title of the note 
		 * @return 
		 * 
		 */		
		public function get title():String
		{
			return _title;
		}
		
		/**
		 * @private
		 */		
		public function set title(value:String):void
		{
			if( value !== _title )
			{
				_title = value;
				this._titleLine = titleLine;
				change();
			}
		}
		
		
		//------------------------------------------------------------------
		//
		//	private
		//
		//------------------------------------------------------------------
		
		private function change() : void
		{
			// +1 : one second more, so a change is detected on a synchronous thread...
			this._changed = IdUtils.getTimeId() + 1;
			this.dispatchEvent( new Event( Event.CHANGE ));
		}
		
		private function get titleLine() : String
		{
			return _title.replace( /./g, '=' );
		}
		
		private function wrapMeta( type : String, value : String ) : String
		{
			return '<!--' + type + ':' + value + '-->';	
		}
		
	}
}