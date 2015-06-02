package de.devpix.model.data
{
	/**
	 *  
	 * @author Ingo Klemm, info@devpix.de 
	 *  
	 * 
	 */	
	public class Tag
	{
		//------------------------------------------------------------------
		//
		//	declaration
		//
		//------------------------------------------------------------------
		
		private var _id : String;
		private var _name : String;
		private var _description : String;

		
		//------------------------------------------------------------------
		//
		//	constructor
		//
		//------------------------------------------------------------------

		/**
		 * Creates a new Tag 
		 * @param id mandantory is converted to lower case. whitespace and colons are substituted by "_"
		 * @param name optional. If no value is set, the original value of id will be taken.
		 * @param description optional
		 * 
		 */		
		public function Tag( id : String, name : String = "", description : String = "" )
		{
			this._name =  ( name === '' ) ? id : name;
			this._id = id.toLowerCase().replace(/(\s|,)/g, '_');
			this._description = description;
		}
		
		
		//------------------------------------------------------------------
		//
		//	properties: getter/setter
		//
		//------------------------------------------------------------------

		/**
		 * id has to be set when constructing a new instance. It is converted to lower case. blanks are substituted by underscore
		 * @return 
		 * 
		 */		
		public function get id():String
		{
			return _id;
		}

		/**
		 * Name of the tag. Will return id if no value is set. 
		 * @return 
		 * 
		 */		
		public function get name():String
		{
			return _name;
		}

		/**
		 * @private
		 */		
		public function set name(value:String):void
		{
			_name = value;
		}

		/**
		 * Description for the tag, optional 
		 * @return 
		 * 
		 */		
		public function get description():String
		{
			return _description;
		}

		/**
		 * @private
		 */
		public function set description(value:String):void
		{
			_description = value;
		}
	}
}