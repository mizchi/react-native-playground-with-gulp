'use strict';
global.React = global.require('react-native');
let xtend = require('xtend');

let {View, Text} = React;
let template = require('./template');
let styles = React.StyleSheet.create(require('./styles'));

let HelloNative = React.createClass({
  render: function() {
    return template(xtend({}, {View, Text, styles}));
  }
});

React.AppRegistry.registerComponent('HelloNative', () => HelloNative);
