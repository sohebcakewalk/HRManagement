<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="JobCreate.aspx.cs" Inherits="HRManagementApp.Admin.JobCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="card">
            <div class="header">
                <h2>
                  Job Creation
                </h2>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="body">
                             <form id="frmJobCreation">
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input name="jobtitle" class="form-control no-resize" required></input>
                                                <label class="form-label">Job Title*</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="form-line">
                                               <select name="skills" class="form-control show-tick" multiple>
                                                <option>C#</option>
                                                <option>.Net</option>
                                                <option>ExtJs</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <input type="number" class="form-control" min="1" name="noofpositions" placeholder="Number of Positions" required autofocus>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="4" class="form-control no-resize" name="requirements" id="requirements" placeholder="Please type your job Descriptions"></textarea>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
                                </div>
                                
                            </form>
                        </div>
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
