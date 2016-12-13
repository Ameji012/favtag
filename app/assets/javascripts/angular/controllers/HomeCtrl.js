this.HomeCtrl = function($scope, $document, $http) {
  
  $scope.title = "Favorite HashTags";
  $scope.tweets = [];
  $scope.searches = [];
  $scope.searched = false;

  getSearchedList();

  function getSearchedList() {
    $http.get('api/v1/searches', {})
  .then(function (response) {
    $scope.searches = [];
    for (var i in response.data) {
      $scope.searches.push(response.data[i]);
    }
  }, function(){
    console.log('Error');
  });
  }


  $scope.onClickSearch = function() {
    $scope.tweets = [];
    $http.post('api/v1/tweets', {hashtag: $scope.query.text})
    .then(function (response) {
      for (var i in response.data) {
        $scope.tweets.push(response.data[i]);
      }
      getSearchedList();
      $scope.searched = true;
    }, function(){
      console.log('Error');
    });
  };

  $scope.onClickSearchedItem = function(object) {
    $http.get('api/v1/searches/' + object.id , {})
    .then(function (response) {
      object.tweets = [];
      console.log(response.data);
      for (var i in response.data) {
        object.tweets.push(response.data[i]);
      }
      $scope.$apply;
    }, function(){
      console.log('Error');
    });

  };
};
