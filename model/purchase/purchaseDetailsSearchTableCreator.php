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
	
	$purchaseDetailsSearchSql = 'SELECT * FROM purchase';
	$purchaseDetailsSearchStatement = $conn->prepare($purchaseDetailsSearchSql);
	$purchaseDetailsSearchStatement->execute();

	$output = '<table id="purchaseDetailsTable" class="table table-sm table-striped table-bordered table-hover" style="width:100%">
				<thead>
					<tr>
					<th>ID de compra</th>
					<th>Número de artículo</th>
					<th>Fecha de compra</th>
					<th>Nombre del elemento</th>
					<th>Precio unitario</th>
					<th>Cantidad</th>
					<th>Nombre del proveedor</th>
					<th>ID del proveedor</th>
					<th>Precio total</th>
					</tr>
				</thead>
				<tbody>';
	
	// Create table rows from the selected data
	while($row = $purchaseDetailsSearchStatement->fetch(PDO::FETCH_ASSOC)){
		$uPrice = $row['unitPrice'];
		$qty = $row['quantity'];
		$totalPrice = $uPrice * $qty;
		
		$output .= '<tr>' .
						'<td>' . $row['purchaseID'] . '</td>' .
						'<td>' . $row['itemNumber'] . '</td>' .
						'<td>' . $row['purchaseDate'] . '</td>' .
						'<td>' . $row['itemName'] . '</td>' .
						'<td>' . $row['unitPrice'] . '</td>' .
						'<td>' . $row['quantity'] . '</td>' .
						'<td>' . $row['vendorName'] . '</td>' .
						'<td>' . $row['vendorID'] . '</td>' .
						'<td>' . $totalPrice . '</td>' .
					'</tr>';
	}
	
	$purchaseDetailsSearchStatement->closeCursor();
	
	$output .= '</tbody>
					<tfoot>
						<tr>
						<th>ID de compra</th>
						<th>Número de artículo</th>
						<th>Fecha de compra</th>
						<th>Nombre del elemento</th>
						<th>Precio unitario</th>
						<th>Cantidad</th>
						<th>Nombre del proveedor</th>
						<th>ID del proveedor</th>
						<th>Precio total</th>
						</tr>
					</tfoot>
				</table>';
	echo $output;
?>


