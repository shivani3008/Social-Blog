<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" method="post" action="ajax_call.aspx">
    <div>
        <input type="text" class="form-control" placeholder="Search" onkeyup="btn_search_bar_Click();"  id="txt_search_bar"/>
                      <button class="btn btn-default" id="btn_search_bar" onclick="btn_search_bar_Click();" type="button">Search
                      </button>
                    <div id="ContentPlaceHolder1">

                    </div>
    </div>
    </form>
    
    <script type="text/javascript">
        function btn_search_bar_Click() {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("post", "search.aspx?opr=search&key=" + document.getElementById("txt_search_bar").value, false);
            xmlHttp.send(null);
            document.getElementById("ContentPlaceHolder1").innerHTML = xmlHttp.responseText;
        }
    </script>
</body>
</html>
