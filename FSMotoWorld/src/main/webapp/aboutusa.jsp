<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Siamo</title>
<link rel="stylesheet" href="images/bootstrap.css">
<link rel="stylesheet" href="Css/w3.css">
<link rel="stylesheet" href="Css/font.css">
<link rel="stylesheet" href="Css/abc.css">

<style>
    .w3-sidebar a {
        font-family: "Roboto", sans-serif;
    }
    body, h1, h2, h3, h4, h5, h6, .w3-wide {
        font-family: "Montserrat", sans-serif;
    }
    /* Stili per il banner e il contenuto */
    .banner {
        background-color: #ebe9eb;
        padding: 20px 0;
        text-align: center;
    }
    .content-container {
        background-color: #ffffff; /* Cambiato il colore di sfondo */
        padding: 20px;
        text-align: center; /* Modificato per allineare il testo a sinistra */
        margin-top: 20px; /* Aggiunto margine sopra */
    }
    .content-container p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px; /* Aggiunto margine sotto */
    }
    .content-container img {
        max-width: 100%;
        height: auto;
        margin-top: 20px; /* Aggiunto margine sopra l'immagine */
        margin-bottom: 20px; /* Aggiunto margine sotto l'immagine */
    }
   
</style>

</head>
<body>
<form action="" method="post">
    <%@ include file="admin_navbar.jsp" %>

    <div class="banner">
        <h1>Chi Siamo</h1>
    </div>

    <div class="content-container">
        <h2>Benvenuti in FS MotoWorld</h2>
        <p>FS MotoWorld, la vostra destinazione principale per tutto ciò che riguarda le moto ad Avellino e oltre. <br>
        Dalle nostre umili origini, ci siamo dedicati a fornire un servizio eccezionale e prodotti di alta qualità ai nostri stimati clienti. <br>
        In FS MotoWorld crediamo che le moto siano più di semplici veicoli; rappresentano libertà, avventura e passione. <br>
        Siamo qui per aiutare ogni cliente a trovare la moto perfetta che rispecchia il loro stile di guida e la loro personalità. <br>
        Esplora la nostra vasta selezione di moto delle migliori marche, dalle classiche ai modelli più innovativi. <br>
        Oltre alle vendite, offriamo servizi esperti di manutenzione e riparazione per mantenere la tua moto sempre efficiente. <br>
        Disponiamo anche di una gamma completa di accessori e abbigliamento per assicurare che ogni motociclista sia pronto per qualsiasi avventura.<br> 
        Siamo impegnati a promuovere un uso responsabile delle moto e a sostenere iniziative locali che promuovono la sicurezza stradale e la consapevolezza ambientale. <br>
        Sia che tu sia un motociclista esperto o stia considerando la tua prima moto, visita FS MotoWorld ad Avellino. <br>
        Il nostro team è pronto ad accoglierti, rispondere alle tue domande e aiutarti a trovare tutto ciò di cui hai bisogno per vivere appieno la tua passione per le moto.</p>
        <img src="images/aboutus2.jpg" alt="About Us" class="imgh">
    </div>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
</form>
</body>
</html>
