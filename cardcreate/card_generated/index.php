<?php

require_once('../../configs/databaseconnect.php');

if (!isset($_GET['cardid']) || empty($_GET['cardid'])) {
    die("ID de la carte non fourni.");
}

$cardNumber = $_GET['cardid'];

$stmt = $DB->query("SELECT m.*, 
d.name AS nom_departement, 
c.name AS nom_commune, 
a.name AS nom_arrondissement, 
u.name AS nom_udoper, 
t.type AS nom_type_piece,
z.nom AS z_nom,          
z.prenom AS z_prenom      
FROM members m
LEFT JOIN departements d ON m.idDepartement = d.idDepartements
LEFT JOIN communes c ON m.idCommune = c.idCommunes
LEFT JOIN arrondissements a ON m.idArrondissement = a.idArrondissements
LEFT JOIN udopers u ON m.idUdoper = u.idUdopers
LEFT JOIN type_piece_identite t ON m.idTypePieceIdentite = t.id
LEFT JOIN users z ON m.user_id = z.id
WHERE m.numeroCarteMembre = ?", array($cardNumber));
$datas = $stmt->fetch();

if (!$datas) {
    die("Données non trouvées pour cet ID.");
}

function formatDateFrench($dateStr)
{
    // Convertir la date en objet DateTime
    $dateObj = new DateTime($dateStr);

    // Formater la date au format français avec l'heure (jj/mm/aaaa à HH:mm:ss)
    return $dateObj->format('d/m/Y');
}



?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Générer carte de membre de données</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.3.3/dist/html2canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript" src="./html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
        .member-card {
            width: 154.08mm;
            /* 85.6mm * 1.8 */
            height: 97.164mm;
            /* 53.98mm * 1.8 */
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
        }

        .header-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .img-fluid {
            max-width: 100%;
        }
    </style>
</head>

<body>

    <div class="container mt-5">
        <div class="container mt-4 mb-4">

        </div>
        <div class="container">
            <div class="row" style="font-size: 12px">
                <div class="col-lg-6 mx-auto">
                    <div class="card member-card" id="idcard">
                        <!-- Contenu de la carte -->
                        <div class="container p-3">
                            <div class="header-card mb-3">
                                <img class="img-fluid" src="logo.jpg" alt="logo" style="width: 80px;">
                                <p class="centered-text text-center"><b>CARTE DE MEMBRE DE L'ANOPER<br> (Association Nationale des Organisations Professionnelles<br> d’Eleveurs de Ruminants)</b></p>
                                <style>
                                    .centered-text {
                                        max-width: 80%;
                                        /* ou la valeur que vous préférez */
                                        margin: auto;
                                    }
                                </style>
                                <img class="img-fluid" src="flag.png" alt="flag" style="width: 80px;">
                            </div>
                            <hr>
                            <div class="row mt-1">
                                <small class=""><em><strong>Informations générales</strong></em></small>

                                <div class="col-5">
                                    <small>Nom : <strong><?= $datas['nom']; ?></strong></small><br>
                                    <small>Prénom : <strong><?= $datas['prenom']; ?></strong></small><br>
                                    <small><em><strong>Adresses et contact</strong></em></small><br>
                                    <small>Département : <strong><?= $datas['nom_departement']; ?></strong></small><br>
                                    <small>Udoper : <strong><?= $datas['nom_udoper']; ?></strong></small><br>
                                    <small>Commune : <strong><?= $datas['nom_commune']; ?></strong></small><br>
                                    <small><em><strong>Informations complémentaires</strong></em></small><br>
                                    <small>Ovins : <strong><?= $datas['ovins']; ?></strong></small> | <small>Bovins : <strong><?= $datas['bovins']; ?></strong></small> | <small>Caprins : <strong><?= $datas['caprins']; ?></strong></small><br>

                                </div>
                                <div class="col-5">
                                    <small>Sexe : <strong><?= $datas['sexe']; ?></strong></small><br>
                                    <small>Né(e) le : <strong><?= formatDateFrench($datas['dateNaissance']); ?> </strong></small>
                                    <small>à : <strong><?= $datas['lieuNaissance']; ?></strong></small><br><br>
                                    <small>Arrondissement : <strong><?= $datas['nom_arrondissement']; ?></strong></small><br>
                                    <small>Village : <strong><?= $datas['village']; ?></strong></small><br>
                                    <small>Téléphone : <strong><?= $datas['tel']; ?></strong></small><br>

                                </div>
                                <?php

                                // Chemin enregistré dans la BDD
                                $photoPathFromDb = $datas['photoMembre'];
                                $signaturePathFromDb = $datas['signatureScan'];
                                $qrPathFromDb = $datas['qrCodePath'];

                                // Votre chemin réel sur le serveur
                                $realPhotoPath = '../datas/files/photo_membre/';
                                $realSignaturePath = '../datas/files/signature_scan/';
                                $realQrPath = '../datas/files/qrcode/';

                                // Obtenez seulement le nom du fichier depuis le chemin de la BDD
                                $photofilename = basename($photoPathFromDb);
                                $signaturefilename = basename($signaturePathFromDb);
                                $qrfilename = basename($qrPathFromDb);

                                // Concaténez les chemins pour obtenir le chemin complet
                                $fullPhotoPath = $realPhotoPath . $photofilename;
                                $fullSignaturePath = $realSignaturePath . $signaturefilename;
                                $fullQrPath = $realQrPath . $qrfilename;

                                ?>
                                <div class="col-2">
                                    <img class="float-end mb-2" src="<?= $fullPhotoPath; ?>" alt="Photo Identité" style="width: 25mm; height: 35mm; object-fit: cover; border-radius: 5%; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">

                                    <img class="float-end" src="<?= $fullSignaturePath; ?>" alt="Signature" style="width: 25mm; height: 10mm; object-fit: cover;">

                                </div>
                            </div>
                            <hr style="margin-top: 2px;">
                            <div class="row mb-5">
                                <div class="col-8">
                                    <small>Immatriculation n° <span class="text-danger"><?= $datas['numeroCarteMembre']; ?></span></small>
                                </div>
                                <div class="col-4" style="margin-top: -10px;">
                                    <img src="<?= $fullQrPath; ?>" alt="" class="img-fluid img-thumbnail float-end" style="width: 20%;">
                                </div>
                            </div>
                           
                        </div>
                        <!-- Fin du contenu de la carte -->
                    </div>
                </div>
            </div>
            <div class="text-center mt-3">
                <a class="btn btn-success btn-block" id="download">Télécharger</a> <br>
            </div>
        </div>
    </div>

    <script>
        const downloadBtn = document.querySelector("#download");

        downloadBtn.addEventListener("click", function() {
            // Récupération de la carte
            const card = document.querySelector("#idcard");

            // Sauvegarde du style actuel
            const originalShadow = card.style.boxShadow;

            // Suppression temporaire du box-shadow
            card.style.boxShadow = 'none';

            html2canvas(card).then(canvas => {
                const url = canvas.toDataURL('image/png');
                const a = document.createElement('a');
                a.setAttribute('download', 'CarteMembre.png');
                a.setAttribute('href', url);
                a.click();

                // Restauration du style original
                card.style.boxShadow = originalShadow;
            });
        });
    </script>

</body>

</html>