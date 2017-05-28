class JobListing {


    GetJobsList() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetJobs", objService.POST, `{}`)
        objajax.then((response) => {



            let table = $("#tblJobslisting");

            table.find("tr:gt(0)").remove();; // empty table            

            table.append('<thead> <tr><th>Jobs</th><th></th></tr></thead><tbody>');

            let data = JSON.parse(response.d);


            for (let n of data) {
                //let strEditanchor = `new Tasks().editTask( '${n.TaskId}','${n.TaskName}','${n.GitUrl}','${n.TimeTaken}' );`;

                let strJoblist = `<h4>${n.jobTilte}</h4><br><span>Skills required : ${n.skills}<br>Positions available: ${n.noOfVacancies}</span><br><p>${n.remarks}</p>`;

                let strButton = `<button class= 'btn-primary' onclick="new JobListing().JobApplication(${n.jobid})" > Apply Now </button>'`

                table.append(`<tr><td>${strJoblist}</td><td style='align:center;width:20%'>${strButton}</td></tr>`);
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



    JobApplication(jobid ) {




    }


}