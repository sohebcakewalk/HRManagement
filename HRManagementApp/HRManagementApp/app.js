//import { MyController } from './MyController.js';
//class MYApp {
//    constructor() {
//        angular.module('app', [])
//            .controller('MyController', MyController)
//    }

//}

angular.module('app', [])    
    .controller('MyController', ($scope)=>{
    $scope.z = [1,2,3];
    $scope.display = function (x) {   //module name
        console.log(localStorage.getItem("lastname"));
        if (x === 2) {
            return true;
        } else {
            return false;
        }
    };
});






