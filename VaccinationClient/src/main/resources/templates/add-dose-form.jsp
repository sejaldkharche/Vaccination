<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Dose</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="number"],
        input[type="date"],
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form th:action="@{/citizen/addDoseforUser}" th:object="${vaccineDto}" method="post">
        <h1>Add Dose</h1>

        <label for="userId">User ID:</label>
        <input type="number" id="userId" th:field="*{userId}" readonly />

        <label for="doseNumber">Dose Number:</label>
        <input type="number" id="doseNumber" th:field="*{doseNumber}" />

        <label for="vaccinationDate">Vaccination Date:</label>
        <input type="date" id="vaccinationDate" th:field="*{vaccinationDate}" />

        <label for="vaccineType">Vaccine Type:</label>
        <input type="text" id="vaccineType" th:field="*{vaccineType}" />

        <input type="submit" value="Add Dose" />
    </form>
</body>
</html>
