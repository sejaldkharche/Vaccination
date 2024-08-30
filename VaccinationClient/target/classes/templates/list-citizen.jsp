<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Citizen Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
        text-transform: uppercase;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    .inner-table th, .inner-table td {
        border: none;
    }

    .inner-table th {
        background-color: #6FBF73;
        color: white;
    }

    .inner-table {
        margin: 10px 0;
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 10px;
    }
</style>
</head>
<body>
    <h1>Citizen Details</h1>
    <br>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Date of Birth</th>
                <th>Status</th>
                <th>Doses</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="citizen : ${user}">
                <td th:text="${citizen.userId}"></td>
                <td th:text="${citizen.name}"></td>
                <td th:text="${citizen.email}"></td>
                <td th:text="${citizen.phoneNumber}"></td>
                <td th:text="${citizen.address}"></td>
                <td th:text="${citizen.dateOfBirth}"></td>
                <td th:text="${citizen.status}"></td>
                <td>
                    <table class="inner-table">
                        <thead>
                            <tr>
                                <th>Dose Number</th>
                                <th>Vaccination Date</th>
                                <th>Vaccine Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr th:each="dose : ${citizen.vaccineDoses}">
                                <td th:text="${dose.doseNumber}"></td>
                                <td th:text="${dose.vaccinationDate}"></td>
                                <td th:text="${dose.vaccineType}"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
