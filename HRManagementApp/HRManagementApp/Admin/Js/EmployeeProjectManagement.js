///import service from './Services/service.js'

class EmpProjManagement {
    GetData() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetEmpProjManagementList", objService.POST, `{}`)
        console.log(objajax);



        objajax.then(function (response) {

            // console.log(response.d);

            $('#tblEmpProj').append('<thead> <tr><th>UserId</th> <th>Modules</th></tr></thead><tbody>');
            for (let n of response.d) {
                $('#tblEmpProj').append(`<tr><td>${n.useid}</td><td>${n.modules}</td></tr>`);
            }
            $('#tblTasks').append('</tbody>');

            //$('#tblTasks').DataTable();
            $('.js-basic-example').DataTable({
                responsive: true
            });
        });



    }

    SaveData() {
        $('#form_validation').on('submit', (e, data) => {
            e.preventDefault();
            return false;
        })

        //$('#form_validation').on('submit', (e, data) => {
          //  let arrData = $("#form_validation").serializeArray();
        let userid = $("#cbxuserlist").val();
        let projectid = $("#cbxprojectlist").val()
        let modules = $("#cbxmodulelist").val();
        modules = (modules != undefined && modules != null && modules != "") ? modules.join(", ") : modules;
        let position = $("#cbxpositionlist").val();
        let estimatedclosedate = $("#txtDate").val();

        let data = `{userid:"${userid}",clientid:"1",projectid:"${projectid}",modules:"${modules}",branchid:"1",position:"${position}",estimatedclosedate:"${estimatedclosedate}"}`;
        let objService = new Service();
        let objajax = objService.ajax("SaveEmpProjManagement", objService.POST, data)
        objajax.done(function (response) {
            alert(response.d)
        });

        objajax.then(function (response) {

            console.log(response.d);

            new EmpProjManagement().GetTasks();

        });

        //    e.preventDefault();
        //    return false;
        //})
    }

    bindProjectList() {
        let objService = new Service();
        let objajax = objService.ajax("projectList", objService.POST, "{}");
        objajax.done(function (response) {
            let arrData = JSON.parse(response.d);
            let options = $("#cbxprojectlist");
            let liString = `<li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Roles</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let i = 0; i < arrData.length; i++) {
                options.append($("<option />").val(arrData[i].roleId).text(arrData[i].role));
                liString += `<li data-original-index="${i + 1}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${arrData[i].role}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[0].innerHTML = liString;
            //options.prev()[0].innerHTML = liString
        });
    }

}