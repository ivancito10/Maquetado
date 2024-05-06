<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tipos de Cuentas Bancarias</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Tipos de Cuentas Bancarias</h1>
        <?php
        // Establecer conexión con la base de datos
        $servername = "localhost";
        $username = "root"; // Dejar en blanco
        $password = ""; // Dejar en blanco
        $database = "BDIvan";

        $conn = new mysqli($servername, $username, $password, $database);

        // Verificar la conexión
        if ($conn->connect_error) {
            die("Error de conexión: " . $conn->connect_error);
        }

        // Consulta SQL para obtener los tipos de cuentas bancarias
        $sql = "SELECT DISTINCT TipoCuenta FROM CuentaBancaria";
        $result = $conn->query($sql);

        // Verificar si se encontraron resultados
        if ($result->num_rows > 0) {
            // Iterar sobre los resultados y mostrar cada tipo de cuenta
            while ($row = $result->fetch_assoc()) {
                echo "<div class='cuenta'>";
                echo "<h2>{$row['TipoCuenta']}</h2>";
                echo "<p>Descripción de la cuenta...</p>";
                echo "</div>";
            }
        } else {
            echo "No se encontraron tipos de cuentas bancarias.";
        }

        // Cerrar la conexión
        $conn->close();
        ?>
    </div>
</body>
</html>
