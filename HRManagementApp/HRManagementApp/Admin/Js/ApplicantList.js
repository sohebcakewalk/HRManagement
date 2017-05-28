///import service from './Services/service.js'
class ApplicantList {
    GetData() {

        // make a secvice call

        let objService = new Service();
        let objajax = objService.ajax("GetApplicantList", objService.POST, `{}`)
        console.log(objajax);

        objajax.then(function (response) {

            // console.log(response.d);
            let arrData = JSON.parse(response.d);

            let table = $("#tblEmpProj");
            table.find("tr:gt(0)").remove();; // empty table


            table.append(`<thead> <tr><th>Job Title</th> <th>Applicant Name</th> <th>Contact</th> <th>Skills</th><th>Apply Date</th></tr></thead><tbody>`);
            for (let n of arrData) {
                table.append(`<tr><td>${n.jobTilte}</td><td>${n.firstname} ${n.lastname}</td><td>${n.contact}</td><td>${n.skillindividual}</td><td>${n.applydate}</td></tr>`);
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
}