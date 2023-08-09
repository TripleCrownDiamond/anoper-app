<?php
session_start();
// Assurez-vous d'inclure la classe de connexion à la base de données ici
require_once("../../../configs/databaseconnect.php");

// Fonction pour générer un numéro de carte membre unique
function generateMemberCardNumber($DB)
{
    $prefix = "ANO"; // Préfixe du numéro de carte membre

    // Générer un nombre aléatoire unique de 6 chiffres (entre 000000 et 999999)
    do {
        $uniqueNumber = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
        $memberCardNumber = $prefix . $uniqueNumber;

        // Vérifier si le numéro de carte membre est déjà utilisé dans la base de données
        $stmt = $DB->query("SELECT idMembers FROM members WHERE numeroCarteMembre = ?", array($memberCardNumber));
        $stmt->fetch();
        $rowCount = $stmt->rowCount();

    } while ($rowCount > 0); // Répéter la génération jusqu'à obtenir un numéro unique

    return $memberCardNumber;
}


// Vérifier si les données ont été transmises
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Les données ont été transmises avec succès
    // Vous pouvez effectuer ici toutes les opérations nécessaires avec les données reçues

    // Récupération des données du formulaire
    $dateAdhesion = $_POST["dateAdhesion"];
    $departement = $_POST["departement"];
    $commune = $_POST["commune"];
    $arrondissement = $_POST["arrondissement"];
    $udoper = $_POST["udoper"];
    $village = $_POST["village"];
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $dateNaissance = $_POST["dateNaissance"];
    $lieuNaissance = $_POST["lieuNaissance"];
    $sexe = $_POST["sexe"];
    $tel = $_POST["tel"];
    $typePieceIdentite = $_POST["typePieceIdentite"];
    $numeroPieceIdentite = $_POST["numeroPieceIdentite"];
    $dateExpirationPieceIdentite = $_POST["dateExpirationPieceIdentite"];
    $ovins = $_POST["ovins"];
    $bovins = $_POST["bovins"];
    $caprins = $_POST["caprins"];
    $memberCardNumber = generateMemberCardNumber($DB);
    $userId = $_SESSION['user_id']; // Modifier $_SESSION['user_id'] selon votre implémentation de gestion de session


    // Enregistrement des images dans les dossiers correspondants
    $uploadDir = "../files/";
    $photoMembreDir = $uploadDir . "photo_membre/";
    $photoPieceIdentiteDir = $uploadDir . "photo_piece_identite/";
    $signatureScanDir = $uploadDir . "signature_scan/";
    $qrCodeDir = $uploadDir . "qrcode/";

    // Vérifier si les dossiers existent, sinon les créer
    if (!file_exists($photoMembreDir)) {
        mkdir($photoMembreDir, 0777, true);
    }
    if (!file_exists($photoPieceIdentiteDir)) {
        mkdir($photoPieceIdentiteDir, 0777, true);
    }
    if (!file_exists($signatureScanDir)) {
        mkdir($signatureScanDir, 0777, true);
    }
    if (!file_exists($qrCodeDir)) {
        mkdir($qrCodeDir, 0777, true);
    }

    // Générer des noms uniques pour les fichiers
    $photoMembreFileName = "photo_membre_" . uniqid() . "." . pathinfo($_FILES["photoMembre"]["name"], PATHINFO_EXTENSION);
    $photoPieceIdentiteFileName = "photo_piece_identite_" . uniqid() . "." . pathinfo($_FILES["photoPieceIdentite"]["name"], PATHINFO_EXTENSION);
    $signatureScanFileName = "signature_scan_" . uniqid() . "." . pathinfo($_FILES["signatureScan"]["name"], PATHINFO_EXTENSION);
    $qrCodeFileName = "qrcode_" . uniqid() . ".png";

    // Enregistrement des fichiers d'images et récupération des chemins des fichiers
    $photoMembrePath = $photoMembreDir . $photoMembreFileName;
    $photoPieceIdentitePath = $photoPieceIdentiteDir . $photoPieceIdentiteFileName;
    $signatureScanPath = $signatureScanDir . $signatureScanFileName;
    $qrCodePath = $qrCodeDir . $qrCodeFileName;

    move_uploaded_file($_FILES["photoMembre"]["tmp_name"], $photoMembrePath);
    move_uploaded_file($_FILES["photoPieceIdentite"]["tmp_name"], $photoPieceIdentitePath);
    move_uploaded_file($_FILES["signatureScan"]["tmp_name"], $signatureScanPath);

    // Génération du code QR avec toutes les données du formulaire
    $qrCodeData = json_encode($_POST); // Vous pouvez remplacer $_POST par les données spécifiques que vous souhaitez inclure dans le code QR

    // Utilisation de la bibliothèque "PHP QR Code" pour générer le code QR
    require_once("../../phpqrcode/qrlib.php");
    QRcode::png($qrCodeData, $qrCodePath, 'L', 10, 2);

        
    // Enregistrement des données dans la base de données
    $stmt = $DB->query("INSERT INTO members (dateAdhesion, idDepartement, idCommune, idArrondissement, idUdoper, village, nom, prenom, dateNaissance, lieuNaissance, sexe, tel, idTypePieceIdentite, numeroPiece, photoPieceIdentite, dateExpirationPieceIdentite, ovins, bovins, caprins, photoMembre, signatureScan, qrCodePath, numeroCarteMembre, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($dateAdhesion, $departement, $commune, $arrondissement, $udoper, $village, $nom, $prenom, $dateNaissance, $lieuNaissance, $sexe, $tel, $typePieceIdentite, $numeroPieceIdentite, $photoPieceIdentitePath, $dateExpirationPieceIdentite, $ovins, $bovins, $caprins, $photoMembrePath, $signatureScanPath, $qrCodePath, $memberCardNumber, $userId));

if ($stmt) {
    // Enregistrement réussi
    echo json_encode(array("success" => true, "message" => "Les données ont été enregistrées avec succès dans la base de données."));
} else {
    // Erreur lors de l'enregistrement
    echo json_encode(array("success" => false, "message" => "Erreur lors de l'enregistrement dans la base de données. Veuillez réessayer."));
}
} else {
    // Répondre avec une erreur indiquant que le serveur est injoignable
    echo json_encode(array("success" => false, "message" => "Le serveur est injoignable. Veuillez réessayer plus tard."));
}
