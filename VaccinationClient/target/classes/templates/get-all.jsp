<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List of Citizens</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f8f8f8;
            color: #333;
            font-weight: bold;
        }

        td {
            color: #555;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
            font-size: 16px;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }

        a {
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Vaccine Dashboard</h1>
    <br>
    <input type="button" value="Add Citizen" onClick="window.location.href='addCitizen'">
    <br>
    <br>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Date Of Birth</th>
                <th>Status</th>
                <th>Add Dose</th>
                <th>More Details</th>
                <th>Delete Citizen</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="citizen : ${all}">
                <td th:text="${citizen.userId}"></td>
                <td th:text="${citizen.name}"></td>
                <td th:text="${citizen.email}"></td>
                <td th:text="${citizen.phoneNumber}"></td>
                <td th:text="${citizen.address}"></td>
                <td th:text="${citizen.dateOfBirth}"></td>
                <td th:text="${citizen.status}"></td>
                <td><a th:href="@{addDose/{id}(id=${citizen.userId})}">Add Dose</a></td>
                <td><a th:href="@{details/{id}(id=${citizen.userId})}">More Details</a></td>
                <td><a th:href="@{delete/{id}(id=${citizen.userId})}">Delete</a></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
