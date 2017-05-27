class User{

    constructor(){
   
    }

    login() {
        $('#sign_in').on('submit', (e, data) => {
            let arrData = $("#sign_in").serializeArray(); 
            let objService = new Service();
            let objajax = objService.ajax("ValidateUser", objService.POST, `{userName: "${arrData[0].value}" ,password:"${arrData[1].value}"}`)
            objajax.done(function (response) {
                //alert('Success')
            });
            objajax.error(function (response) {
                //alert('Error')
            });
            e.preventDefault();
            return false;
        })
    }
    signUp() {
        $('#sign_up').on('submit', (e, data) => {
            let arrData = $("#sign_up").serializeArray();
            var objData = `{name: "${arrData[0].value}" ,email: "${arrData[1].value}",password:"${arrData[2].value}"}`

            let objService = new Service();
            objService.ajax("createUser", objService.POST, objData).then(function (response) {
                alert(response.d)
            });
            e.preventDefault();
            return false;
        })

    }

}