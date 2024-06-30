<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String number = request.getParameter("number");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant", "root", "Bala@123");
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM my_table WHERE Fullname = ? AND phoneNumber = ?");
        pstmt.setString(1, name);
        pstmt.setString(2, number);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Table Details</title>
</head>
<body>
    <h1>Update Table Details</h1>
    <form action="UpdateTableServlet" method="post">
        <label for="FullName">Full Name:</label>
        <input type="text" id="FullName" name="FullName" value="<%=rs.getString(1)%>" required><br>

        <label for="Persons">No. of Persons:</label>
        <input type="text" id="Persons" name="Persons" value="<%=rs.getString(2)%>" required><br>

        <label for="PhoneNumber">Phone Number:</label>
        <input type="text" id="PhoneNumber" name="PhoneNumber" value="<%=rs.getString(3)%>" required><br>

        <label for="Date">Reserved Date:</label>
        <input type="date" id="Date" name="Date" value="<%=rs.getString(4)%>" required><br>

        <label for="Time">Reserved Time:</label>
        <input type="time" id="Time" name="Time" value="<%=rs.getString(5)%>" required><br>

        <label for="category">Type of Meal:</label>
        <select id="category" name="category" required>
            <option value="<%=rs.getString(6)%>" selected><%=rs.getString(6)%></option>
            <option value="Veg">Veg</option>
            <option value="NonVeg">NonVeg</option>
            <option value="Both">Both</option>
        </select><br>
         <div class="table-flex-container" id="my-input-cont">
          
          </div>

        <input type="submit" value="Update">
    </form>
    
    
    <script>
    
    const myFormContainer = document.getElementById("my-input-cont");
    let selectCategory = document.getElementById("category");
    selectCategory.addEventListener('change', function() {
        const CategoryValue = this.value;

        if(CategoryValue === 'Veg'){

        let divContainer = document.createElement("div");
        divContainer.classList.add("each-input-container");
        myFormContainer.appendChild(divContainer);
        let labelEle = document.createElement("label");
        labelEle.textContent = "ItemName";
        labelEle.htmlFor ="itemName";
        divContainer.appendChild(labelEle);
        let selectEle = document.createElement("select");
        selectEle.id = "itemName";
        selectEle.name = "itemName" 
        divContainer.appendChild(selectEle);
        let option0 = document.createElement("option");
        option0.textContent = "<%=rs.getString(7)%>";
        option0.value="<%=rs.getString(7)%>";
        option0.setAttribute("Selected","Selected");
        selectEle.appendChild(option0);
        let optionmenu = document.createElement("option");
        optionmenu.textContent = "VegMenu";
        selectEle.appendChild(optionmenu);
        let option1 = document.createElement("option");
        option1.textContent = "Vegetable Biryani";
        option1.value = "Vegetable Biryani"; 
        selectEle.appendChild(option1);
        let option2 = document.createElement("option");
        option2.textContent = "Paneer Biryani";
        option2.value = "Paneer Biryani"; 
        selectEle.appendChild(option2);
        let option3 = document.createElement("option");
        option3.textContent = "Mushroom Biryani";
        option3.value = "Mushroom Biryani"; 
        selectEle.appendChild(option3);
        let option4 = document.createElement("option");
        option4.textContent = "Mushroom Biryani";
        option4.value = "Mushroom Biryani"; 
        selectEle.appendChild(option4);
        let option5 = document.createElement("option");
        option5.textContent = "Soya Biryani";
        option5.value = "Soya Biryani"; 
        selectEle.appendChild(option5);
        let option6 = document.createElement("option");
        option6.textContent = "Vegetable Dum Biryani";
        option6.value = "Vegetable Dum Biryani"; 
        selectEle.appendChild(option6);
        let option7 = document.createElement("option");
        option7.textContent = "Hyderabadi Vegetable Biryani";
        option7.value = "Hyderabadi Vegetable Biryani"; 
        selectEle.appendChild(option7);
        let option8 = document.createElement("option");
        option8.textContent = "Zafrani Vegetable Biryani";
        option8.value = "Zafrani Vegetable Biryani"; 
        selectEle.appendChild(option8);
        let option9 = document.createElement("option");
        option9.textContent = "Vegetable Tikka Biryani";
        option9.value = "Vegetable Tikka Biryani"; 
        selectEle.appendChild(option9);
        let option10 = document.createElement("option");
        option10.textContent = "Kashmiri Vegetable Biryani";
        option10.value = "Kashmiri Vegetable Biryani"; 
        selectEle.appendChild(option10);

        let divContainer1 = document.createElement("div");
        divContainer1.classList.add("each-input-container");
        myFormContainer.appendChild(divContainer1);
        let labelEle1 = document.createElement("label");
        labelEle1.textContent = "TableNumber";
        labelEle1.htmlFor = "tableNumber";
        labelEle1.classList.add("each-form-name");
        divContainer1.appendChild(labelEle1);
        let selectEle1 = document.createElement("select");
        selectEle1.classList.add("each-form");
        selectEle1.id = "tableNumber";
        selectEle1.name = "tableNumber";
        divContainer1.appendChild(selectEle1);
        let optionEle0 = document.createElement("option");
        optionEle0.textContent = "<%=rs.getString(8)%>";
        optionEle0.value = "<%=rs.getString(8)%>";
        optionEle0.setAttribute("Selected","Selected");
        selectEle1.appendChild(optionEle0);
        let optiont = document.createElement("option");
        optiont.textContent = "Veg Tables";
        selectEle1.appendChild(optiont);
        let optionEle = document.createElement("option");
        optionEle.textContent = "1--Morethan 5 persons";
        optionEle.value = "1--Morethan 5 persons";
        selectEle1.appendChild(optionEle);
        let optionEle1 = document.createElement("option");
        optionEle1.textContent = "2--for 4 persons";
        optionEle1.value = "2--for 4 persons";
        selectEle1.appendChild(optionEle1);
        let optionEle2 = document.createElement("option");
        optionEle2.textContent = "3--for 5 persons";
        optionEle2.value = "3--for 5 persons";
        selectEle1.appendChild(optionEle2);
        let optionEle3 = document.createElement("option");
        optionEle3.textContent = "4--for 3 persons";
        optionEle3.value = "4--for 3 persons";
        selectEle1.appendChild(optionEle3);
        let optionEle4 = document.createElement("option");
        optionEle4.textContent = "5--for 2 persons";
        optionEle4.value = "5--for 2 persons";
        selectEle1.appendChild(optionEle4);
        let optionEle5 = document.createElement("option");
        optionEle5.textContent = "6--for 1 person";
        optionEle5.value = "6--for 1 person";
        selectEle1.appendChild(optionEle5);
      }
      else if(CategoryValue==='NonVeg'){
        let divContainer = document.createElement("div");
        divContainer.classList.add("each-input-container");
        myFormContainer.appendChild(divContainer);
        let labelEle = document.createElement("label");
        labelEle.textContent = "ItemName";
        labelEle.htmlFor ="itemName";
        divContainer.appendChild(labelEle);
        let selectEle = document.createElement("select");
        selectEle.id = "itemName";
        selectEle.name = "itemName" 
        divContainer.appendChild(selectEle);
        let option0 = document.createElement("option");
        option0.textContent = "<%=rs.getString(7)%>";
        option0.value="<%=rs.getString(7)%>";
        option0.setAttribute("Selected","Selected");
        selectEle.appendChild(option0);
        let optionmenu = document.createElement("option");
        optionmenu.textContent = "NonVegMenu";
        selectEle.appendChild(optionmenu);
        let option1 = document.createElement("option");
        option1.textContent = "Chicken Biryani";
        option1.value = "ChickenBiryani"; 
        selectEle.appendChild(option1);
        let option2 = document.createElement("option");
        option2.textContent = "ChickenDumBiryani";
        option2.value = "ChickenDumBiryani"; 
        selectEle.appendChild(option2);
        let option3 = document.createElement("option");
        option3.textContent = "FishBiryani";
        option3.value = "FishBiryani"; 
        selectEle.appendChild(option3);
        let option4 = document.createElement("option");
        option4.textContent = "PrawnsBiryani";
        option4.value = "PrawnsBiryani"; 
        selectEle.appendChild(option4);
        let option5 = document.createElement("option");
        option5.textContent = "Chickenlolipop";
        option5.value = "Chickenlolipop"; 
        selectEle.appendChild(option5);
        let option6 = document.createElement("option");
        option6.textContent = "Chicken65";
        option6.value = "Chicken65"; 
        selectEle.appendChild(option6);
        let option7 = document.createElement("option");
        option7.textContent = "MuttonBiriyani";
        option7.value = "MuttonBiriyani"; 
        selectEle.appendChild(option7);
        let option8 = document.createElement("option");
        option8.textContent = "MuttonDumBiriyani";
        option8.value = "MuttonDumBiriyani"; 
        selectEle.appendChild(option8);
        let option9 = document.createElement("option");
        option9.textContent = "MuttonJuiceBiriyani";
        option9.value = "MuttonJuiceBiriyani"; 
        selectEle.appendChild(option9);
        let option10 = document.createElement("option");
        option10.textContent = "Hyderabadi special Biriyani";
        option10.value = "Hyderabadi special Biriyani"; 
        selectEle.appendChild(option10);

        let divContainer1 = document.createElement("div");
        divContainer1.classList.add("each-input-container");
        myFormContainer.appendChild(divContainer1);
        let labelEle1 = document.createElement("label");
        labelEle1.textContent = "TableNumber";
        labelEle1.htmlFor = "tableNumber";
        labelEle1.classList.add("each-form-name");
        divContainer1.appendChild(labelEle1);
        let selectEle1 = document.createElement("select");
        selectEle1.classList.add("each-form");
        selectEle1.id = "tableNumber";
        selectEle1.name = "tableNumber";
        divContainer1.appendChild(selectEle1);
        let optionEle0 = document.createElement("option");
        optionEle0.textContent = "<%=rs.getString(8)%>";
        optionEle0.value = "<%=rs.getString(8)%>";
        optionEle0.setAttribute("Selected","Selected");
        selectEle1.appendChild(optionEle0);
        let optiont = document.createElement("option");
        optiont.textContent = "NonVeg Tables";
        selectEle1.appendChild(optiont);
        let optionEle = document.createElement("option");
        optionEle.textContent = "7--for 4 persons";
        optionEle.value = "7--for 4 persons";
        selectEle1.appendChild(optionEle);
        let optionEle1 = document.createElement("option");
        optionEle1.textContent = "8--Morethan 5 persons";
        optionEle1.value = "8--Morethan 5 persons";
        selectEle1.appendChild(optionEle1);
        let optionEle2 = document.createElement("option");
        optionEle2.textContent = "9--for 5 persons";
        optionEle2.value = "9--for 5 persons";
        selectEle1.appendChild(optionEle2);
        let optionEle3 = document.createElement("option");
        optionEle3.textContent = "10--for 1 person";
        optionEle3.value = "10--for 1 person";
        selectEle1.appendChild(optionEle3);
        let optionEle4 = document.createElement("option");
        optionEle4.textContent = "11--for 2 persons";
        optionEle4.value = "11--for 2 persons";
        selectEle1.appendChild(optionEle4);
        let optionEle5 = document.createElement("option");
        optionEle5.textContent = "12--for 3 persons";
        optionEle5.value = "12--for 3 persons";
        selectEle1.appendChild(optionEle5);
      }
      else if(CategoryValue==='Both'){
        let divContainer = document.createElement("div");
        divContainer.classList.add("each-input-container");
        myFormContainer.appendChild(divContainer);
        let labelEle = document.createElement("label");
        labelEle.textContent = "ItemName";
        labelEle.htmlFor ="itemName";
        divContainer.appendChild(labelEle);
        let selectEle = document.createElement("select");
        selectEle.id = "itemName";
        selectEle.name = "itemName" 
        divContainer.appendChild(selectEle);
        let optionmenu = document.createElement("option");
        let option0 = document.createElement("option");
        option0.textContent = "<%=rs.getString(7)%>";
        option0.value="<%=rs.getString(7)%>";
        option0.setAttribute("Selected","Selected");
        selectEle.appendChild(option0);
        optionmenu.textContent = "BothMenu";
        selectEle.appendChild(optionmenu);
        let option1 = document.createElement("option");
        option1.textContent = "Chicken Biryani";
        option1.value = "ChickenBiryani"; 
        selectEle.appendChild(option1);
        let option2 = document.createElement("option");
        option2.textContent = "ChickenDumBiryani";
        option2.value = "ChickenDumBiryani"; 
        selectEle.appendChild(option2);
        let option3 = document.createElement("option");
        option3.textContent = "FishBiryani";
        option3.value = "FishBiryani"; 
        selectEle.appendChild(option3);
        let option4 = document.createElement("option");
        option4.textContent = "MuttonBiryani";
        option4.value = "MuttonBiryani"; 
        selectEle.appendChild(option4);
        let option5 = document.createElement("option");
        option5.textContent = "Hyderabadi Biriyani";
        option5.value = "Hyderabadi Biriyani"; 
        selectEle.appendChild(option5);
        let option6 = document.createElement("option");
        option6.textContent = "Vegetable Dum Biryani";
        option6.value = "Vegetable Dum Biryani"; 
        selectEle.appendChild(option6);
        let option7 = document.createElement("option");
        option7.textContent = "Hyderabadi Vegetable Biryani";
        option7.value = "Hyderabadi Vegetable Biryani"; 
        selectEle.appendChild(option7);
        let option8 = document.createElement("option");
        option8.textContent = "Zafrani Vegetable Biryani";
        option8.value = "Zafrani Vegetable Biryani"; 
        selectEle.appendChild(option8);
        let option9 = document.createElement("option");
        option9.textContent = "Vegetable Tikka Biryani";
        option9.value = "Vegetable Tikka Biryani"; 
        selectEle.appendChild(option9);
        let option10 = document.createElement("option");
        option10.textContent = "Kashmiri Vegetable Biryani";
        option10.value = "Kashmiri Vegetable Biryani"; 
        selectEle.appendChild(option10);

        let divContainer1 = document.createElement("div");
        divContainer1.classList.add("each-input-container");
        myFormContainer.appendChild(divContainer1);
        let labelEle1 = document.createElement("label");
        labelEle1.textContent = "TableNumber";
        labelEle1.htmlFor = "tableNumber";
        labelEle1.classList.add("each-form-name");
        divContainer1.appendChild(labelEle1);
        let selectEle1 = document.createElement("select");
        selectEle1.classList.add("each-form");
        selectEle1.id = "tableNumber";
        selectEle1.name = "tableNumber";
        divContainer1.appendChild(selectEle1);
        let optionEle0 = document.createElement("option");
        optionEle0.textContent = "<%=rs.getString(8)%>";
        optionEle0.value = "<%=rs.getString(8)%>";
        optionEle0.setAttribute("Selected","Selected");
        selectEle1.appendChild(optionEle0);
        let optiont = document.createElement("option");
        optiont.textContent = "Both Tables";
        selectEle1.appendChild(optiont);
        let optionEle = document.createElement("option");
        optionEle.textContent = "13--for 1 person";
        optionEle.value = "13--for 1 person";
        selectEle1.appendChild(optionEle);
        let optionEle1 = document.createElement("option");
        optionEle1.textContent = "14--for 2 persons";
        optionEle1.value = "14--for 2 persons";
        selectEle1.appendChild(optionEle1);
        let optionEle2 = document.createElement("option");
        optionEle2.textContent = "15--for 3 persons";
        optionEle2.value = "15--for 3 persons";
        selectEle1.appendChild(optionEle2);
        let optionEle3 = document.createElement("option");
        optionEle3.textContent = "16--for 5 persons";
        optionEle3.value = "16--for 5 persons";
        selectEle1.appendChild(optionEle3);
        let optionEle4 = document.createElement("option");
        optionEle4.textContent = "17--for 4 persons";
        optionEle4.value = "17--for 4 persons";
        selectEle1.appendChild(optionEle4);
        let optionEle5 = document.createElement("option");
        optionEle5.textContent = "18--Morethan 5 persons";
        optionEle5.value = "18--Morethan 5 persons";
        selectEle1.appendChild(optionEle5);
      }
       
    });
    
    
    
    </script>
</body>
</html>
<%
        } else {
            out.println("<h1>No table found to update.</h1>");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>