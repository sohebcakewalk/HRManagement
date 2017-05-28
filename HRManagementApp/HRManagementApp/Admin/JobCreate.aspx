<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="JobCreate.aspx.cs" Inherits="HRManagementApp.Admin.JobCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input type="hidden" id="hdRecordid" />
    <div class="container-fluid">
        <div class="card">
            <div class="header">
                <h2>
                  Job Creation
                </h2>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="body">
                        <!--<form id="frmJobCreation">-->
                            <div class="col-md-12">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input name="jobtitle" id="jobtitle" class="form-control no-resize" required></input>
                                        <label class="form-label">Job Title*</label>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="col-md-12">
                                        <div class="form-group" >
                                            <div class="form-line">
                                                <select name="skills" id="drpSkills" data-live-search="true" class="form-control show-tick" multiple>
                                            </select>
                                        </div>
                                    </div>
                                </div>--%>
                            <div class="col-sm-12">
                                        <label for="skills">Skills</label>
                            </div>
                            <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <select name="skills"  id="skills"  data-live-search="true" class="form-control show-tick" multiple>
                                            <option>C#</option>
                                            <option>.Net</option>
                                            <option>ExtJs</option>
                                            <option>MY SQL</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                        <label for="noofpostions">No. of Positions</label>
                            </div>
                            <div class="col-sm-12">
                                <input type="number" class="form-control" min="1" id="noofpositions" name="noofpositions" placeholder="Number of Positions" required autofocus>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input name="requirements" id="requirements" class="form-control no-resize" required></input>
                                        <label class="form-label">Job Descriptions</label>
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <input type="checkbox" id="isactive" name="isactive" checked class="filled-in chk-col-pink"/>
                                    <label for="checkbox">Is Active</label>
                                </div>--%>
                                <div class="demo-switch">
                                <div class="switch">
                                    <label for="checkbox">Job Listing  </label> <label>InActive<input type="checkbox" id="isactive" name="isactive" checked><span class="lever"></span>Active</label>
                                </div>

                            </div>
                                <button class="btn btn-primary waves-effect" onclick="new Candidate().createjob();">SUBMIT</button>
                            </div>
                        <!--</form>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
         <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Job List</h2>
                    </div>
                    <div class="body">
                        <table id="tblJobs" class="table table-bordered table-striped table-hover js-basic-example ">
                        </table>
                    </div><!-- body -->
                </div>
            </div>
        </div>
    </div>
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <script src="candidate.js"></script>
    <script src="../Services/service.js"></script>
     <script>
         $(document).ready(()=> {
             new Candidate().GetJobListing();
         });
         
    </script>
</asp:Content>
