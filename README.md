# Exploration cinématographique
&#x1F3A5; Bienvenue dans le projet d'exploration cinématographique ! &#x1F3A5; 

Une étude basée sur la visualisation de données &#128200; pour découvrir le dessous des films à succès &#11088;

L'équipe &#x1F680;
* Eloïse LAPLANCHE
* Laure PENG
* Gaudeline Maeva SIMO KAMWA
* Belvine YEMDJO YOUMBI

## Données

Nous avons choisi d’étudier un dataset regroupant des données sur les films à succès. Ce jeu de données a été trouvé sur Kaggle et a été modifié par nos soins pour garder uniquement  les features qui nous importent dans cette étude.
Le choix de travailler sur des données liées au monde du cinéma résulte de l’envie de la part des membres de notre équipe de découvrir plus en détail cet univers. Toutes les quatre amatrices de films, ce jeu de données sera pour nous l’occasion de travailler sur un sujet qui nous intéresse et qui nous intrigue. 

* Nombre d’observations : 4803
* Nombre de variables : 17
* Source : https://www.kaggle.com/datasets/harshshinde8/movies-csv

Détail des données : 
| Variable                | Type     | Description                                |
|-------------------------|----------|--------------------------------------------|
| budget                  | `Int`    | Budget global pour réaliser le film        |
| genres                  | `String` | Genres associés au film                    |
| keywords                | `String` | Mots-clés représentant le film             |
| overview                | `String` | Synopsis du film                           |
| popularity              | `Float`  | Popularité du film (entre 0 et 876)        |
| production_companies    | `String` | Liste des sociétés de productions          |
| production_countries    | `String` | Liste des pays de production               |
| release_date            | `Date`   | Date de sortie du film                     |
| revenue                 | `Int`    | Revenus générés par le film                |
| runtime                 | `Float`  | Durée du film (en minutes)                 |
| spoken_languages        | `String` | Liste des langues parlées dans le film     |
| tagline                 | `String` | “Slogan” du film                           |
| title                   | `String` | Titre du film                              |
| vote_average            | `Float`  | Moyenne de la note attribuée (entre 0 et 10)|
| vote_count              | `Int`    | Décompte du nombre de votes (entre 0 et 13752)|
| cast                    | `String` | Liste des noms des acteurs du film         |
| director                | `String` | Nom du réalisateur du film                 |

On peut relever dans ce dataset plusieurs grands groupes de données : 
* Les données de **description du film** (*genres, keywords, overview, tagline, title*)
* Les données concernant la **réalisation du film** (*director, cast, spoken_languages, runtime, release_date, production_countries, production_companies, budget*)
* Les données sur les **retombées du film** (*popularity, revenue, vote_average, vote_count*)


## Plan d'analyse
Ce dataset étant assez riche, nous pouvons élaborer un plan d’analyse selon plusieurs grands axes d’étude :

### Analyse du succès des films
Dans cette partie, on s’interrogera sur les facteurs qui pourraient ressortir lorsqu’un film a du succès. Pour cela, on peut se baser sur nos indicateurs de popularité et de note moyenne et les comparer avec d’autres features comme le genre du film, le réalisateur ou le budget. Dans cette partie, il faudra veiller à bien mettre en regard la note du film avec le nombre de votants, afin de ne pas avoir d'analyse biaisée par un nombre de votants trop faible sur un film par exemple.

***Attentes :*** On peut supposer que plus le réalisateur est connu ou que plus le budget est important, et plus le film sera populaire et obtiendra une bonne note. Nous pensons également que les films d'actions seront sans doute les films avec le plus de succès.

***Exemples de questions :***

**Succès du film :** 
* Quels sont les réalisateurs les plus populaires en fonction du genre (ou en fonction du nombre de films réalisés) ?
* Quel genre de film génère le plus de revenus ?
* Est-ce qu’il y a un lien entre le genre et la popularité ?
* Est-ce qu'il y a un lien entre les acteurs et la popularité ou la note du film ?
  
**Appréciation du film :**
* Est-ce qu’il y a un lien entre le budget et la note ?
* Est-ce qu'il y a un lien entre la réalisation de plusieurs films du même genre et la note du film ?
* Est ce que la langue originale du film a une influence ?
* Y-a-t-il un lien entre popularité et note du film ?

###  Analyse des tendances temporelles
Nous pourrons ici analyser plusieurs features en regard des dates de sortie du film. On pourra ou non constater des évolutions de genre, de réalisateurs ou encore de sociétés de production en fonction du temps afin de voir si de nouveaux schémas se dessinent. Nos données vont de 1916 à 2017, mais nous possédons un nombre de films supérieur à 100 qu'à partir de 1993, il faudra donc faire attention lors de l'analyse.

***Attentes :*** On peut supposer que les grosses sociétés de production perdurent au fil du temps et qu'au contraire, les petites sociétés laissent place à d'autres. On pourra aussi vérifier s'il existe des pays "à la mode" sur certaines années. On s'attend également à une évolution du budget des sociétés dans le temps.

***Exemples de questions :***
* Quels sont les pays qui ont réalisé le plus de films en fonction des années ?
* Est-ce qu’il y a une évolution de la popularité des films dans le temps ?
* Est-ce que l'année de réalisation impacte sur le genre du film ?
* Est-ce que le budget a évolué au fil des années ?
* Est-ce qu’il y a une évolution de la durée des films dans le temps ?
* Est-ce que les maisons de production ont varié le genre de leurs films au fil du temps ?

### Analyse des mots employés pour décrire le film
Ici, on pourrait analyser les features telles que le slogan, le titre, le synopsis et les mots-clés pour trouver des liens et faire ressortir des patterns. On pourra aussi évaluer si le choix de ces mots a une influence sur l'appréciation ou la note du film. Le traitement de données textuelles peut être certaines fois délicat, il faudra donc veiller à ce que les techniques de traitement soient appropriées et les biais identifiés.

***Attentes :*** On pense trouver des mots-clés qui ressortent selon le genre du film. On peut aussi imaginer que selon la compagnie de production ou le réalisateur, des mots-clés peuvent être repris dans les films qu'ils produisent, comme une marque de fabrique.

***Exemples de questions :***
* Est-ce qu’il y a des mots que l’on retrouve le plus dans le titre selon le genre du film ?
* Quels sont les mots-clés les plus fréquents en fonction du genre ?
* Est-ce que certains mots-clés ressortent dans les films de telle ou telle compagnie de production ou pour tel réalisateur ? Cela a-t-il un lien avec le pays de production ?
* Est-ce que les mots-clés utilisés ont une influence sur l'appréciation ou la note du film ?


