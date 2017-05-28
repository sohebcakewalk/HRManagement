///import service from './Services/service.js'

class Tasks {

    GetTasks() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetTaskList", objService.POST, `{}`)
        //console.log(objajax);

        

        objajax.then(function (response) {

           // console.log(response.d);

            let table = $("#tblTasks");

            table.find("tr:gt(0)").remove();; // empty table            

            table.append('<thead> <tr><th>Id</th><th>Task name</th> <th>Git Url</th><th>Minutes</th><th></th></tr></thead><tbody>');
            
            for (let n of response.d) {
                let strEditanchor = `new Tasks().editTask( '${n.TaskId}','${n.TaskName}','${n.GitUrl}','${n.TimeTaken}' );`;
                table.append(`<tr><td>${n.TaskId}</td><td>${n.TaskName}</td><td>${n.GitUrl}</td><td>${n.TimeTaken}</td><td ><a style='cursor:pointer' onclick="${strEditanchor}">Edit</a></td></tr>`);
            }
            table.append('</tbody>');

            //$('#tblTasks').DataTable();


            if ($.fn.dataTable.isDataTable(table) == false) {

                try {
                    $('.js-basic-example').DataTable({
                        responsive: true
                    });

                } catch (e) {

                }
            }
            
        });



    }


    SaveTask() {

        let taskName = $("#txttaskName");
        let gitUrl = $("#txtgitUrl")
        let timetaken = $("#txttimetaken");
        let hdEdit = $("#hdRecordid");

        let data = `{Taskname: "${taskName.val()}",gitUrl: "${gitUrl.val()}",timeTaken:"${timetaken.val()}",recordid:"${hdEdit.val()}"}`;


        let objService = new Service();
        let objajax = objService.ajax("SaveTask", objService.POST, data)
        console.log(objajax);



        objajax.then(function (response) {

           
           new Tasks().GetTasks();

           taskName.val("");
           gitUrl.val("");
           timetaken.val("");
           hdEdit.val("");
        });




    }


    editTask(taskid,taskname,giturl,hours) {

        let hdEdit = $("#hdRecordid");
        let txttaskName = $("#txttaskName");
        let txtgitUrl = $("#txtgitUrl")
        let txttimetaken = $("#txttimetaken");


        hdEdit.val(taskid);
        txttaskName.val(taskname);
        txtgitUrl.val(giturl);
        txttimetaken.val(hours);


        txttaskName.focus();

        txtgitUrl.focus();

        txttimetaken.focus();
    }



}