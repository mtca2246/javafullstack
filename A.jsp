<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
 .form-container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
   .form-container h2 {
      text-align: center;
      background-image: linear-gradient(to right, #4285f4, #ea4335, #fbbc05, #34a853, #673ab7, #4285f4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
  .form-container input[type="text"],
    .form-container input[type="number"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }
  .form-container .button-container {
      text-align: center;
     
    }
  .button {
      background-color: #4CAF50;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-right: 10px;
    }
  .button.submit-button {
      background-color: #008CBA;
    }
  .button.clear-button {
      background-color: #f44336;
    }
    .student-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    .student-table th,
    .student-table td {
      padding: 8px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }
    .student-table th {
      background-color: #f2f2f2;
    }
    .delete-button {
      background-color: #f44336;
    }
    .edit-button {
      background-color: #FF9800;
    }
  </style>
</head>
<body>
  <div class="form-container">
    
    <form id="studentForm">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required>
      <label for="id">ID:</label>
      <input type="text" id="id" name="id" required>
      <label for="adhar">Aadhaar:</label>
      <input type="text" id="adhar" name="adhar" required>
     <label for="course">Course:</label>
      <input type="text" id="course" name="course" required>
      <label for="age">Age:</label>
      <input type="number" id="age" name="age" required>
      <div class="button-container">
        <button class="button" type="button" onclick="addRow()">Add Row</button>
        <button class="button submit-button" type="submit">Submit</button>
        <button class="button clear-button" type="button" onclick="clearForm()">Clear</button>
      </div>
    <h2>Student Information</h2></form>
  </div>
  <table id="studentTable" class="student-table">
    <thead>
      <tr>
        <th>Name</th>
        <th>ID</th>
        <th>Aadhaar</th>
        <th>Course</th>
        <th>Age</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody id="studentTableBody"></tbody>
  </table>
  <script>
    var editRowIndex = -1;
    function addRow() {
      var form = document.getElementById("studentForm");
      var nameInput = form.querySelector("#name");
      var idInput = form.querySelector("#id")
      var adharInput = form.querySelector("#adhar");
      var courseInput = form.querySelector("#course");
      var ageInput = form.querySelector("#age");
      var tableBody = document.getElementById("studentTableBody");
      var newRow = document.createElement("tr");
      var nameCell = document.createElement("td");
      nameCell.textContent = nameInput.value;
      var idCell = document.createElement("td");
      idCell.textContent = idInput.value;
      var adharCell = document.createElement("td");
      adharCell.textContent = adharInput.value;
      var courseCell = document.createElement("td");
      courseCell.textContent = courseInput.value;
      var ageCell = document.createElement("td");
      ageCell.textContent = ageInput.value;
      var editButtonCell = document.createElement("td");
      var editButton = document.createElement("button");
      editButton.className = "button edit-button";
      editButton.textContent = "Edit";
      editButton.addEventListener("click", function() {
        editRow(newRow);
      });
      editButtonCell.appendChild(editButton);
      var deleteButtonCell = document.createElement("td");
      var deleteButton = document.createElement("button");
      deleteButton.className = "button delete-button";
      deleteButton.textContent = "Delete";
      deleteButton.addEventListener("click", function() {
        deleteRow(newRow);
      });
      deleteButtonCell.appendChild(deleteButton);
      newRow.appendChild(nameCell);
      newRow.appendChild(idCell);
      newRow.appendChild(adharCell);
      newRow.appendChild(courseCell);
      newRow.appendChild(ageCell);
      newRow.appendChild(editButtonCell);
      newRow.appendChild(deleteButtonCell);
      tableBody.appendChild(newRow);
      // Clear the input fields
      nameInput.value = "";
      idInput.value = "";
      adharInput.value = "";
      courseInput.value = "";
      ageInput.value = "";
    }
    function deleteRow(row) {
      var tableBody = document.getElementById("studentTableBody");
      tableBody.removeChild(row);
    }
    function editRow(row) {
      var form = document.getElementById("studentForm");
      var nameInput = form.querySelector("#name");
      var idInput = form.querySelector("#id");
      var adharInput = form.querySelector("#adhar");
      var courseInput = form.querySelector("#course");
      var ageInput = form.querySelector("#age");
      var cells = row.getElementsByTagName("td");
      var name = cells[0].textContent;
      var id = cells[1].textContent;
      var adhar = cells[2].textContent;
      var course = cells[3].textContent;
      var age = cells[4].textContent;
      nameInput.value = name;
      idInput.value = id;
      adharInput.value = adhar;
      courseInput.value = course;
      ageInput.value = age;
   // Store the index of the row being edited
      editRowIndex = row.rowIndex;
    }
    function clearForm() {
      var form = document.getElementById("studentForm");
      form.reset();
      // Reset the editRowIndex
      editRowIndex = -1;
    }
    document.getElementById("studentForm").addEventListener("submit", function(event) {
      event.preventDefault();
      if (editRowIndex !== -1) {
        // Update the row if an edit is in progress
        var table = document.getElementById("studentTable");
        var row = table.rows[editRowIndex];
        var nameInput = document.getElementById("name");
        var idInput = document.getElementById("id");
        var adharInput = document.getElementById("adhar");
        var courseInput = document.getElementById("course");
        var ageInput = document.getElementById("age");
       row.cells[0].textContent = nameInput.value;
       row.cells[1].textContent = idInput.value;
        row.cells[2].textContent = adharInput.value;
        row.cells[3].textContent = courseInput.value;
        row.cells[4].textContent = ageInput.value;
        // Reset the form and editRowIndex
        clearForm();
      }
    });
 </script></body></html>
</body>
</html>