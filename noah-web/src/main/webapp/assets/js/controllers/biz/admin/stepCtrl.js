
'use strict';
/**
 *  step
 */
app.controller('stepCtrl', ["$scope","$http","$aside","$filter", "ngTableParams","SweetAlert", function ($scope,$http,$aside,$filter,ngTableParams,SweetAlert) {
    $scope.queryMap = {};
    $scope.queryMap.pageSize = 10;
    $scope.queryMap.pageCurrent = 1;
    $scope.pageCtx = {};

    $scope.tableParams = {};
    $scope.data = [];
    $scope.listPromise = null;

    $scope.query = function () {
        $scope.queryMap.pageCurrent = 1;
        $scope.list();
    };

    $scope.list = function () {
        $http.post('/rest/step/list',$scope.queryMap).success(function(res){
            $scope.records = res.records; //total rows count
            $scope.data = res.rows;
            $scope.tableParams.reload();
        });
    };

    $scope.tableParams = new ngTableParams({
        page: 1, // show first page
        count: $scope.queryMap.pageSize          // count per page
    }, {
        counts: [],
        total: $scope.data.length, // length of data
        getData: function ($defer, params) {
            var orderedData = params.sorting() ? $filter('orderBy')($scope.data, params.orderBy()) : $scope.data;
            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
        }
    });

    $scope.query();

    $scope.pageChanged = function () {
        $scope.list();
    };

    $scope.delEditId = function (pid) {
        SweetAlert.swal({
            title: "确定删除?",
            text: "数据删除后将无法恢复",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: true,
            closeOnCancel: true
        }, function (isConfirm) {
            if (isConfirm) {
                $http.post('/rest/step/delete',{'editId':pid}).success(function(response){
                    $scope.query();
                });
            }
        });

    }

    $scope.setEditId = function (pid) {
        $aside.open({
            templateUrl: 'edit.html',
            placement: 'right',
            size: 'big',
            backdrop: true,
            controller: function ($scope,$modalInstance,$state) {
                $http.post('/rest/step/edit',{'editId':pid}).success(function(response){
                    $scope.step = response;
                });
                $scope.ok = function (e) {
                    $http.post('/rest/step/save',$scope.step).success(function(response){
                        $modalInstance.close();
                        e.stopPropagation();
                        $state.transitionTo($state.current, null, {'reload':true});
                    });;
                };
                $scope.cancel = function (e) {
                    $modalInstance.dismiss();
                    e.stopPropagation();
                };
            }
        });
    };

    $scope.add = function () {
        $aside.open({
            templateUrl: 'edit.html',
            placement: 'right',
            size: 'big',
            backdrop: true,
            controller: function ($scope, $modalInstance,$state) {
                $scope.ok = function (e) {
                    $http.post('/rest/step/save',$scope.step).success(function(response){
                        $modalInstance.close();
                        e.stopPropagation();
                        $state.transitionTo($state.current, null, {'reload':true});
                    });
                };
                $scope.cancel = function (e) {
                    $modalInstance.dismiss();
                    e.stopPropagation();
                };
            }
        });
    };
}]);




