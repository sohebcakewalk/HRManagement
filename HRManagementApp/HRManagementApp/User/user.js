class User{

    constructor(){
   
    }

    login() {
        $('#sign_in').on('submit', (e, data) => {
            if ($('#sign_in').valid()) {
                let arrData = $("#sign_in").serializeArray();
                let objService = new Service();
                let objajax = objService.ajax("ValidateUser", objService.POST, `{userName: "${arrData[0].value}" ,password:"${arrData[1].value}"}`)
                objajax.done(function (response) {
                    alert(response.d)
                });
            }
            e.preventDefault();
            return false;
        })
    }
    signUp() {
        $('#sign_up').on('submit', (e, data) => {
            if ($('#sign_up').valid()) {

                let arrData = $("#sign_up").serializeArray();                
                var objData = `{fname: "${arrData[0].value}",lname: "${arrData[1].value}" ,email: "${arrData[2].value}",password:"${arrData[3].value}",phNumber:"${arrData[5].value}",gender:"${arrData[6].value}"}`

                let objService = new Service();
                objService.ajax("createUser", objService.POST, objData).then(function (response) {
                    alert(response.d)

                    if (response.d) { $('#sign_up')[0].reset();}
                });
            }
            e.preventDefault();
            return false;
        })

    }

}