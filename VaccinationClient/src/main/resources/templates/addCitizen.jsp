<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Citizen</title>
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

        input[type="text"],
        input[type="email"],
        input[type="date"],
        select {
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

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form th:action="@{saveCitizen}" th:object="${citizen}" method="post">
        <h1>Add Citizen</h1>
        <label for="name">Name:</label>
        <input type="text" id="name" th:field="*{name}" />

        <label for="email">Email:</label>
        <input type="email" id="email" th:field="*{email}" />

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" th:field="*{phoneNumber}" />

        <label for="address">Address:</label>
        <input type="text" id="address" th:field="*{address}" />

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" th:field="*{dateOfBirth}" />

        <label for="status">Status:</label>
        <select id="status" th:field="*{status}">
            <option value="Not Vaccinated">Not Vaccinated</option>
            <option value="Partially Vaccinated">Partially Vaccinated</option>
            <option value="Fully Vaccinated">Fully Vaccinated</option>
        </select>

        <input type="submit" value="Add Citizen"/>
    </form>
</body>
</html>
