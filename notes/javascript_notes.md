
## Recommended Reading on Javascript

### Aguinaga, Jose. ["How it Feels to Learn Javascript in 2016"](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f). **Hackernoon**. Oct. 3, 2016.
- Darkly comical mock dialogue exposing the absurdity of the proliferation of Javascript tools/libraries in 2016.

### Copes, Flavio. [*The Complete Javascript Handbook*](https://medium.freecodecamp.org/the-complete-javascript-handbook-f26b2c71719c). **Medium**. Oct. 30, 2018.
- Reference book for most recent Javascript elements as well as overview of all components. Easily searched.

### Greif, Sacha. ["A Study Plan to Cure Javascript Fatigue"](https://medium.freecodecamp.org/a-study-plan-to-cure-javascript-fatigue-8ad3a54f2eb1). **Medium**. October 31, 20016.
- A clear plan for getting up and running with Javascript, using the React framework. 

### Jang, Peter. ["Modern Javascript Explained for Dinosaurs"](https://medium.com/the-node-js-collection/modern-javascript-explained-for-dinosaurs-f695e9747b70?source=linkShare-3707b10e3a30-1555718050&_branch_match_id=564540305931760406). **Medium**. October 18, 2017. 
- High level overview of Javascript tool development. Explains the evolution of Javascript tools and what problems they are meant to solve. Goes from js files to modules to package managers to bundlers to task runners. Very clear and useful.

### Pop, Florin. [How to Create a Buttons UI Kit](https://medium.freecodecamp.org/how-to-create-a-buttons-ui-kit-fdd354ee0815). **Medium**. April 19, 2019. 
- Challenge and sample code for creating new buttons in Javascript. Describes different button states and HTML vs CSS.

### Roberts, Philip. ["What the Heck is the Event Loop Anyway?"](https://www.youtube.com/watch?v=8aGhZQkoFbQ) **Youtube** or [**JS Conf. EU**](https://2014.jsconf.eu/speakers/philip-roberts-what-the-heck-is-the-event-loop-anyway.html) (with transcript). 2014.
- Video that explains Events--- “event-loop”, “non-blocking”, “callback”, “asynchronous”, “single-threaded” and “concurrency”.

### Ward, Jacob. ["How to correctly use preventDefault(), stopPropagation(), or return false; on events"](https://medium.com/@jacobwarduk/how-to-correctly-use-preventdefault-stoppropagation-or-return-false-on-events-6c4e3f31aedb). **Medium**. June 24, 2017. 
- Article about disrupting events, but useful examples for how Javascript engages with HTML. 

## Recommended Reading on Hypothes.is

### Udell, John. ["Do it yourself anchoring: the evolution of the Hypothes.is toolkit"](https://web.hypothes.is/blog/do-it-yourself-anchoring-and-the-evolution-of-the-hypothesis-toolkit/). **Hypothes.is**. August 20, 2015. 
- Article on Anchoring, specifically for Hypothes.is, as a method to facilitate highlighting with "tagging" different colors. 

## Keywords and Concepts

### How [Selection](https://developer.mozilla.org/en-US/docs/Web/API/Selection) works, using anchors: 

- A **selection** object represents the range of text selected by the user or the current position of the caret. To obtain a Selection object for examination or modification, call Window.getSelection(). The anchor is where the user began the selection and the focus is where the user ends the selection. If you make a selection with a desktop mouse, the anchor is placed where you pressed the mouse button and the focus is placed where you released the mouse button.

- There are various properties and methods to selection, including anchorNode, anchorOffset, addRange(), collapse(), etc.

### Anchoring using Javascript libraries (based on [John Udell's article)](https://web.hypothes.is/blog/do-it-yourself-anchoring-and-the-evolution-of-the-hypothesis-toolkit/)
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
