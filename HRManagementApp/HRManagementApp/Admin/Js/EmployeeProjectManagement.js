///import service from './Services/service.js'
class EmpProjManagement {
    GetData() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetEmpProjManagementList", objService.POST, `{}`)
        console.log(objajax);



        objajax.then( (response)=> {

            // console.log(response.d);
            let arrData = JSON.parse(response.d);

            let table = $("#tblEmpProj");
            table.find("tr:gt(0)").remove();; // empty table


            table.append(`<thead> <tr><th>User Name</th> <th>Client Name</th> <th>ProjectName Name</th> <th>Modules</th><th>Position</th><th>Estimated Date</th></tr></thead><tbody>`);
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

    SaveData() {
        $('#form_validation').on('submit', (e, data) => {
            e.preventDefault();
            return false;
        })

        //$('#form_validation').on('submit', (e, data) => {
          //  let arrData = $("#form_validation").serializeArray();
        let userid = $("#cbxuserlist");
        let projectid = $("#cbxprojectlist");
        let modules = $("#cbxmodulelist");
        let mdl = modules.val();
        mdl = (mdl != undefined && mdl != null && mdl != "") ? mdl.join(", ") : "";
        let position = $("#cbxpositionlist");
        let estimatedclosedate = $("#txtDate");

        let data = `{userid:"${userid.val()}",projectid:"${projectid.val()}",modules:"${mdl} ",position:"${position.val()}",estimatedclosedate:"${estimatedclosedate.val()}"}`;
        let objService = new Service();
        let objajax = objService.ajax("SaveEmpProjManagement", objService.POST, data)
        objajax.done( (response)=> {
            alert(response.d)
        });

        objajax.then((response)=> {

            console.log(response.d);

            new EmpProjManagement().GetData();

            userid.val("");
            projectid.val("");
            modules.val("");
            position.val("");
            estimatedclosedate.val("");
        });

        //    e.preventDefault();
        //    return false;
        //})
    }

    bindReportingTo() {
        let objService = new Service();
        let objajax = objService.ajax("UserManagement", objService.POST, "{}");
        objajax.done((response)=> {
            let arrData = JSON.parse(response.d);
            let options = $("#cbxuserlist");
            let liString = ``;
            let j = 0;
            for (let i of arrData) {
                options.append($("<option />").val(i.userId).text(i.email));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${i.email}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[0].innerHTML = liString
            //options.prev()[0].innerHTML = liString
        });

    }

    bindProjectList() {
        let objService = new Service();
        let objajax = objService.ajax("projectList", objService.POST, "{}");
        objajax.done((response)=> {
            let arrData = JSON.parse(response.d);
            let options = $("#cbxprojectlist");
            let liString = ``;
            let j = 0;
            for (let i of arrData) {
                options.append($("<option />").val(i.projectId).text(i.projectName));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${i.projectName}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[1].innerHTML = liString;
            //options.prev()[0].innerHTML = liString
        });
    }


    bindModuleList() {
        let objService = new Service();
        let objajax = objService.ajax("moduleList", objService.POST, "{}");
        objajax.done((response)=> {
            let arrData = JSON.parse(response.d);
            let options = $("#cbxmodulelist");
            let liString = ``;
            let j = 0;
            for (let i of arrData) {
                options.append($("<option />").val(i.moduleId).text(i.modulename));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${i.modulename}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[2].innerHTML = liString;
            //options.prev()[0].innerHTML = liString
        });
    }

    bindPositionList() {
        let objService = new Service();
        let objajax = objService.ajax("grades", objService.POST, "{}");
        objajax.done((response)=> {
            let arrData = JSON.parse(response.d);
            let options = $("#cbxpositionlist");
            let liString = ``;
            let j = 0;
            for (let i of arrData) {
                options.append($("<option />").val(i.position).text(i.position));
                liString += `<li data-original-index="${++j}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${i.position}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }
            $(".dropdown-menu.inner")[3].innerHTML = liString;
            //options.prev()[0].innerHTML = liString
        });
    }
}