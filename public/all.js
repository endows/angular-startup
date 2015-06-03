(function() {
  angular.module('myApp', []).controller('myCtrl', function($scope) {
    return $scope.greet = "hello";
  });

}).call(this);
