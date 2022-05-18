<?php

// Database parameters
$servername = "192.168.56.20";  // Defined in Vagrantfile
$username = "dbuser";           // Defined in script/db-bootstrap.sh
$password = "userpass";         // Defined in script/db-bootstrap.sh

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?> 