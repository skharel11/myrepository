<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryEdit.ascx.cs" Inherits="Modules_Category_CategoryEdit" %>

<h1>Category Edit</h1>

<div id="divAddCategoryForm" class="sfFormWrapper">
    <table id="tblAddCategory">
        <tr>
            <td>Title</td>
            <td>
                <input type="text" name="txtTile" value="" id="txtTitle" /></td>
        </tr>
        <tr>
            <td>Detail</td>
            <td>
                <textarea name="txtDetail" id="txtDetail"></textarea></td>
        </tr>
        <tr>
            <td>Is Active</td>
            <td>
                <input type="checkbox" name="chkIsActive" id="chkIsActive" /></td>
        </tr>
        <tr>
            <td>
                <input type="submit" name="btnSubmit" id="btnSubmit" value="Save" /></td>
            <td></td>
        </tr>

    </table>
</div>

<script>
    $(function () {

        $("#btnSubmit").click(function (e) {
            e.preventDefault();
            AddUpdateCategory();
        });

    });

    function AddUpdateCategory() {
        var PortalID = '<%=portalID%>'
        var UserModuleID = '<%=userModuleID%>'
        var CultureCode = '<%=cultureCode%>'
        var Username = '<%=username%>'

        var categoryInfo = {
            CategoryID: 0,
            Title: $("#txtTitle").val(),
            Detail: $("#txtDetail").val(),
            IsActive: $("#chkIsActive").prop("checked"),
            PortalID: PortalID,
            UserModuleID: UserModuleID,
            CultureCode: CultureCode,
            Username: Username
        };

        $.ajax({
            url: "/Modules/Category/CategoryWebService.asmx/AddUpdateCategory",
            type: "POST",
            data: JSON.stringify({ objCategory: categoryInfo }),
            contentType: "application/json",
            async: true,
            success: function (data) {
                alert("Data Added Successfully");
            },
            error: function (res) {
                alert("error occured");
            }
        });
    }
</script>
        
