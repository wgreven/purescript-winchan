'use strict';

// module Browser.WinChan

var WinChan = require('winchan');

exports.openWindowImpl = function(url) {
  return function(relayUrl) {
    return function(windowFeatures) {
      return function(onError) {
        return function(onResponse) {
          return function() {
            console.log(windowFeatures);
            WinChan.open({
              url: url,
              relay_url: relayUrl,
              window_features: windowFeatures
            }, function(error, response) {
              if (error) {
                console.log(error);
                onError(error)();
              } else {
                console.log(response);
                onResponse(response)();
              }
            });
          }
        }
      }
    }
  }
}

exports.showForeign = function(a) {
  return JSON.stringify(a);
}
