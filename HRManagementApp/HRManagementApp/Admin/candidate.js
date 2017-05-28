﻿class Candidate{
    constructor(){
    }

    updatecandidate() {
        $('#frmCandidateDetails').on('submit', (e, data) => {
            let arrData = $("#frmCandidateDetails").serializeArray(); 
            // Get fileuploader path 
            let filename = '';
            let biodata = document.getElementById("biodata");
            if (biodata) {
                filename = biodata.files[0].name;
            }
            let objService = new Service();
            let objajax = objService.ajax("updateCandidate", objService.POST, `{skillset: "${arrData[0].value}" ,experience:"${arrData[1].value}" ,biodata:"${filename}"}`)
            objajax.done(function (response) {
                //$('#tagsinput').value = "";
                //$('#totalexperience').value = "";
                //$('#biodata').value = "";
            });
            e.preventDefault();
            return false;
        })
    }
    createjob() {
        $('#frmJobCreation').on('submit', (e, data) => {
            let arrData = $("#frmJobCreation").serializeArray();
            let objService = new Service();
            let objajax = objService.ajax("createJob", objService.POST, `{jobtitle: "${arrData[0].value}" ,skills:"${arrData[1].value}" ,noofvacancies:"${arrData[2].value}",remarks:"${arrData[3].value}"}`)
            objajax.done(function (response) {
                //$('#tagsinput').value = "";
                //$('#totalexperience').value = "";
                //$('#biodata').value = "";
            });
            e.preventDefault();
            return false;
        })
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
}