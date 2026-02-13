<?php
	session_start();
	require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
	
	// Verificar si el usuario tiene acceso a esta página.
	if (!isset($_SESSION['userID']) || $_SESSION['userID'] != 1) {
		// Mostrar un mensaje de error en lugar de redirigir
		echo '<div class="alert alert-danger">No tienes permisos para ver esta página.</div>';
		exit;
	}
	
	$vendorDetailsSearchSql = 'SELECT * FROM vendor';
	$vendorDetailsSearchStatement = $conn->prepare($vendorDetailsSearchSql);
	$vendorDetailsSearchStatement->execute();

	$output = '<table id="vendorDetailsTable" class="table table-sm table-striped table-bordered table-hover" style="width:100%">
				<thead>
					<tr>
					<th>ID del proveedor</th>
					<th>Nombre completo</th>
					<th>Correo electrónico</th>
					<th>Móvil</th>
					<th>Teléfono 2</th>
					<th>Dirección</th>
					<th>Dirección 2</th>
					<th>Ciudad</th>
					<th>Distrito</th>
					<th>Estado</th>
					</tr>
				</thead>
				<tbody>';
	
	// Create table rows from the selected data
	while($row = $vendorDetailsSearchStatement->fetch(PDO::FETCH_ASSOC)){
		$output .= '<tr>' .
						'<td>' . $row['vendorID'] . '</td>' .
						'<td>' . $row['fullName'] . '</td>' .
						'<td>' . $row['email'] . '</td>' .
						'<td>' . $row['mobile'] . '</td>' .
						'<td>' . $row['phone2'] . '</td>' .
						'<td>' . $row['address'] . '</td>' .
						'<td>' . $row['address2'] . '</td>' .
						'<td>' . $row['city'] . '</td>' .
						'<td>' . $row['district'] . '</td>' .
						'<td>' . $row['status'] . '</td>' .
					'</tr>';
	}
	
	$vendorDetailsSearchStatement->closeCursor();
	
	$output .= '</tbody>
					<tfoot>
						<tr>
						<th>ID del proveedor</th>
						<th>Nombre completo</th>
						<th>Correo electrónico</th>
						<th>Móvil</th>
						<th>Teléfono 2</th>
						<th>Dirección</th>
						<th>Dirección 2</th>
						<th>Ciudad</th>
						<th>Distrito</th>
						<th>Estado</th>
						</tr>
					</tfoot>
				</table>';
	echo $output;
?>