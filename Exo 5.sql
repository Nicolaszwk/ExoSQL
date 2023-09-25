USINE (NumU, NomU, VilleU)
PRODUIT (NumP, NomP, Couleur, Poids)
FOURNISSEUR (NumF, NomF, Statut, VilleF)
LIVRAISON (NumP, NumU, NumF, Quantité)
a) Ajouter un nouveau fournisseur avec les attributs de votre choix
b) Supprimer tous les produits de couleur noire et de numéros compris entre 100 et 1999
c) Changer la ville du fournisseur 3 par Mulhouse

//a) Ajouter un nouveau fournisseur avec les attributs de votre choix
INSERT INTO fournisseur (nomF, statut, villeF) VALUES ('Auchan', 'ouvert', 'Nantes')

//b) Supprimer tous les produits de couleur noire et de numéros compris entre 100 et 1999
DELETE FROM produit
WHERE couleur = "noir"
AND 
nump BETWEEN 100 AND 1999

//c) Changer la ville du fournisseur 3 par Mulhouse
UPDATE fournisseur 
SET villeF = "Mulhouse"
WHERE numF = 3
