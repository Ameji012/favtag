var app = angular.module('favhashtag', ['controllers'])
.config(['$routeProvider', function($routeProvider) {
    return $routeProvider
    .when('/', {
        templateUrl: '../templates/home.html',
        controller: 'HomeCtrl'
    })
    .otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    });
  }
]);