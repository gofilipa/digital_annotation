## 3.8.19: Making it Purple

The goal for today is simple---to change the highlighter color from YELLOW to RED on the development version. 

Looking at the CSS file for the adder. It's in the variables.scss file, in the styles directory (src/styles/variables.scss). In there, the highlighter is defined thus:

	$highlight-color: rgba(255, 255, 60, 0.3);

Now I need to look a little bit at RGB color schemes, according to w3schools. This is the the Red-green-blue-alpha (RGBA) model. Turns out these color values are an extension of RGB color values with an alpha channel that specifies the opacity of the color.  The red defines an intensity of red as an integer between 0 and 255 (it can also be represented as a percentage), and the same goes for green and blue. The alpha defines the opacity as a number between 0.0 (fully transparent) and 1.0 (fully opaque).

I'm trying purple (technically, Electric Indigo) which I got from this [website](http://www.flatuicolorpicker.com/purple-rgba-color-code). Though I'm changing the opacity to .3, to match the original. This is the code:

	rgba(140, 20, 252, .3)

And here's what I got!

![makingitpurple](images/makingitpurple.png)

This didn't actually show up until I quit everything, restarted the dev server, and unpacked the extention. It seems like that will always have to be my process to see changes. 


## 3.7.19 Replicating development environment
on home computer

Went through all of the instructions, which were fine except when I start try to unload the unpacked extension, and select build. I get this error window in Chrome:

    Failed to load extension
    File
    ~/Desktop/browser-extension/build
    Error
    Manifest is not valid JSON. Line: 1, column: 1, Unexpected token.
    Could not load manifest.

Also, when I try to run this code in the terminal:

    cd ~/Desktop/browser-extension # or wherever it is
    make SETTINGS_FILE=settings/chrome-prod.json

I get this error:

    Error: cannot create production build with dirty git state! 

### Update: I figured it out!

After some searching around the annotations on the docs, I found a workaround to fix the dirty git error (requiring me to comment out some code in browser-extension/tools/settings.js). This ended up making the code run without error and allowing me to unpack and load the extension. 

Was also able to see the changes in the development version by changing some code (in the adder.html), saving and closing/killing everything, then restarting the dev and unpacking the extension.

## 3.1.19: Setting up my development environment
Day One at the New Media Lab. 

Today Joe and I tried following the [Client development instructions](https://h.readthedocs.io/projects/client/en/latest/developers/developing/) on the H docs. There were a bunch of issues, mostly to do with NPM, which you can read about [here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) and [here](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally). From what I can gather, Node requires you to install it globally. As a result, every time we ran NPM we encountered a bunch of errors. 

It took us (mostly Joe!) about an hour and a half attempting to install the client and browser-extension this sloooow way before we finally doubled back and started over with a non-problematic installation of node. This involved deleting the repos from Github and starting over, installing the dependencies (node) via the NVM (node version manager) rather than NPM. The instructions are below:

	# in shell:
	[sudo] npm install npm -g
	mkdir ~/.npm-global
	npm config set prefix '~/.npm-global'

	# append to OR make a file at ~/.bash_profile including the content:
	export PATH=~/.npm-global/bin:$PATH

	# close terminal tab and open new one
	echo $PATH
	# ensure that ``~/.npm-global/bin` is included in results

	cd ~/Desktop # or wherever
	git clone 'https://github.com/hypothesis/client.git'
	cd client
	npm install -g gulp-cli
	make dev # kill with control-c

	cd ~/Desktop # or wherever
	git clone https://github.com/hypothesis/browser-extension.git
	cd browser-extension/src/
	npm install
	cd ..
	make
	npm test # should show summary of tests completed without error

	cd ~/Desktop/client # or wherever it is
	npm link

	cd ~/Desktop/browser-extension # or wherever it is
	npm link hypothesis

	# extensions reloader --- download to streamline updating changes to extentions

	install https://chrome.google.com/webstore/detail/extensions-reloader/fimgfedafeadlieiabdeeaodndnlbhid?hl=en

	# To start up,  and kill with control-c

	cd ../browser-extension/ && make SETTINGS_FILE=settings/chrome-prod.json && cd ../client/ && make dev

	## install extension in Chrome, toggle developer options, load unpacked extension, and select build. 

	cd ~/Desktop/browser-extension # or wherever it is
	make SETTINGS_FILE=settings/chrome-prod.json

	##	save as file ending in .bash with permissions 755 (chmod 755 [file_name])

	#!/bin/bash
	cd ../browser-extension/
	make SETTINGS_FILE=settings/chrome-prod.json
	cd ../client/
	make dev


This made things run a LOT smoother, though there were still issues with getting the extension to show up in the browser, which Joe fixed by changing file paths and/or running make SETTINGS_FILE=settings/chrome-prod.json in the browser extention. 

After a lot of trial and error, we finally got it to work, verified by changing the text in the hypothesis adder to reveal some gobbeldygook. This was extremely exciting. 

The major takeaway here is how difficult / how many steps I have to take in order to make a few changes to the javascript. The whole process would have been impossible without a professional helping me through it. Thankfully, Joe was here, patient, and willing to sit with me for three hours. I am so grateful. 

## General Resources
Article on [Fuzzy Anchoring](https://web.hypothes.is/blog/fuzzy-anchoring/)

## To start up development, and kill with control-c
cd ../browser-extension/ && make SETTINGS_FILE=settings/chrome-prod.json && cd ../client/ && make dev