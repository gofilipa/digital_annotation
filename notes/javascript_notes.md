How [Selection](https://developer.mozilla.org/en-US/docs/Web/API/Selection) works, using anchors: 

- A **selection** object represents the range of text selected by the user or the current position of the caret. To obtain a Selection object for examination or modification, call Window.getSelection(). The anchor is where the user began the selection and the focus is where the user ends the selection. If you make a selection with a desktop mouse, the anchor is placed where you pressed the mouse button and the focus is placed where you released the mouse button.

- There are various properties and methods to selection, including anchorNode, anchorOffset, addRange(), collapse(), etc.

John Udell, ["Do it yourself anchoring: the evolution of the Hypothes.is toolkit"](https://web.hypothes.is/blog/do-it-yourself-anchoring-and-the-evolution-of-the-hypothesis-toolkit/) 

anchoring using Javascript libraries
- dom-anchor-text-quote (finds and describes text ranges in the document)
- dom-seek (returns offset for textNode or textNode for offset)
- JQuery (simplifies DOM traversals, event handling, CSS animations, and AJAX)
- xpath-range (creating DOM range with xpath)

In the Udell's script, this single line of Javascript:

window.get_annotations = get_annotations

leads to a domino effect of functions, the first one being:

**function get_annotations()**
success: attach_annotations

**function attach_annotations()**
- Loops through DOM elements (perhaps to find and color anchors); 
- returns element that matches selector; 
- initiates next function

**function attach_annotation(tag, text, exact, prefix)**
- imports above libraries for finding and anchoring; 
- creates Text Quote Anchor; 
- wraps Nodes with CSS
	- this uses inline CSS ("background-color") to "tag" (.wrap()) the text (as an HTML element with &lt;span&gt;) with color. Here is the last line of the code:

>	$(nodes).wrap('<span style="background-color:' + tag + '" title="' + text + '"></span>')