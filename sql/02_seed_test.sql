-- test insertions
-- Une cliente, Mme Juliette, se présente au magasin le 01/10/2025 pour commander deux bouquets,
--chacun constitué de dix roses et six tulipes. Ces roses sont à livrer le 05/10/2025 à M. Jean qui habite
--au 60 grande rue, 69100 Villeurbanne. Il est joignable au 0789012345. La fleuriste lui précise que
--chaque rose est vendue deux euros et chaque tulipe est vendue un euro cinquante centimes. De plus, les
--frais de livraison pour Villeurbanne se montent à six euros. Mme Juliette paye sa commande le jour
--même, en indiquant qu’elle est joignable au 0607890123, qu’elle habite au 7, rue du général Leclerc à
--Villeurbanne et que son adresse mail est juliette@laposte.net. 

insert into Clients values ('juliette@laposte.net', '0607890123', 'Juliette', '7 rue du général Leclerc', '69100', 'Villeurbanne');
insert into Fleur values ('Rose', 2);
insert into Fleur values ('Tulipe', 1.5);
insert into Livraison values ('69100',  6);
insert into Commande values (1, '01/10/2025', '05/10/2025', '01/10/2025', '05/10/2025', 'Jean', '0789012345', '60 grande rue', 'juliette@laposte.net', '69100', 'Villeurbanne');
insert into Bouquet values (1, 2, 1);
insert into FleurContenue values (1, 'Rose', 10);
insert into FleurContenue values (1, 'Tulipe', 6);

commit;