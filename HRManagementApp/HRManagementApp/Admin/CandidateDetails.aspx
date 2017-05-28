<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="CandidateDetails.aspx.cs" Inherits="HRManagementApp.Admin.CandidateDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="card">
            <div class="header">
                <h2>
                   Candidate Details
                </h2>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="body">
                             <form id="frmCandidateDetails">
                                  <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="tagsinput" data-live-search="true" class="form-control show-tick" multiple>
                                                <option>C#</option>
                                                <option>.Net</option>
                                                <option>ExtJs</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                 <div class="col-sm-12">
                                    <input type="number" class="form-control" min="1" name="totalexperience" placeholder="Number of Positions" required autofocus>
                                </div>
                                <div class="col-sm-12">
                                        <label for="skills">Upload your Resume</label>
                                    </div>
                                 <div class="col-sm-12">
                                     <label class="btn btn-default btn-file form-control"> 
                                            <input name="biodata" id="biodata" type="file" hidden>
                                    </label>
                                </div>
                                 <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5">
                                        <button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
                                </div>
                            </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <script src="candidate.js"></script>
    <script src="../Services/service.js"></script>
     <script>
         let candidate = new Candidate();      
         candidate.updatecandidate();
    </script>
</asp:Content>
