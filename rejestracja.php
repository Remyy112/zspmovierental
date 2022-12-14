<!DOCKTYPE html>
<head>
    <meta charset="utf-8">
    <title>Wypożyczalnia filmów</title>
</head>

<link rel="stylesheet" href="wypozyczalnia.css">

<body>
    <?php
        $con = new mysqli("127.0.0.1", "root", "", "wypozyczalnia");
            if(isset($_POST["name"]) && strlen($_POST["name"])>0  && isset($_POST["sname"]) && isset($_POST["username"]) && isset($_POST["email"]) && isset($_POST["password"])){
                $sql="INSERT INTO `users`(`id`, `name`, `sname`, `username`, `email`, `password`, `isadmin`) VALUES ('NULL','".$_POST["name"]."','".$_POST["sname"]."','".$_POST["username"]."','".$_POST["email"]."','".$_POST["password"]."','no')";
                $con->query($sql);
                header('location: '.'logowanie.php');
            }
    ?>
    <div class="baner">
        <h1>ZSP Movie Rental</h1>
    </div>
    
    <div class="blokglowny">
        <h1>Register</h1>
        <br>
    <form method="POST">
        Name:<br>
        <input name="name"><br>
        S. Name:<br>
        <input name="sname"><br>
        Username<br>
        <input name="username"><br>
        Email:<br>
        <input name="email"><br>
        Password:<br>
        <input name="password" type="password">
        <br>
        <br>
        <input type="submit" value="Register!">
    </form>
        
    <a href="logowanie.php"><button>Sign In</button></a>
    <br>
    <br>
    <a href="filmy.php"><button>Movies</button></a>
    </div>
    
    <div class="stopa">
        <h2>
            Contact:<br>
            E-mail: zsprentalmovie@gmail.com<br>
            Phone number: 111 222 333
        </h2> 
    </div>
</body>