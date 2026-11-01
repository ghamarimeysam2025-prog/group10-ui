<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelloWorld.aspx.cs" Inherits="CompanyLeadFinder.HelloWorld" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
    for (int i = 0; i < 10; i++)
        Response.Write("Hello World " + (i + 1) + " times <br>");
            %>

        </div>
    </form>
</body>
</html>
