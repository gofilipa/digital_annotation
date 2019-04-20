## Keywords and Concepts

### How [Selection](https://developer.mozilla.org/en-US/docs/Web/API/Selection) works, using anchors: 

- A **selection** object represents the range of text selected by the user or the current position of the caret. To obtain a Selection object for examination or modification, call Window.getSelection(). The anchor is where the user began the selection and the focus is where the user ends the selection. If you make a selection with a desktop mouse, the anchor is placed where you pressed the mouse button and the focus is placed where you released the mouse button.

- There are various properties and methods to selection, including anchorNode, anchorOffset, addRange(), collapse(), etc.

### Anchoring using Javascript libraries (based on [John Udell's article](https://web.hypothes.is/blog/do-it-yourself-anchoring-and-the-evolution-of-the-hypothesis-toolkit/)
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

	>	$(nodes).wrap('&lt;span style="background-color:' + tag + '" title="' + text + '"&gt;&lt;/span&gt;')

## Recommended Reading

### Jang, Peter. ["Modern Javascript Explained for Dinosaurs"](https://medium.com/the-node-js-collection/modern-javascript-explained-for-dinosaurs-f695e9747b70?source=linkShare-3707b10e3a30-1555718050&_branch_match_id=564540305931760406). Medium. October 18, 2017. 
- High level overview of Javascript tool development. Explains the evolution of Javascript tools and what problems they are meant to solve. Goes from js files to modules to package managers to bundlers to task runners. Very clear and useful.

### Pop, Florin. [How to Create a Buttons UI Kit](https://medium.freecodecamp.org/how-to-create-a-buttons-ui-kit-fdd354ee0815). Medium. April 19, 2019. 
- Challenge and sample code for creating new buttons in Javascript. Describes different button states and HTML vs CSS.

### Ward, Jacob. ["How to correctly use preventDefault(), stopPropagation(), or return false; on events"](https://medium.com/@jacobwarduk/how-to-correctly-use-preventdefault-stoppropagation-or-return-false-on-events-6c4e3f31aedb). Medium. June 24, 2017. 
- Article about disrupting events, but useful examples for how Javascript engages with HTML. 

## Udell, John. ["Do it yourself anchoring: the evolution of the Hypothes.is toolkit"](https://web.hypothes.is/blog/do-it-yourself-anchoring-and-the-evolution-of-the-hypothesis-toolkit/). Hypothes.is. August 20, 2015. 
- Article on Anchoring, specifically for Hypothes.is, as a method to facilitate highlighting with "tagging" different colors. 
