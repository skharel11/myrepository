<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryView.ascx.cs" Inherits="Modules_Category_CategoryView" %>

<script>
    $(function(){
        GetAllCatgory();
    });

    function GetAllCatgory() {
        var PortalID = '<%=portalID%>'
        var UserModuleID = '<%=userModuleID%>'
        var CultureCode = '<%=cultureCode%>'
        
        $.ajax({
            url: "/Modules/Category/CategoryWebService.asmx/GetAllCategory",
            type: "POST",
            data: JSON.stringify({ portalID: PortalID, userModuleID: UserModuleID, cultureCode: CultureCode }),
            contentType: "application/json",
            async: true,
            success: function (data) {

                var html = '';
                if (data.d.length > 0) {
                    html += "<tr><th>#</th><th>Title</th><th>Detail</th><th>IsActive</th><th>AddedOn</th><th>AddedBy</th></tr>";
                    $.each(data.d, function (index, value) {
                        html += "<tr>"
                        html += "<td>" + (index + 1) + "</td>";
                        html += "<td>" + value.Title + "</td>";
                        html += "<td>" + value.Detail + "</td>";
                        html += "<td>" + value.IsActive + "</td>";
                        html += "<td>" + value.AddedOn + "</td>";
                        html += "<td>" + value.AddedBy + "</td>";
                        html += "</tr>";
                    });
                }
                else {
                    html = '<tr><th>No Records Found</th></tr>';
                }

                $("#tblCategoryList").html(html);
            },
            error: function (res) {
                alert("error occured");
            }
        });
    }
</script>

<h1>Category List</h1>

<div id="dvCategoryList" class="sfGridwrapper">
    <table id="tblCategoryList">
    </table>
</div>
