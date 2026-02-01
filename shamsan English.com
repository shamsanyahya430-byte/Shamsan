<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ShamsanEnglish.com | Learning with Videos</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f2f4f8;
}
header{
    background:#0a4da3;
    color:white;
    padding:25px;
    text-align:center;
}
nav{
    background:#063b7a;
    padding:12px;
    text-align:center;
}
nav a{
    color:white;
    margin:15px;
    text-decoration:none;
    font-weight:bold;
}
section{
    background:white;
    margin:20px;
    padding:25px;
    border-radius:8px;
}
h2{
    color:#0a4da3;
}
.video{
    margin:20px 0;
}
iframe{
    width:100%;
    height:315px;
    border-radius:8px;
}
input{
    width:100%;
    padding:10px;
    margin:8px 0;
}
button{
    background:#0a4da3;
    color:white;
    border:none;
    padding:10px 25px;
    border-radius:5px;
    cursor:pointer;
}
button:hover{
    background:#063b7a;
}
.certificate{
    border:3px dashed #0a4da3;
    padding:25px;
    text-align:center;
}
footer{
    background:#0a4da3;
    color:white;
    text-align:center;
    padding:15px;
}
</style>
</head>

<body>

<header>
    <h1>ShamsanEnglish.com</h1>
    <p>Learn Skills with Videos & Get Certified</p>
</header>

<nav>
    <a href="#register">Register</a>
    <a href="#english">English</a>
    <a href="#cooking">Cooking</a>
    <a href="#firstaid">First Aid</a>
    <a href="#certificate">Certificate</a>
</nav>

<section id="register">
    <h2>Student Registration</h2>
    <input type="text" id="name" placeholder="First Name">
    <input type="email" id="email" placeholder="Email Address">
    <button onclick="saveStudent()">Register</button>
    <p id="msg"></p>
</section>

<section id="english">
    <h2>English from Zero</h2>
    <p>Learn English step by step with videos.</p>

    <div class="video">
        <iframe src="https://www.youtube.com/embed/3JZ_D3ELwOQ" allowfullscreen></iframe>
        <p>English Alphabet & Pronunciation</p>
    </div>

    <div class="video">
        <iframe src="https://www.youtube.com/embed/1b7a1x8u6pQ" allowfullscreen></iframe>
        <p>Basic English Words</p>
    </div>
</section>

<section id="cooking">
    <h2>Cooking Skills</h2>
    <p>Simple cooking lessons for beginners.</p>

    <div class="video">
        <iframe src="https://www.youtube.com/embed/4aZr5hZXP_s" allowfullscreen></iframe>
        <p>Easy Cooking Basics</p>
    </div>
</section>

<section id="firstaid">
    <h2>First Aid</h2>
    <p>Learn how to act in emergency situations.</p>

    <div class="video">
        <iframe src="https://www.youtube.com/embed/fn9E5w4fZRM" allowfullscreen></iframe>
        <p>Basic First Aid Skills</p>
    </div>
</section>

<section id="certificate">
    <h2>Certificate</h2>

    <button onclick="generateCertificate()">Generate Certificate</button>

    <div class="certificate">
        <h3>Certificate of Completion</h3>
        <p>This certifies that</p>
        <h2 id="cname">Student Name</h2>
        <p>Email: <span id="cemail"></span></p>
        <p>Has completed learning at</p>
        <h3>ShamsanEnglish.com</h3>
        <p>Date: <span id="cdate"></span></p>
    </div>
</section>

<footer>
    <p>© 2026 ShamsanEnglish.com</p>
</footer>

<script>
function saveStudent(){
    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();

    if(name === "" || email === ""){
        document.getElementById("msg").innerHTML =
        "❌ Name and Email are required";
        return;
    }

    localStorage.setItem("name", name);
    localStorage.setItem("email", email);

    document.getElementById("msg").innerHTML =
    "✅ Registration successful";
}

function generateCertificate(){
    document.getElementById("cname").innerHTML =
    localStorage.getItem("name");

    document.getElementById("cemail").innerHTML =
    localStorage.getItem("email");

    document.getElementById("cdate").innerHTML =
    new Date().toLocaleDateString();
}
</script>

</body>
</html>
