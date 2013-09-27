request = require 'request'

module.exports =
  class Reporter
    constructor: ->
      @request = request

    send: (eventType, dimensions, context) ->
      params = timestamp: ((new Date().getTime()) / 1000)
      params.dimensions = dimensions
      params.context = context

      @request
        method: 'POST'
        url: "https://collector.githubapp.com/atom/#{eventType}"
        headers:
          'Content-Type' : 'application/vnd.github-octolytics+json'
        body: JSON.stringify(params)
