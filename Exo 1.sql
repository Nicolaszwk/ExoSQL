1) Soit le schéma relationnel suivant :
REPRESENTATION (ID_REPRESENTATION, TITRE_REPRESENTATION, LIEU)
MUSICIEN (NOM, #REPRESENTATION_ID)
PROGRAMMER (ID_PROGRAMMER, DATE, TARIF, #REPRESENTATION_ID)
Affichez les résultats suivants avec une solution SQL :
a) Donner la liste des titres des représentations
b) Donner la liste des titres des représentations ayant lieu à l'opéra Bastille
c) Donner la liste des noms des musiciens et des titres des représentations auxquelles ils participent
d) Donner la liste des titres des représentations, les lieux et les tarifs pour la journée du 14/09/2014




//Donner la liste des noms des musiciens et des titres des représentations auxquelles ils participent
SELECT m.nom, r.titre_representation
FROM musicien m
INNER JOIN representation r ON m.representation_id = r.id_representation

// INNER JOIN table2 ON clé secondaire du tableau 1 = clé primaire du tableau 2


//Donner la liste des titres des représentations, les lieux et les tarifs pour la journée du 14/09/2014
SELECT r.titre_representation, r.lieu,p.tarif
FROM programmer p
INNER JOIN representation r ON p.representation_id = r.id_representation
WHERE date_Representation = "2023-07-20 14:51:31"
