<!DOCKTYPE html>
<head>
    <meta charset="utf-8">
    <title>Wypożyczalnia filmów</title>
</head>

<link rel="stylesheet" href="wypozyczalnia.css">

<body>
    <div class="baner">
        <h1>ZSP Movie Rental</h1>
    </div>
    <div class="blokglowny">
        <?php
            if(!empty($_COOKIE["id"])){
                header('location: '.'logowanie.php');
            }
                $con = new mysqli("127.0.0.1", "root", "", "wypozyczalnia");
                    if(isset($_POST["email"]) && isset($_POST["password"])){
                        $sql = 'SELECT id FROM users WHERE email="'.$_POST['email'].'" AND password="'.$_POST['password'].'"';
                        $res = $con->query($sql);
                        $res2 = $res->fetch_array();
                        if(!empty($res2["id"])){
                            setcookie("id",$res2["id"]);
                            header('location: '.'menu.php');
                            }
                        }
        ?>
        <form method="POST">
            <br>
            <h1>Sign In</h1>
            E-mail:
            <br>
            <input type="text" name="email">
            <br>
            <br>
            Password:
            <br>
            <input type="password" name="password">
            <br>
            <br>
            <input type="submit" value="Sign In">
            </form>
            <a href="rejestracja.php"><button>Register</button></a>
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