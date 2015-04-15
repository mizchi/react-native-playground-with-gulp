'use strict';
global.React = global.require('react-native');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  }
});

var $ = React.createElement
var el = $(View, {style: styles.container}, [
  $(Text, {}, "Welcome")
]);

var HelloNative = React.createClass({
  render: function() {
    return el;
  }
});

AppRegistry.registerComponent('HelloNative', () => HelloNative);
