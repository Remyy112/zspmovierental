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
        <h1>Movies</h1>
        <table>
            <tr><th>title</th><th>author</th><th>category</th></tr>
                <?php
                    $con = new mysqli("127.0.0.1", "root", "", "wypozyczalnia");
                    $hej = $con->query("SELECT Title, Author, Category FROM `movieslist`");
                    $siema = $hej->fetch_all(MYSQLI_ASSOC);
                        for($i=0;$i<count($siema); $i++){
                            echo "<tr><th>".$siema[$i]["Title"]."</th><th>".$siema[$i]["Author"]."</th><th>".$siema[$i]["Category"]."</th></tr>";
                        }
                ?>
        </table>
        <br>
        <a href="logowanie.php"><button>Sign In</button></a>
        <br>
        <br>
        <a href="rejestracja.php"><button>Register</button></a>
    </div>
    
    <div class="stopa">
        <h2>
            Contact:<br>
            E-mail: zsprentalmovie@gmail.com<br>
            Phone number: 111 222 333
        </h2> 
    </div>
</body>