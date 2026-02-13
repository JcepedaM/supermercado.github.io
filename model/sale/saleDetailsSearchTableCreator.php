<?php
session_start();
require_once('../../inc/config/constants.php');
require_once('../../inc/config/db.php');

// Verificar si el usuario tiene acceso a esta página.
if (!isset($_SESSION['userID']) || $_SESSION['userID'] !== 1) {
    // Mostrar un mensaje de error en lugar de redirigir
    echo '<div class="alert alert-danger">No tienes permisos para ver esta página.</div>';
    exit;
}
$uPrice = 0;
$qty = 0;
$totalPrice = 0;

$saleDetailsSearchSql = 'SELECT * FROM sale';
$saleDetailsSearchStatement = $conn->prepare($saleDetailsSearchSql);
$saleDetailsSearchStatement->execute();

$output = '<table id="saleDetailsTable" class="table table-sm table-striped table-bordered table-hover" style="width:100%">
            <thead>
                <tr>
                <th>ID de venta</th>
                <th>Número de artículo</th>
                <th>ID de cliente</th>
                <th>Nombre del cliente</th>
                <th>Nombre del elemento</th>
                <th>Fecha de venta</th>
                <th>% de descuento</th>
                <th>Cantidad</th>
                <th>Precio unitario</th>
                <th>Precio total</th>
                <th>Descripción</th> 
                </tr>
            </thead>
            <tbody>';

// Create table rows from the selected data
while ($row = $saleDetailsSearchStatement->fetch(PDO::FETCH_ASSOC)) {
    $uPrice = $row['unitPrice'];
    $qty = $row['quantity'];
    $discount = $row['discount'];
    $totalPrice = $uPrice * $qty * ((100 - $discount) / 100);

    $output .= '<tr>' .
        '<td>' . $row['saleID'] . '</td>' .
        '<td>' . $row['itemNumber'] . '</td>' .
        '<td>' . $row['customerID'] . '</td>' .
        '<td>' . $row['customerName'] . '</td>' .
        '<td>' . $row['itemName'] . '</td>' .
        '<td>' . $row['saleDate'] . '</td>' .
        '<td>' . $row['discount'] . '</td>' .
        '<td>' . $row['quantity'] . '</td>' .
        '<td>' . $row['unitPrice'] . '</td>' .
        '<td>' . $totalPrice . '</td>' .
        '<td>' . $row['description'] . '</td>' . 
        '</tr>';
}

$saleDetailsSearchStatement->closeCursor();

$output .= '</tbody>
            <tfoot>
                <tr>
                <th>ID de venta</th>
                <th>Número de artículo</th>
                <th>ID de cliente</th>
                <th>Nombre del cliente</th>
                <th>Nombre del elemento</th>
                <th>Fecha de venta</th>
                <th>% de descuento</th>
                <th>Cantidad</th>
                <th>Precio unitario</th>
                <th>Precio total</th>
                <th>Descripción</th>
                </tr>
            </tfoot>
        </table>';
echo $output;
?>


