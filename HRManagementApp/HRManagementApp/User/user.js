class User {

    constructor() {

    }

    login() {
        const me = this;
        //me.fillByMemory();
        $('#sign_in').on('submit', (e, data) => {
            if ($('#sign_in').valid()) {
                let arrData = $("#sign_in").serializeArray();
                let objService = new Service();
                let objajax = objService.ajax("ValidateUser", objService.POST, `{userName: "${arrData[0].value}" ,password:"${arrData[1].value}"}`)
                objajax.done((response) => {
                    //me.rememberMe(arrData[0].value, arrData[1].value);
                    //alert(response.d);
                    if (response.d)
                        window.location = "default.aspx";
                    else {
                        alert("Invalid User");
                    }
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
                let objData = `{fname: "${arrData[0].value}",lname: "${arrData[1].value}" ,email: "${arrData[2].value}",password:"${arrData[3].value}",phNumber:"${arrData[5].value}",gender:"${arrData[6].value}"}`

                let objService = new Service();
                objService.ajax("createUser", objService.POST, objData).then((response) => {
                    //alert(response.d)

                    if (response.d) { $('#sign_up')[0].reset(); }

                    window.location = "signin.aspx";
                });
            }
            e.preventDefault();
            return false;
        })

    }
    rememberMe(id, password) {
        if ($('#rememberme').is(':checked')) {
            // save username and password
            localStorage.usrname = id;
            localStorage.pass = password;
        } else {
            localStorage.usrname = '';
            localStorage.pass = '';
        }

    }

    fillByMemory() {
        if (!!localStorage.usrname)
            $('#username').val(localStorage.usrname);

        if (!!localStorage.pass)
            $('#password').val(localStorage.pass);
    }

}