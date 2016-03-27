package com.core.colorPicker
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	import mx.events.FlexMouseEvent;

	import spark.components.Button;
	import spark.components.Group;
	import spark.components.List;
	import spark.components.PopUpAnchor;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	[Event(name="change", type="msi.components.colorPicker.CustomColorPickerEvent")]

	/**
	 *
	 * @author Ihor Khomiak
	 */
	public class CustomColorPicker extends SkinnableComponent
	{

		[SkinPart(required="true")]
		/**
		 *
		 * @default
		 */
		public var open:Button;

		[SkinPart(required="true")]
		/**
		 *
		 * @default
		 */
		public var title:TextInput;

		[SkinPart(required="true")]
		/**
		 *
		 * @default
		 */
		public var colorList:List;

		[SkinPart(required="true")]
		/**
		 *
		 * @default
		 */
		public var popUp:PopUpAnchor;

		[SkinPart(required="true")]
		/**
		 *
		 * @default
		 */
		public var popUpGroup:Group;


		[Bindable]
		/**
		 *
		 * @default
		 */
		public var selectedColor:uint=000000;

		[Bindable]
		/**
		 *
		 * @default
		 */
		public var focusColor:uint=000000;

		[Bindable]
		/**
		 *
		 * @default
		 */
		public var colorArray:ArrayCollection=new ArrayCollection([{color: '0x000000'}, {color: '0x000000'}, {color: '0x000000'}, {color: '0x003300'}, {color: '0x006600'}, {color: '0x009900'}, {color: '0x00cc00'}, {color: '0x00ff00'}, {color: '0x330000'}, {color: '0x333300'}, {color: '0x336600'}, {color: '0x339900'}, {color: '0x33cc00'}, {color: '0x33ff00'}, {color: '0x660000'}, {color: '0x663300'}, {color: '0x666600'}, {color: '0x669900'}, {color: '0x66cc00'}, {color: '0x66ff00'}, {color: '0x333333'}, {color: '0x000000'}, {color: '0x000033'}, {color: '0x003333'}, {color: '0x006633'}, {color: '0x009933'}, {color: '0x00cc33'}, {color: '0x00ff33'}, {color: '0x330033'}, {color: '0x333333'}, {color: '0x336633'}, {color: '0x339933'}, {color: '0x33cc33'}, {color: '0x33ff33'}, {color: '0x660033'}, {color: '0x663333'}, {color: '0x666633'}, {color: '0x669933'}, {color: '0x66cc33'}, {color: '0x66ff33'}, {color: '0x666666'}, {color: '0x000000'}, {color: '0x000066'}, {color: '0x003366'}, {color: '0x006666'}, {color: '0x009966'}, {color: '0x00cc66'}, {color: '0x00ff66'}, {color: '0x330066'}, {color: '0x333366'}, {color: '0x336666'}, {color: '0x339966'}, {color: '0x33cc66'}, {color: '0x33ff66'}, {color: '0x660066'}, {color: '0x663366'}, {color: '0x666666'}, {color: '0x669966'}, {color: '0x66cc66'}, {color: '0x66ff66'}, {color: '0x999999'}, {color: '0x000000'}, {color: '0x000099'}, {color: '0x003399'}, {color: '0x006699'}, {color: '0x009999'}, {color: '0x00cc99'}, {color: '0x00ff99'}, {color: '0x330099'}, {color: '0x333399'}, {color: '0x336699'}, {color: '0x339999'}, {color: '0x33cc99'}, {color: '0x33ff99'}, {color: '0x660099'}, {color: '0x663399'}, {color: '0x666699'}, {color: '0x669999'}, {color: '0x66cc99'}, {color: '0x66ff99'}, {color: '0xcccccc'}, {color: '0x000000'}, {color: '0x0000cc'}, {color: '0x0033cc'}, {color: '0x0066cc'}, {color: '0x0099cc'}, {color: '0x00cccc'}, {color: '0x00ffcc'}, {color: '0x3300cc'}, {color: '0x3333cc'}, {color: '0x3366cc'}, {color: '0x3399cc'}, {color: '0x33cccc'}, {color: '0x33ffcc'}, {color: '0x6600cc'}, {color: '0x6633cc'}, {color: '0x6666cc'}, {color: '0x6699cc'}, {color: '0x66cccc'}, {color: '0x66ffcc'}, {color: '0xffffff'}, {color: '0x000000'}, {color: '0x0000ff'}, {color: '0x0033ff'}, {color: '0x0066ff'}, {color: '0x0099ff'}, {color: '0x00ccff'}, {color: '0x00ffff'}, {color: '0x3300ff'}, {color: '0x3333ff'}, {color: '0x3366ff'}, {color: '0x3399ff'}, {color: '0x33ccff'}, {color: '0x33ffff'}, {color: '0x6600ff'}, {color: '0x6633ff'}, {color: '0x6666ff'}, {color: '0x6699ff'}, {color: '0x66ccff'}, {color: '0x66ffff'}, {color: '0xff0000'}, {color: '0x000000'}, {color: '0x990000'}, {color: '0x993300'}, {color: '0x996600'}, {color: '0x999900'}, {color: '0x99cc00'}, {color: '0x99ff00'}, {color: '0xcc0000'}, {color: '0xcc3300'}, {color: '0xcc6600'}, {color: '0xcc9900'}, {color: '0xcccc00'}, {color: '0xccff00'}, {color: '0xff0000'}, {color: '0xff3300'}, {color: '0xff6600'}, {color: '0xff9900'}, {color: '0xffcc00'}, {color: '0xffff00'}, {color: '0x00ff00'}, {color: '0x000000'}, {color: '0x990033'}, {color: '0x993333'}, {color: '0x996633'}, {color: '0x999933'}, {color: '0x99cc33'}, {color: '0x99ff33'}, {color: '0xcc0033'}, {color: '0xcc3333'}, {color: '0xcc6633'}, {color: '0xcc9933'}, {color: '0xcccc33'}, {color: '0xccff33'}, {color: '0xff0033'}, {color: '0xff3333'}, {color: '0xff6633'}, {color: '0xff9933'}, {color: '0xffcc33'}, {color: '0xffff33'}, {color: '0x0000ff'}, {color: '0x000000'}, {color: '0x990066'}, {color: '0x993366'}, {color: '0x996666'}, {color: '0x999966'}, {color: '0x99cc66'}, {color: '0x99ff66'}, {color: '0xcc0066'}, {color: '0xcc3366'}, {color: '0xcc6666'}, {color: '0xcc9966'}, {color: '0xcccc66'}, {color: '0xccff66'}, {color: '0xff0066'}, {color: '0xff3366'}, {color: '0xff6666'}, {color: '0xff9966'}, {color: '0xffcc66'}, {color: '0xffff66'}, {color: '0xffff00'}, {color: '0x000000'}, {color: '0x990099'}, {color: '0x993399'}, {color: '0x996699'}, {color: '0x999999'}, {color: '0x99cc99'}, {color: '0x99ff99'}, {color: '0xcc0099'}, {color: '0xcc3399'}, {color: '0xcc6699'}, {color: '0xcc9999'}, {color: '0xcccc99'}, {color: '0xccff99'}, {color: '0xff0099'}, {color: '0xff3399'}, {color: '0xff6699'}, {color: '0xff9999'}, {color: '0xffcc99'}, {color: '0xffff99'}, {color: '0x00ffff'}, {color: '0x000000'}, {color: '0x9900cc'}, {color: '0x9933cc'}, {color: '0x9966cc'}, {color: '0x9999cc'}, {color: '0x99cccc'}, {color: '0x99ffcc'}, {color: '0xcc00cc'}, {color: '0xcc33cc'}, {color: '0xcc66cc'}, {color: '0xcc99cc'}, {color: '0xcccccc'}, {color: '0xccffcc'}, {color: '0xff00cc'}, {color: '0xff33cc'}, {color: '0xff66cc'}, {color: '0xff99cc'}, {color: '0xffcccc'}, {color: '0xffffcc'}, {color: '0xff00ff'}, {color: '0x000000'}, {color: '0x9900ff'}, {color: '0x9933ff'}, {color: '0x9966ff'}, {color: '0x9999ff'}, {color: '0x99ccff'}, {color: '0x99ffff'}, {color: '0xcc00ff'}, {color: '0xcc33ff'}, {color: '0xcc66ff'}, {color: '0xcc99ff'}, {color: '0xccccff'}, {color: '0xccffff'}, {color: '0xff00ff'}, {color: '0xff33ff'}, {color: '0xff66ff'}, {color: '0xff99ff'}, {color: '0xffccff'}, {color: '0xffffff'},]);

		/**
		 *
		 */
		public function CustomColorPicker()
		{
			super();
		}

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}

		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if (instance == open)
			{
				open.addEventListener(MouseEvent.CLICK, open_clickHandler);
			}
			if (instance == colorList)
			{
				colorList.addEventListener(CustomColorPickerEvent.FOCUS_COLOR, onfocusColor)
				colorList.addEventListener(CustomColorPickerEvent.SELECTED_COLOR, onselectedColor)
			}
			if (instance == title)
			{
				title.text=('00000' + focusColor.toString(16).toLocaleUpperCase()).substr(-6);
				title.selectAll();
				title.addEventListener(KeyboardEvent.KEY_UP, ontitletype)
				title.addEventListener(FlexEvent.ENTER, onselectedColor2)
			}
			if (instance == popUpGroup)
			{
				popUpGroup.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, onclosePopUp)
			}

		}

		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			if (instance == open)
			{
				open.removeEventListener(MouseEvent.CLICK, open_clickHandler);
			}
			if (instance == colorList)
			{
				colorList.removeEventListener(CustomColorPickerEvent.FOCUS_COLOR, onfocusColor)
				colorList.removeEventListener(CustomColorPickerEvent.SELECTED_COLOR, onselectedColor)
			}
			if (instance == title)
			{
				title.removeEventListener(KeyboardEvent.KEY_UP, ontitletype)
				title.removeEventListener(FlexEvent.ENTER, onselectedColor2)
			}
			if (instance == popUpGroup)
			{
				popUpGroup.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, onclosePopUp)
			}
		}

		/**
		 *
		 * @param event
		 */
		protected function open_clickHandler(event:MouseEvent):void
		{
			if (popUp.displayPopUp == false)
			{
				popUp.displayPopUp=true;
			}
		}

		private function onfocusColor(evt:CustomColorPickerEvent):void
		{
			focusColor=evt.color;
			title.text=('00000' + focusColor.toString(16).toLocaleUpperCase()).substr(-6);
			title.selectAll();
		}

		private function ontitletype(evt:KeyboardEvent):void
		{
			title.text=title.text.toUpperCase();
			focusColor=styleManager.getColorName("0x" + title.text);
		}

		private function onselectedColor2(evt:FlexEvent):void
		{
			if (selectedColor != styleManager.getColorName("0x" + title.text))
			{
				selectedColor=focusColor=styleManager.getColorName("0x" + title.text);
				dispatchEvent(new CustomColorPickerEvent(CustomColorPickerEvent.CHANGE, true));
			}
			closePopUp();
		}

		private function closePopUp():void
		{
			focusColor=selectedColor;
			title.text=('00000' + focusColor.toString(16).toLocaleUpperCase()).substr(-6);
			popUp.displayPopUp=false;
		}

		private function onclosePopUp(evt:FlexMouseEvent):void
		{
			closePopUp();
		}

		private function onselectedColor(evt:CustomColorPickerEvent):void
		{
			if (selectedColor != styleManager.getColorName("0x" + title.text))
			{
				selectedColor=focusColor=evt.color;
				dispatchEvent(new CustomColorPickerEvent(CustomColorPickerEvent.CHANGE, true));
			}
			closePopUp();
		}
	}
}
