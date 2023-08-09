<?php
// Fonction pour récupérer tous les membres avec les valeurs des clés étrangères
function getAllMembers()
{
    $DB = new connexionDB();

    $sql = "SELECT m.*, 
                   d.name AS nom_departement, 
                   c.name AS nom_commune, 
                   a.name AS nom_arrondissement, 
                   u.name AS nom_udoper, 
                   t.type AS nom_type_piece 
            FROM members m
            LEFT JOIN departements d ON m.idDepartement = d.idDepartements
            LEFT JOIN communes c ON m.idCommune = c.idCommunes
            LEFT JOIN arrondissements a ON m.idArrondissement = a.idArrondissements
            LEFT JOIN udopers u ON m.idUdoper = u.idUdopers
            LEFT JOIN type_piece_identite t ON m.idTypePieceIdentite = t.id";

    $stmt = $DB->query($sql);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $result;
}

// Fonction pour récupérer les membres enregistrés par l'utilisateur au cours des dernières 72 heures avec les valeurs des clés étrangères
function getMembersByUser72($userId)
{
    $DB = new connexionDB();

    $sql = "SELECT m.*, 
                   d.name AS nom_departement, 
                   c.name AS nom_commune, 
                   a.name AS nom_arrondissement, 
                   u.name AS nom_udoper, 
                   t.type AS nom_type_piece 
            FROM members m
            LEFT JOIN departements d ON m.idDepartement = d.idDepartements
            LEFT JOIN communes c ON m.idCommune = c.idCommunes
            LEFT JOIN arrondissements a ON m.idArrondissement = a.idArrondissements
            LEFT JOIN udopers u ON m.idUdoper = u.idUdopers
            LEFT JOIN type_piece_identite t ON m.idTypePieceIdentite = t.id
            WHERE m.user_id = :userId AND m.date_time >= NOW() - INTERVAL 72 HOUR";

    $stmt = $DB->query($sql, array('userId' => $userId));
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $result;
}

function isAdmin($userId)
{
    $DB = new connexionDB();

    $sql = "SELECT * FROM users WHERE id = :userId AND admin = 1";
    $stmt = $DB->query($sql, array('userId' => $userId));
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($result) == 0) {
        return false;
    } else {
        return true;
    }
}

$userId = $_SESSION['user_id'];

// Vérifier si l'utilisateur est admin
$isAdmin = isAdmin($userId);


// Récupérer les membres correspondants à l'utilisateur
$members = [];
if ($isAdmin) {
    // Si l'utilisateur est admin, récupérer tous les membres
    $members = getAllMembers();
} else {
    // Si l'utilisateur n'est pas admin, récupérer les membres enregistrés par l'utilisateur dans les 72 dernières heures
    $members = getMembersByUser72($userId);
}

function formatDateFrench($dateStr)
{
    // Convertir la date en objet DateTime
    $dateObj = new DateTime($dateStr);

    // Formater la date au format français avec l'heure (jj/mm/aaaa à HH:mm:ss)
    return $dateObj->format('d/m/Y');
}

function formatDateFrenchWithTime($dateStr)
{
    // Convertir la date en objet DateTime
    $dateObj = new DateTime($dateStr);

    // Formater la date au format français avec l'heure (jj/mm/aaaa à HH:mm:ss)
    return $dateObj->format('d/m/Y à H:i:s');
}

function removeLeadingDots($filePath)
{
    // Utilisation de preg_replace pour supprimer les deux points au début de la chaîne
    $fixedPath = preg_replace('/^\.\.\//', '', $filePath);
    return $fixedPath;
}

// ... Vos fonctions existantes ...

// Fonction pour récupérer les membres sous forme de tableau associatif avec les clés correspondant aux en-têtes de colonnes
function getMembersForDataTable()
{
    $members = getAllMembers(); // Vous pouvez remplacer cette fonction par toute autre méthode de récupération de données

    $data = array();
    foreach ($members as $member) {
        $rowData = array(
            "Date d'adhésion" => formatDateFrench($member["dateAdhesion"]),
            "Département" => $member["nom_departement"],
            "Commune" => $member["nom_commune"],
            "Arrondissement" => $member["nom_arrondissement"],
            "UDOPER" => $member["nom_udoper"],
            "Village" => $member["village"],
            "Nom" => $member["nom"],
            "Prénom" => $member["prenom"],
            "Date de naissance" => formatDateFrench($member["dateNaissance"]),
            "Lieu de naissance" => $member["lieuNaissance"],
            "Sexe" => $member["sexe"],
            "Téléphone" => $member["tel"],
            "Type de pièce d'identité" => $member["nom_type_piece"],
            "Numéro de pièce" => $member["numeroPiece"],
            "Photo de la pièce d'identité" => "<a href='./datas/" . removeLeadingDots($member["photoPieceIdentite"]) . "' target='_blank'>Photo Pièce Identité</a>",
            "Date d'expiration de la pièce d'identité" => formatDateFrench($member["dateExpirationPieceIdentite"]),
            "Nombre d'ovins" => $member["ovins"],
            "Nombre de bovins" => $member["bovins"],
            "Nombre de caprins" => $member["caprins"],
            "Photo du membre" => "<a href='./datas/" . removeLeadingDots($member["photoMembre"]) . "' target='_blank'>Photo Membre</a>",
            "Scan de la signature" => "<a href='./datas/" . removeLeadingDots($member["signatureScan"]) . "' target='_blank'>Signature</a>",
            "QR Code" => "<a href='./datas/" . removeLeadingDots($member["qrCodePath"]) . "' target='_blank'>QR Code</a>",
            "Numéro de carte membre" => $member["numeroCarteMembre"],
            "Date et heure" => "Enregistré le " . formatDateFrenchWithTime($member["date_time"]),
            "Actions" => "<button class='btn btn-sm btn-danger btn-circle' onclick='deleteMember(" . $member["idMembers"] . ")'><i class='fas fa-trash'></i></button><button class='btn btn-sm btn-success btn-circle' onclick='editMember(" . $member["idMembers"] . ")'><i class='fas fa-edit'></i></button>"
        );

        $data[] = $rowData;
    }

    return $data;
}

// Vérifier si la DataTable effectue une requête AJAX pour charger les données
if (isset($_GET['ajax'])) {
    $membersData = getMembersForDataTable();
    echo json_encode(array("data" => $membersData));
    exit;
}

?>

<!-- DataTales Example -->
<!-- <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Liste des membres</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date d'adhésion</th>
                        <th>Département</th>
                        <th>Commune</th>
                        <th>Arrondissement</th>
                        <th>UDOPER</th>
                        <th>Village</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Date de naissance</th>
                        <th>Lieu de naissance</th>
                        <th>Sexe</th>
                        <th>Téléphone</th>
                        <th>Type de pièce d'identité</th>
                        <th>Numéro de pièce</th>
                        <th>Photo de la pièce d'identité</th>
                        <th>Date d'expiration de la pièce d'identité</th>
                        <th>Nombre d'ovins</th>
                        <th>Nombre de bovins</th>
                        <th>Nombre de caprins</th>
                        <th>Photo du membre</th>
                        <th>Scan de la signature</th>
                        <th>QR Code</th>
                        <th>Numéro de carte membre</th>
                        <th>Date et heure</th>      
                        <th>Actions</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Date d'adhésion</th>
                        <th>Département</th>
                        <th>Commune</th>
                        <th>Arrondissement</th>
                        <th>UDOPER</th>
                        <th>Village</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Date de naissance</th>
                        <th>Lieu de naissance</th>
                        <th>Sexe</th>
                        <th>Téléphone</th>
                        <th>Type de pièce d'identité</th>
                        <th>Numéro de pièce</th>
                        <th>Photo de la pièce d'identité</th>
                        <th>Date d'expiration de la pièce d'identité</th>
                        <th>Nombre d'ovins</th>
                        <th>Nombre de bovins</th>
                        <th>Nombre de caprins</th>
                        <th>Photo du membre</th>
                        <th>Scan de la signature</th>
                        <th>QR Code</th>
                        <th>Numéro de carte membre</th>
                        <th>Date et heure</th>
                        <?php if ($isAdmin) : ?>
                            <th>Actions</th>
                        <?php endif; ?>
                    </tr>
                </tfoot>
                <tbody>
                    <?php foreach ($members as $member) : ?>
                        <tr>
                            <td><?= $member["idMembers"]; ?></td>
                            <td><?= $member["dateAdhesion"]; ?></td>
                            <td><?= $member["nom_departement"]; ?></td>
                            <td><?= $member["nom_commune"]; ?></td>
                            <td><?= $member["nom_arrondissement"]; ?></td>
                            <td><?= $member["nom_udoper"]; ?></td>
                            <td><?= $member["village"]; ?></td>
                            <td><?= $member["nom"]; ?></td>
                            <td><?= $member["prenom"]; ?></td>
                            <td><?= $member["dateNaissance"]; ?></td>
                            <td><?= $member["lieuNaissance"]; ?></td>
                            <td><?= $member["sexe"]; ?></td>
                            <td><?= $member["tel"]; ?></td>
                            <td><?= $member["nom_type_piece"]; ?></td>
                            <td><?= $member["numeroPiece"]; ?></td>
                            <td>
                                <small><a href="<?= $member["photoPieceIdentite"]; ?>" target="_blank"><?= $member["photoPieceIdentite"]; ?></a></small>
                            </td>
                            <td><?= $member["dateExpirationPieceIdentite"]; ?></td>
                            <td><?= $member["ovins"]; ?></td>
                            <td><?= $member["bovins"]; ?></td>
                            <td><?= $member["caprins"]; ?></td>
                            <td>
                                <small><a href="<?= $member["photoMembre"]; ?>" target="_blank"><?= $member["photoMembre"]; ?></a></small>
                            </td>
                            <td>
                                <small><a href="<?= $member["signatureScan"]; ?>" target="_blank"><?= $member["signatureScan"]; ?></a></small>
                            </td>
                            <td>
                                <small><a href="<?= $member["qrCodePath"]; ?>" target="_blank"><?= $member["qrCodePath"]; ?></a></small>
                            </td>
                            <td><?= $member["numeroCarteMembre"]; ?></td>
                            <td><?= $member["datetime"]; ?></td>
                            <?php if ($isAdmin) : ?>
                                <td>
                                    <a href="<?= $member["photoPieceIdentite"]; ?>" target="_blank" class="btn btn-primary btn-circle">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <button class="btn btn-danger btn-circle" onclick="deleteMember(<?= $member["idMembers"]; ?>)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                    <button class="btn btn-success btn-circle" onclick="editMember(<?= $member["idMembers"]; ?>)">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </td>
                            <?php endif; ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div> -->

<table id="example" class="table table-striped display compact nowrap hover cell-border" style="width:100%">
    <thead>
        <tr>
            <th>Date d'adhésion</th>
            <th>Département</th>
            <th>Commune</th>
            <th>Arrondissement</th>
            <th>UDOPER</th>
            <th>Village</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de naissance</th>
            <th>Lieu de naissance</th>
            <th>Sexe</th>
            <th>Téléphone</th>
            <th>Type de pièce d'identité</th>
            <th>Numéro de pièce</th>
            <th>Photo de la pièce d'identité</th>
            <th>Date d'expiration de la pièce d'identité</th>
            <th>Nombre d'ovins</th>
            <th>Nombre de bovins</th>
            <th>Nombre de caprins</th>
            <th>Photo du membre</th>
            <th>Scan de la signature</th>
            <th>QR Code</th>
            <th>Numéro de carte membre</th>
            <th>Date et heure</th>
            <th>Actions</th>

        </tr>
    </thead>
    <tbody>
        <?php foreach ($members as $member) : ?>
            <tr>
                <td><?= formatDateFrench($member["dateAdhesion"]); ?></td>
                <td><?= $member["nom_departement"]; ?></td>
                <td><?= $member["nom_commune"]; ?></td>
                <td><?= $member["nom_arrondissement"]; ?></td>
                <td><?= $member["nom_udoper"]; ?></td>
                <td><?= $member["village"]; ?></td>
                <td><?= $member["nom"]; ?></td>
                <td><?= $member["prenom"]; ?></td>
                <td><?= formatDateFrench($member["dateNaissance"]); ?></td>
                <td><?= $member["lieuNaissance"]; ?></td>
                <td><?= $member["sexe"]; ?></td>
                <td><?= $member["tel"]; ?></td>
                <td><?= $member["nom_type_piece"]; ?></td>
                <td><?= $member["numeroPiece"]; ?></td>
                <td>
                    <small><a href="./datas/<?= removeLeadingDots($member["photoPieceIdentite"]); ?>" target="_blank">Photo Pièce Identité</a></small>
                </td>
                <td><?= formatDateFrench($member["dateExpirationPieceIdentite"]); ?></td>
                <td><?= $member["ovins"]; ?></td>
                <td><?= $member["bovins"]; ?></td>
                <td><?= $member["caprins"]; ?></td>
                <td>
                    <small><a href="./datas/<?= removeLeadingDots($member["photoMembre"]); ?>" target="_blank">Photo Membre</a></small>
                </td>
                <td>
                    <small><a href="./datas/<?= removeLeadingDots($member["signatureScan"]); ?>" target="_blank">Signature</a></small>
                </td>
                <td>
                    <small><a href="./datas/<?= removeLeadingDots($member["qrCodePath"]); ?>" target="_blank">QR Code</a></small>
                </td>
                <td><?= $member["numeroCarteMembre"]; ?></td>
                <td>Enregistré le <?= formatDateFrenchWithTime($member["date_time"]); ?></td>

                <td>
                    <small>
                        <button class="btn btn-sm btn-danger btn-circle" onclick="deleteMember(<?= $member["idMembers"]; ?>)">
                            <i class="fas fa-trash"></i>
                        </button>
                        <a class="btn btn-sm btn-success btn-circle" href="edit?id=<?= $member["idMembers"]; ?>" >
                            <i class="fas fa-edit"></i>
                        </a>
                    </small>
                </td>

            </tr>
        <?php endforeach; ?>
    </tbody>
    <tfoot>
        <tr>
            <th>Date d'adhésion</th>
            <th>Département</th>
            <th>Commune</th>
            <th>Arrondissement</th>
            <th>UDOPER</th>
            <th>Village</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de naissance</th>
            <th>Lieu de naissance</th>
            <th>Sexe</th>
            <th>Téléphone</th>
            <th>Type de pièce d'identité</th>
            <th>Numéro de pièce</th>
            <th>Photo de la pièce d'identité</th>
            <th>Date d'expiration de la pièce d'identité</th>
            <th>Nombre d'ovins</th>
            <th>Nombre de bovins</th>
            <th>Nombre de caprins</th>
            <th>Photo du membre</th>
            <th>Scan de la signature</th>
            <th>QR Code</th>
            <th>Numéro de carte membre</th>
            <th>Date et heure</th>
            <th>Actions</th>
        </tr>
    </tfoot>
</table>

