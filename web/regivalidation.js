function validation() {
    var fname = document.forms["form1"]["fname"].value;
    var lname = document.forms["form1"]["lname"].value;
    var address = document.forms["form1"]["add"].value;
    var dob = document.forms["form1"]["dob"].value;
    var city = document.forms["form1"]["city"].value;
    var state = document.forms["form1"]["state"].value;
    var postalcode = document.forms["form1"]["postalcode"].value;
    var contact = document.forms["form1"]["contact"].value;
    var email = document.forms["form1"]["email"].value;
    var username = document.forms["form1"]["username"].value;
    var password = document.forms["form1"]["password"].value;
    var securityq = document.forms["form1"]["securityq"].value;
    var securitya = document.forms["form1"]["securitya"].value;
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if (fname == "") {
        alert("Enter First name");
        return false;
    }
    else if (lname == "") {
        alert("Enter Last name");
        return false;
    }
    else if (dob == "") {
        alert("Enter Date Of Birth");
        return false;
    }
    else if (address == "") {
        alert("Enter address");
        return false;
    }
    else if (city == "") {
        alert("Enter city");
        return false;
    }
    else if (state == "") {
        alert("Enter state");
        return false;
    }
    else if (postalcode == "") {
        alert("Enter postalcode");
        return false;
    }
    else if (contact == "") {
        alert("Enter contact no");
        return false;
    }
    else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
    else if (username == "") {
        alert("Enter User Name");
        return false;
    }
    else if (password == "") {
        alert("Enter Password");
        return false;
    }
    else if (securityq == "") {
        alert("Plz select securit question");
        return false;
    }
    else if (securitya == "") {
        alert("Plz answer securit question");
        return false;
    }

    else {
        return true;
    }


}
