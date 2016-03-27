package com.core.colorPicker
{
	import flash.events.Event;

	/**
	 *
	 * @author Ihor Khomiak
	 */
	public class CustomColorPickerEvent extends Event
	{

		/**
		 *
		 * @default
		 */
		public static const FOCUS_COLOR:String="FocusColor";
		/**
		 *
		 * @default
		 */
		public static const SELECTED_COLOR:String="SelectedColor";
		/**
		 *
		 * @default
		 */
		public static const CHANGE:String="changeColor";

		/**
		 *
		 * @default
		 */
		public var color:uint;

		/**
		 *
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * @param color
		 */
		public function CustomColorPickerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, color:uint=0)
		{
			this.color=color;
			super(type, bubbles, cancelable);
		}
	}
}
