class Candidate{
    constructor(){
    }

    updatecandidate() {
        $('#frmCandidateDetails').on('submit', (e, data) => {
            let arrData = $("#frmCandidateDetails").serializeArray(); 
            // Get fileuploader path 
            //let hrid = $('#hdRecordid').val();
            let filename = '';
            let biodata = document.getElementById("biodata");
            if (biodata) {
                filename = biodata.files[0].name;
            }
            let objService = new Service();
            let objajax = objService.ajax("updateCandidate", objService.POST, `{skillset: "${arrData[0].value}" ,experience:"${arrData[1].value}" ,biodata:"${filename}"}`)
            objajax.done(function (response) {
                //$('#hdRecordid').value = "";
                //$('#totalexperience').value = "";
                //$('#biodata').value = "";
                console.log(response);
            });
            objajax.error(function (response) {
                //$('#tagsinput').value = "";
                //$('#totalexperience').value = "";
                //$('#biodata').value = "";
                console.log(response);
            });
            e.preventDefault();
            return false;
        })
    }
    createjob() {
        let jobtitle = $("#jobtitle");
        let skills = $("#skills")
        let noofpositions = $("#noofpositions");
        let requirements = $("#requirements");
        let isActive = $('#isactive')[0].checked
        let hrid = $('#hdRecordid').val();
        let data = `{recordid: "${hrid}" ,jobtitle: "${jobtitle.val()}" ,skills:"${skills.val()}" ,noofvacancies:"${noofpositions.val()}",remarks:"${requirements.val()}",isActive:${isActive}}`
        let objService = new Service();

        let objajax = objService.ajax("createJob", objService.POST, data)
        objajax.done(function (response) {
            $('#jobtitle').val("");
            $('#skills').val("");
            $('#requirements').val("");
            $('#noofpositions').val("");
            new Candidate().GetJobListing()
            console.log(response);
        });
        objajax.error(function (response) {
            console.log(response);
        });
    }
    bindSkills() {
        let objService = new Service();
        let objajax = objService.ajax("skills", objService.POST, "{}");
        objajax.done(function (response) {
            let arrData = JSON.parse(response.d);
            let options = $("#drpSkills");
            let liString = `<li data-original-index="0" ><a tabindex="0" class="" style="" data-tokens="null"><span class="text">--- Select Skills ----</span><span class="glyphicon glyphicon- ok check- mark"></span></a></li>`;
            for (let i = 0; i < arrData.length; i++) {
                options.append($("<option />").val(arrData[i].id).text(arrData[i].skill1));
                liString += `<li data-original-index="${i + 1}"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">${arrData[i].skill1}</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>`;

            }            
            $(".dropdown-menu.inner")[0].innerHTML = liString

        });
    }
    GetJobListing() {
        let objService = new Service();
        let objajax = objService.ajax("GetJobs", objService.POST, `{}`)
        objajax.then(function (response) {

            let table = $("#tblJobs");

            table.find("tr:gt(0)").remove();; // empty table            

            table.append('<thead> <tr><th>Id</th><th>Job Title</th> <th>Skills</th><th>Experience Needed</th><th></th></tr></thead><tbody>');
            var data = JSON.parse(response.d);
            for (let n of data) {
                let strEditanchor = `new Candidate().editJob( '${n.jobId}','${n.jobTilte}','${n.skills}','${n.noOfVacancies}','${n.remarks}','${n.isActive}');`;
                table.append(`<tr><td>${n.jobId}</td><td>${n.jobTilte}</td><td>${n.skills}</td><td>${n.noOfVacancies}</td><td ><a style='cursor:pointer' onclick="${strEditanchor}">Edit</a></td></tr>`);
            }
            table.append('</tbody>');
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
    editJob(jobid, jobtitle, skills, noofpositions, descriptions, isactive) {

        let hdEdit = $("#hdRecordid");
        let txtjobtitle = $('#jobtitle');
        let txtskills = $('#skills');
        let txtrequirements = $('#requirements');
        let txtnoofpositions = $('#noofpositions');
        let chkIsActive = $('#isactive')[0];

        isactive = (isactive === 'true');
        hdEdit.val(jobid);
        txtjobtitle.val(jobtitle);
        txtskills.val(skills);
        txtnoofpositions.val(noofpositions);
        txtrequirements.val(descriptions);
        chkIsActive.checked = isactive;


        txtjobtitle.focus();

        txtskills.focus();

        txtnoofpositions.focus();
        txtrequirements.focus();
    }
}