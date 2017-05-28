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
                objajax.done((response) => {
                    if (response.d === true) {

                        window.location = 'default.aspx';

                    } else {

                        alert('Invalid Username/Password.');
                    }


                });
            }
            e.preventDefault();
            return false;
        })
    }
    GetData() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetEmpProjManagementList", objService.POST, `{}`)
        console.log(objajax);



        objajax.then(function (response) {

            // console.log(response.d);
            let arrData = JSON.parse(response.d);

            let table = $("#tblEmpList");
            table.find("tr:gt(0)").remove();; // empty table


            table.append(`<thead> <tr><th>First Name</th> <th>Last Name</th><th>Email</th><th>Phone</th> <th>Date of Birth</th></tr></thead><tbody>`);
            for (let n of arrData) {
                table.append(`<tr><td>${n.userName}</td><td>${n.clientName}</td><td>${n.projectName}</td><td>${n.modules}</td><td>${n.position}</td><td>${n.estimatedclosedate}</td></tr>`);
            }
            table.append('</tbody>');

            //if ($('.sorting_asc')[0] == undefined) {
            if ($.fn.dataTable.isDataTable(table) == false) {
                try {
                    //$('#tblTasks').DataTable();
                    $('.js-basic-example').DataTable({
                        responsive: true
                    });
                } catch (e) {

                }
            }
        });



    }
    bindRoles() {
        let objService = new Service();
        let objajax = objService.ajax("roles", objService.POST, "{}");
        let j = 0;
        objajax.done((response)=> {           
            let arrData = JSON.parse(response.d);           
            let options = $("#drpRole");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Roles</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let n of arrData) {           
                options.append($("<option />").val(n.roleId).text(n.role));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${n.role}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[2].innerHTML = liString;
            //options.prev()[0].innerHTML = liString
        });
    }
    bindGrades() {
        let objService = new Service();
        let objajax = objService.ajax("grades", objService.POST, "{}");
        let j = 0;
        objajax.done((response)=> {
            let arrData = JSON.parse(response.d);            
            let options = $("#drpGrade");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Grades</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let n of arrData) {                         
                options.append($("<option />").val(n.gradeId).text(n.grade));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${n.grade}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;
            }
            $(".dropdown-menu.inner")[1].innerHTML = liString

        });
    }
    bindBranch() {
        let objService = new Service();
        let objajax = objService.ajax("branches", objService.POST, "{}");
        let j = 0;
        objajax.done((response) => {   
            let arrData = JSON.parse(response.d);            
            let options = $("#drpBranch");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Branches</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let n of arrData) { 
                options.append($("<option />").val(n.branchId).text(n.branchName));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${n.branchName}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[2].innerHTML = liString
            //options.prev()[0].innerHTML = liString
        });
    }
    bindReportingTo() {
        let objService = new Service();
        let objajax = objService.ajax("UserManagement", objService.POST, "{}");
        objajax.done((response)=> {
            let arrData = JSON.parse(response.d);
            let options = $("#drpReporting");
            let j = 0;
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Reporting To</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let n of arrData) {            
                options.append($("<option />").val(n.userId).text(n.email));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${n.email}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[0].innerHTML = liString
            $(".dropdown-menu.inner")[4].innerHTML = liString
            //options.prev()[0].innerHTML = liString
        });

    }
    signUpAdmin() {

        $('#sign_up').on('submit', (e, data) => {
            if ($('#sign_up').valid()) {

                let arrData = $("#sign_up").serializeArray();
                let dob = $("#txtDate")[0].value;
                let grade = $("#drpGrade")[0].value;
                let branch = $("#drpBranch")[0].value;
                let role = $("#drpRole")[0].value;
                let reportingTo = $("#drpBranch")[0].value;

                let objData = `{fname: "${arrData[0].value}",lname: "${arrData[1].value}" ,email: "${arrData[2].value}",password:"${arrData[3].value}",phNumber:"${arrData[5].value}",gender:"${arrData[6].value}",address:"${arrData[7].value}",dob:"${dob}",grade:"${grade}",branch:"${branch}",role:"${role}",reportingTo:"${reportingTo}"}`

                let objService = new Service();

                objService.ajax("createAdminUser", objService.POST, objData).then((response)=> {
                    if (response.d === true) {

                        $('#sign_up')[0].reset();
                        window.location = 'login.aspx';

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