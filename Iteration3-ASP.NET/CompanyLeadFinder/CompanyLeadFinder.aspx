<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyLeadFinder.aspx.cs" Inherits="CompanyLeadFinder.CompanyLeadFinder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="css/style.css" />
</head> 
       
<body>
    <form id="form1" runat="server">
        <header>
        <div>
            <h1>Company Lead Finder</h1>
            <p>Find recently registered Finnish companies</p>
        </div>

        <div class="header-company">
            Apex Logistics & Event Services Oy
        </div>
    </header>

    <div class="container">

        <div class="search-card">

            <h2>Search Criteria</h2>

            <div class="row">

                <div class="field">
                    <label>City</label>
                    <input type="text" name="city" value="<%= Request.Form["city"] %>" placeholder="Enter Finnish city" />
                </div>

                <div class="field business">
                    <label>Business Line</label>

                    <select name="businessLine">
<%    string[] businessLines =
    {
        "55 Accommodation",
        "56 Food and Beverage Services",
        "62 Computer Programming"
    };

    Response.Write("<option>Select business line</option>");

    for (int i = 0; i < businessLines.Length; i++)
    {
    string selected = "";

    if (Request.Form["businessLine"] == businessLines[i])
    {
        selected = " selected";
    }

    Response.Write("<option value=\"" + businessLines[i] + "\"" + selected + ">" + businessLines[i] + "</option>");
    }
%>
                    </select>
                </div>

                <div class="field">
                    <label>Registration From</label>
                    <input type="text" name="registrationFrom" value="<%= Request.Form["registrationFrom"] %>" placeholder="DD.MM.YYYY" />
                </div>

                <div class="field">
                    <label>Registration To</label>
                    <input type="text" name="registrationTo" value="<%= Request.Form["registrationTo"] %>" placeholder="DD.MM.YYYY" />
                </div>

            </div>

            <div class="bottom">

                <div class="field small">
                    <label>Maximum Results</label>

                    <select name="maxResults">
                           <option value="10" <%= Request.Form["maxResults"] == "10" ? "selected" : "" %>>10</option>
                           <option value="20" <%= Request.Form["maxResults"] == "20" ? "selected" : "" %>>20</option>
                    </select>
                </div>

            <button type="submit">
            Fetch Companies
            </button>
            </div>

        </div>

        <div class="result-box">
 <%
    if (Request.Form.Count != 0)
    {
        string city = Request.Form["city"].Trim();
        string businessLine = Request.Form["businessLine"];
        string registrationFrom = Request.Form["registrationFrom"];
        string registrationTo = Request.Form["registrationTo"];
        string maxResults = Request.Form["maxResults"];
        string [] companyName = 
        {
        "Nordic Tech Solutions Oy",
        "Helsinki Digital Services Oy",
        "Finnish Software Group Oy",
        "Blue Lake Systems Oy",
        "Arctic Code Solutions Oy",
         "Northern Data Oy",
        "Suomi Web Services Oy",
        "Baltic Software Oy",
        "Helsinki Cloud Systems Oy",
        "Nordic Code Works Oy",
        "Digital Finland Oy",
        "Smart Tech Finland Oy"
         };

        string[] businessIds =
        {
            "1234567-8",
            "2345678-9",
            "3456789-0",
            "4567890-1",
            "5678901-2",
            "6789012-3",
            "7890123-4",
            "8901234-5",
            "9012345-6",
            "1122334-7",
            "2233445-8",
            "3344556-9"
        };
        string registrationDate = registrationFrom;
        if (city == "" || businessLine == "Select business line" || registrationFrom == "" || registrationTo == "")
         {
            Response.Write("<h2>Please fill in all search fields.</h2>");
         }
        else if (city.ToLower() == "helsinki")
        {
        Response.Write("<h2>Search Results</h2>");
        Response.Write("<table class=\"results-table\">");
        int resultLimit = Convert.ToInt32(maxResults);

if (resultLimit > companyName.Length)
{
    resultLimit = companyName.Length;
}

for (int i = 0; i < resultLimit; i++)
{
    Response.Write("<tr>");
    Response.Write("<td>" + companyName[i] + "</td>");
    Response.Write("<td>" + businessIds[i] + "</td>");
    Response.Write("<td>" + city + "</td>");
    Response.Write("<td>" + businessLine + "</td>");
    Response.Write("<td>" + registrationFrom + "</td>");
    Response.Write("</tr>");
}
        Response.Write("</table>");
        }
        else
        {
        Response.Write("<h2>No Companies Found</h2>");
        Response.Write("<p>No companies matched your search criteria.</p>");
        }
    }
%>
        </div>

    </div>

    <footer>
        Company Lead Finder · Iteration 2 UI · Data source:
        Finnish Trade Register (simulated)
    </footer>
    </form>
</body>
</html>
