
class Service {
    constructor() {
        this.POST = "POST";
        this.GET = "GET";
        this.DELETE = "DELETE";

    } 
    ajax(serviceName, method, data) {
        let Url = `../Services/Services.asmx/${serviceName}`;
        return $.ajax({
            type: method,            
            url: Url,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        });

        //return new Promise(function (resolve, reject) {
        //    $.ajax({
        //        type: method,
        //        url: Url,
        //        data: data,
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //    });
        //});
    }

    
}

