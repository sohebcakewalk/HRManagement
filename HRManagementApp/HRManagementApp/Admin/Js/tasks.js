///import service from './Services/service.js'

class Tasks {

    GetTasks() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetTaskList", objService.POST, `{}`)
        console.log(objajax);

        

        objajax.then(function (response) {

           // console.log(response.d);

            $('#tblTasks').append('<thead> <tr><th>Task name</th> <th>Git Url</th></tr></thead><tbody>');
            
            for (let n of response.d) {
                $('#tblTasks').append(`<tr><td>${n.TaskName}</td><td>${n.GitUrl}</td></tr>`);
            }
            $('#tblTasks').append('</tbody>');

            //$('#tblTasks').DataTable();

            $('.js-basic-example').DataTable({
                responsive: true
            });
        });



    }


    SaveTask() {

        let taskName = $("#txttaskName").val();
        let gitUrl = $("#txtgitUrl").val()
        let timetaken = $("#txttimetaken").val();

        let data = `{Taskname: "${taskName}",gitUrl: "${gitUrl}",timeTaken:"${timetaken}"}`;


        let objService = new Service();
        let objajax = objService.ajax("SaveTask", objService.POST, data)
        console.log(objajax);



        objajax.then(function (response) {

            console.log(response.d);

           new Tasks().GetTasks();

        });




    }



}