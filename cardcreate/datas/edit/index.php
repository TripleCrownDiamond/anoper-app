<div class="col-md-12">
    <h6>Informations générales</h6>
    <div class="card">
        <ul class="list-group list-group-flush">
            <?php if (isset($member[0]['dateAdhesion'])) : ?>
                <li class="list-group-item">Date d'adhésion : <strong><?= formatDateFrench($member[0]['dateAdhesion']); ?></strong> </li>
            <?php else : ?>
                <li class="list-group-item">Date d'adhésion : <strong>N/A</strong></li>
            <?php endif; ?>
            <form id="editDateAdhesionForm" action="" method="post" class="row row-cols-lg-auto g-3 align-items-center">
                <div class="container col-12">
                    <label class="mt-4" for="dateAdhesion">Modifier la date d'adhésion</label>
                    <div class="input-group">
                        <input type="date" name="dateAdhesion" id="dateAdhesion" class="form-control">
                        <input type="hidden" name="memberId" value="<?= $member[0]['idMembers']; ?>">
                    </div>
                </div>
                <div class="container mt-2 mb-2 col-12">
                    <button type="submit" class="btn btn-primary">Modifier</button>
                </div>
            </form>
        </ul>
    </div>
</div>
<br>
<div class="col-md-12">
    <h6>Département / Commune / Arrondissement</h6>
    <div class="card">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Département : <strong><?= $member[0]['nom_departement']; ?></strong></li>
            <li class="list-group-item">Commune : <strong><?= $member[0]['nom_commune']; ?></strong></li>
            <li class="list-group-item mb-4">Arrondissement : <strong><?= $member[0]['nom_arrondissement']; ?></strong></li>
            <form id="editDepCommArr" action="" method="post" class="row row-cols-lg-auto g-3 align-items-center">
                <div class="container col-12">
                    <div class="mb-3">
                        <label for="departement" class="form-label">Modifier Département:</label>
                        <select id="departement" name="departement" class="form-control">
                            <option value="">Sélectionner un département</option>
                        </select>
                        <div class="invalid-feedback d-none">Veuillez sélectionner un département.</div>
                    </div>

                    <div class="mb-3">
                        <label for="commune" class="form-label">Modifier Commune:</label>
                        <select id="commune" name="commune" class="form-control">
                            <option value="">Sélectionner un département d'abord</option>
                        </select>
                        <div class="invalid-feedback d-none">Veuillez sélectionner une commune.</div>
                    </div>

                    <div class="mb-3">
                        <label for="arrondissement" class="form-label">Modifier Arrondissement:</label>
                        <select id="arrondissement" name="arrondissement" class="form-control">
                            <option value="">Sélectionner un arrondissement</option>
                            <!-- Les options d'arrondissement seront chargées ici via AJAX en fonction de la commune choisie -->
                        </select>
                        <div class="invalid-feedback d-none">Veuillez sélectionner un arrondissement.</div>
                    </div>
                </div>
                <div class="container mt-2 mb-2 col-12">
                    <button type="submit" class="btn btn-primary">Modifier</button>
                </div>
            </form>
        </ul>
    </div>
</div>