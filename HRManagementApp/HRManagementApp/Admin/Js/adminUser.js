class AdminUser {

    constructor() {

    }
    adminLogin() {
        const me = this;      
        //me.fillByMemory();
        $('#sign_in').on('submit', (e, data) => {
            if ($('#sign_in').valid()) {
                let arrData = $("#sign_in").serializeArray();
                let objService = new Service();
                let objajax = objService.ajax("ValidateAdminUser", objService.POST, `{userName: "${arrData[0].value}" ,password:"${arrData[1].value}"}`)
                objajax.done(function (response) {
                    

                    if (response.d === true) {
                        
                        window.location ='default.aspx';

                    } else {

                        alert('Invalid Username/Password.');
                    }

                });
            }
            e.preventDefault();
            return false;
        })
    }
    bindRoles() {
        let objService = new Service();
        let objajax = objService.ajax("roles", objService.POST,"{}");
        objajax.done(function (response) {           
            let arrData = JSON.parse(response.d);           
            let options = $("#drpRole");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Roles</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let i = 0; i < arrData.length; i++) {
                options.append($("<option />").val(arrData[i].roleId).text(arrData[i].role));
                liString += `<li data-original-index="${i+1}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${arrData[i].role}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[2].innerHTML = liString; 
            //options.prev()[0].innerHTML = liString
        });
    }
    bindGrades() {
        let objService = new Service();
        let objajax = objService.ajax("grades", objService.POST, "{}");
        objajax.done(function (response) {
            let arrData = JSON.parse(response.d);            
            let options = $("#drpGrade");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Grades</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let i = 0; i < arrData.length; i++) {               
                options.append($("<option />").val(arrData[i].gradeId).text(arrData[i].grade));
                liString += `<li data-original-index="${i+1}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${arrData[i].grade}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;
               
            }
            $(".dropdown-menu.inner")[0].innerHTML = liString
           
        });
    }
    bindBranch() {
        let objService = new Service();
        let objajax = objService.ajax("branches", objService.POST, "{}");
        objajax.done(function (response) {           
            let arrData = JSON.parse(response.d);            
            var options = $("#drpBranch");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Branches</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let i = 0; i < arrData.length; i++) {
                options.append($("<option />").val(arrData[i].branchId).text(arrData[i].branchName));
                liString += `<li data-original-index="${i+1}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${arrData[i].branchName}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
           $(".dropdown-menu.inner")[1].innerHTML = liString
            //options.prev()[0].innerHTML = liString
        });
    }
    signUpAdmin() {

        $('#sign_up').on('submit', (e, data) => {
            if ($('#sign_up').valid()) {

                let arrData = $("#sign_up").serializeArray();
                var objData = `{fname: "${arrData[0].value}",lname: "${arrData[1].value}" ,email: "${arrData[2].value}",password:"${arrData[3].value}",phNumber:"${arrData[5].value}",gender:"${arrData[6].value}"}`

                let objService = new Service();
                objService.ajax("createAdminUser", objService.POST, objData).then(function (response) {
                    
                    if (response.d === true) {

                        $('#sign_up')[0].reset();
                        window.location ='login.aspx';

                    } else {

                        alert('Some thing went wrong , please check your internet connection and try again.');
                    }



                    
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