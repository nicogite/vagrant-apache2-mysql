<?php
$servername = "192.168.56.20";
$username = "dbuser";
$password = "userpass";
//DBNAME=dbname
//DBUSER=dbuser
//DBPASSWD=userpass

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?> 