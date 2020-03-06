## 8.8.19 makes more sense if I follow the code backwards

## FC: loading modules for use in this file
  extend = require('extend')
  raf = require('raf')
  scrollIntoView = require('scroll-into-view')
  CustomEvent = require('custom-event')
  Delegator = require('./delegator')
  $ = require('jquery')
  adder = require('./adder')
  highlighter = require('./highlighter')
  rangeUtil = require('./range-util')
  selections = require('./selections')
  xpathRange = require('./anchoring/range')
  { normalizeURI } = require('./util/url')
## FC: creating an animation promise for making an annotatoion
  animationPromise = (fn) ->
    return new Promise (resolve, reject) ->
      raf ->
        try
          resolve(fn())
        catch error
          reject(error)
## FC: module exports (the rest of the file)
  module.exports = class Guest extends Delegator
    SHOW_HIGHLIGHTS_CLASS = 'annotator-highlights-always-on'
    events:
    options:
    anchoring: require('./anchoring/html')
    plugins: null
    anchors: null
    visibleHighlights: false
    frameIdentifier: null
    html:
    constructor: (element, config) ->
      self = this
      this.adderCtrl = new adder.Adder(@adder[0], {
        onAnnotate: ->
          self.createAnnotation()
          document.getSelection().removeAllRanges()
# FC: 1
# fulfills call from adder.js event handler with option "onHighlight"
# onHighlight calls self.createHighlight() then clears all the ranges 
# 
        onHighlight: ->
          self.setVisibleHighlights(true)
          self.createHighlight()
          document.getSelection().removeAllRanges()
      })
    getDocumentInfo: ->
    _setupInitialState: (config) ->
    _connectAnnotationSync: (crossframe) ->
    _connectAnnotationUISync: (crossframe) ->
    destroy: ->
    anchor: (annotation) ->
      self = this
      root = @element[0]

      # Anchors hold an annotation, a target of that annotation, a
      # document range for that target and an Array of highlights.
      anchors = []
      anchoredTargets = []
      deadHighlights = []
      # Initialize the target array.
      annotation.target ?= []
      locate = (target) ->
        # Check that the anchor has a TextQuoteSelector -- without a
        # TextQuoteSelector we have no basis on which to verify that we have
        # reanchored correctly and so we shouldn't even try.
        #
        # Returning an anchor without a range will result in this annotation being
        # treated as an orphan (assuming no other targets anchor).
        if not (target.selector ? []).some((s) => s.type == 'TextQuoteSelector')
          return Promise.resolve({annotation, target})
        # Find a target using the anchoring module.
        options = {
          cache: self.anchoringCache
          ignoreSelector: '[class^="annotator-"]'
        }
        return self.anchoring.anchor(root, target.selector, options)
        .then((range) -> {annotation, target, range})
        .catch(-> {annotation, target})
# FC: 5 
# passes the highlight range to index.coffee
# 
      highlight = (anchor) ->
        # Highlight the range for an anchor.
        return anchor unless anchor.range?
        return animationPromise ->
          range = xpathRange.sniff(anchor.range)
          normedRange = range.normalize(root)
# FC: 5.1: Doesn’t pass cssClass as second param
#
          highlights = highlighter.highlightRange(normedRange)
          $(highlights).data('annotation', anchor.annotation)
          anchor.highlights = highlights
          return anchor
      # Remove all the highlights that have no corresponding target anymore.
      raf -> highlighter.removeHighlights(deadHighlights)
      # Anchor any targets of this annotation that are not anchored already.
      for target in annotation.target when target not in anchoredTargets
# FC: 5
# call to highlight binds highlight and its target to an anchor
# takes us to highlight above
# Joe: we care about this call to highlight
#
        anchor = locate(target).then(highlight)
        anchors.push(anchor)
      return Promise.all(anchors).then(sync)
    detach: (annotation) ->
# FC: 3 
# createAnnotation is passed with true for highlight
# 
    createAnnotation: (annotation = {}) ->
      self = this
      root = @element[0]
      ranges = @selectedRanges ? []
      @selectedRanges = null
      getSelectors = (range) ->
        options = {
          cache: self.anchoringCache
          ignoreSelector: '[class^="annotator-"]'
        }
        # Returns an array of selectors for the passed range.
        return self.anchoring.describe(root, range, options)
      setDocumentInfo = (info) ->
      setTargets = ([info, selectors]) ->
      info = this.getDocumentInfo()
      selectors = Promise.all(ranges.map(getSelectors))
      metadata = info.then(setDocumentInfo)
      targets = Promise.all([info, selectors]).then(setTargets)
      targets.then(-> self.publish('beforeAnnotationCreated', [annotation]))
# FC: 4
# createAnnotation makes an anchor and passes the annotation to locate(target).then(highlight) above
#
      targets.then(-> self.anchor(annotation))
      @crossframe?.call('showSidebar') unless annotation.$highlight
      annotation
# FC: 2
# onHighlight calls createHighlight
# createHighlight returns createAnnotation, passing true for highlight
# 
    createHighlight: ->
      return this.createAnnotation({$highlight: true})
    createComment: () ->
    deleteAnnotation: (annotation) ->
    showAnnotations: (annotations) ->
    toggleAnnotationSelection: (annotations) ->
    updateAnnotations: (annotations) ->
    focusAnnotations: (annotations) ->
    _onSelection: (range) ->
    _onClearSelection: () ->
    selectAnnotations: (annotations, toggle) ->
    onElementClick: (event) ->
    onElementTouchStart: (event) ->
    onHighlightMouseover: (event) ->
    onHighlightMouseout: (event) ->
    onHighlightClick: (event) ->
    setVisibleHighlights: (shouldShowHighlights) ->
    toggleHighlightClass: (shouldShowHighlights) ->