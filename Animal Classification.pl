
/* Level 1: Kingdom */
kingdom(animalia).

/* Level 2: Phylum */
phylum(chordata, animalia).
phylum(arthropoda, animalia).
phylum(mollusca, animalia).

/* Level 3: Class */
class(mammalia, chordata).
class(reptilia, chordata).
class(aves, chordata).
class(amphibia, chordata).
class(actinopterygii, chordata). /* Fish */
class(insecta, arthropoda).

/* Level 4: Order */
order(carnivora, mammalia).
order(primates, mammalia).
order(rodentia, mammalia).
order(squamata, reptilia).
order(anura, amphibia).
order(passiformes, aves). /* Songbirds */
order(perciformes, actinopterygii). /* Largest fish order */

/* Level 5: Family */
family(felidae, carnivora).
family(canidae, carnivora).
family(hominidae, primates).
family(muridae, rodentia).
family(colubridae, squamata). /* Non-venomous snakes */
family(ranidae, anura). /* True frogs */

/* Level 6: Genus */
genus(panthera, felidae).
genus(canis, canidae).
genus(homo, hominidae).
genus(rattus, muridae). /* Rats */
genus(elaphe, colubridae). /* Rat snakes */
genus(rana, ranidae). /* Large true frogs */

/* Level 7: Species */
species(panthera_tigris, panthera). /* Tiger */
species(panthera_leo, panthera). /* Lion */
species(canis_lupus, canis). /* Wolf */
species(canis_familiaris, canis). /* Dog */
species(homo_sapiens, homo). /* Human */
species(rattus_rattus, rattus). /* Black Rat */
species(elaphe_obsoleta, elaphe). /* Rat Snake */
species(rana_temporaria, rana). /* Common Frog */

/* A is parent of B if (A is a direct classification of B) */
parent(A, B):- 
    phylum(B, A);
    class(B, A);
    order(B, A);
    family(B, A);
    genus(B, A);
    species(B, A).

/* A and B are siblings if they share the same parent */
sibling(A, B):- 
    parent(C, A), 
    parent(C, B), 
    A \== B.

/* A is grandparent of B if C is parent of B and A is parent of C */
grandparent(A, B):- 
    parent(C, B), 
    parent(A, C).

greatgrandparent(A, B):- 
    parent(C, B), 
    parent(D, C), 
    parent(A, D).

/* A is an ancestor of B recursively */
ancestor(A, B):- 
    parent(A, B).
ancestor(A, B):- 
    parent(A, C), 
    ancestor(C, B).