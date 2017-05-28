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
                    <div class="card">
                        <div class="body">
                             <form id="frmCandidateDetails">
                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5">
                                        <label for="skills">Skills</label>
                                    </div>
                                    <div class="row clearfix">
                                        <%--<div class="demo-checkbox">
                                            <input type="checkbox" id="md_checkbox_21" class="filled-in chk-col-red" checked />
                                            <label for="md_checkbox_21">RED</label>
                                            <input type="checkbox" id="md_checkbox_22" class="filled-in chk-col-pink" checked />
                                            <label for="md_checkbox_22">PINK</label>
                                            <input type="checkbox" id="md_checkbox_23" class="filled-in chk-col-purple" checked />
                                            <label for="md_checkbox_23">PURPLE</label>
                                            <input type="checkbox" id="md_checkbox_24" class="filled-in chk-col-deep-purple" checked />
                                            <label for="md_checkbox_24">DEEP PURPLE</label>
                                            <input type="checkbox" id="md_checkbox_25" class="filled-in chk-col-indigo" checked />
                                            <label for="md_checkbox_25">INDIGO</label>
                                            <input type="checkbox" id="md_checkbox_21" class="filled-in chk-col-red" checked />
                                            <label for="md_checkbox_21">RED</label>
                                            <input type="checkbox" id="md_checkbox_22" class="filled-in chk-col-pink" checked />
                                            <label for="md_checkbox_22">PINK</label>
                                            <input type="checkbox" id="md_checkbox_23" class="filled-in chk-col-purple" checked />
                                            <label for="md_checkbox_23">PURPLE</label>
                                            <input type="checkbox" id="md_checkbox_24" class="filled-in chk-col-deep-purple" checked />
                                            <label for="md_checkbox_24">DEEP PURPLE</label>
                                            <input type="checkbox" id="md_checkbox_25" class="filled-in chk-col-indigo" checked />
                                            <label for="md_checkbox_25">INDIGO</label>
                                        </div>--%>
                                        <div class="col-lg-8 col-md-8 col-sm-6 col-xs-5">
                                            <div class="form-group demo-tagsinput-area">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tagsinput" data-role="tagsinput" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 
                                
                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5">
                                        <label for="email_address_2">Total Experience</label>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-4">
                                            <select class="form-control show-tick" name="totalexperience">
                                                <option value="">-- Please select --</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                    </div>
                                </div>
                                 <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5">
                                        <label for="skills">Bio Data</label>
                                    </div>
                                    <div class="row clearfix">
                                         <label class="btn btn-default btn-file">
                                            <input name="biodata" id="biodata" type="file" hidden>
                                        </label>
                                    </div>
                                     <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5">
                                        <button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
                                    </div>
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
