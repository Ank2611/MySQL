-- Care este raspunsul corect la prima intrebare ?
select intrebari.descriere_Intrebare as intrebare ,raspunsuri.continut as raspuns_corect
from test.raspunsuri
inner join test.intrebari on raspunsuri.id_intrebari=intrebari.id
where intrebari.nr='1' and raspunsuri.tip_raspuns=1;

-- Afiseaza-mi raspunsurile corecte de la fiecare intrebare 
select intrebari.descriere_Intrebare as intrebare ,raspunsuri.continut as raspuns_corect
from test.raspunsuri
inner join test.intrebari on raspunsuri.id_intrebari=intrebari.id
where raspunsuri.tip_raspuns=1;

-- Modificati tabelul astfel incat sa memorati fiecare punctaj pe care
-- fiecare utilizator l-a luat la fiecare test
-- alter table test.user add column punctaj int;

update test.user u
inner join (select sum(r.tip_raspuns) as punctaj,ur.id_user from test.raspunsuri r
			inner join test.user_raspuns ur on r.id= ur.id_raspuns
            group by ur.id_user) r on r.id_user = u.id
set u.punctaj =r.punctaj;


