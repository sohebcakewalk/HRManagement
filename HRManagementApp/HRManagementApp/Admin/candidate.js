class Candidate{
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
}