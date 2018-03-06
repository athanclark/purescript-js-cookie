"use strict";

var Cookie = require('js-cookie');

exports.setImpl = function setImpl(k,v,mExp) {
  if (mExp === null) {
    Cookie.set(k,v);
  } else {
    Cookie.set(k,v,mExp);
  }
};

exports.getImpl = function getImpl(k) {
  var result = Cookie.getJSON(k);
  if (result === undefined) {
    return null;
  } else {
    return result;
  }
};

exports.removeImpl = function removeImpl(k) {
  Cookie.remove(k);
};
