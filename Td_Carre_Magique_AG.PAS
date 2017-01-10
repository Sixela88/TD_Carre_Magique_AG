{Algorithme Carre magique
//BUT : Afficher un carre magique soit de 5 sur 5, soit de 7 sur 7. Le 1 se trouve au nord du milieu. Les nombres suivants sont
inscrits dans l'ordre croissant au nord-est de la position (x+1 et y-1).Si la place est déjà prise, on se déplace vers le 
nord-ouest jusqu'à une position libre.Tableau considéré comme sphérique cad que s'il on arrive au delà de la dernière colonne, 
on revient à la dernière colonne, de même pour les lignes.
//ENTREES : Tableau 
//SORTIES : Carré magique => Tableau avec les chiffres jusqu'à la taille defini et suivant es déplacements consignés.

CONST
	TAILLEMAX:ENTIER<-5

TYPE Tab2D=Tableau[1..TAILLEMAX,1..TAILLEMAX] de ENTIER

procedure Initialisation(Var InitTab:Tab2D;Var xs,ys:ENTIER;Var cptmax:ENTIER)
	//BUT : Initialiser le tableau avec des valeurs à 0 sauf pour la position du 1
	//ENTREES : Tableau
	//SORTIES : Compteur et valeurs dans le tableau

VAR x,y:ENTIER

DEBUT
	POUR x DE 1 A TAILLEMAX FAIRE 
		DEBUT
			POUR y DE 1 A TAILLEMAX FAIRE
				DEBUT
					SI (x=round((TAILLEMAX-1) DIV 2)) ET (y=round((TAILLEMAX+1) DIV 2)) ALORS
						DEBUT
							InitTab[x,y]<-1
							xs<-x
							ys<-y
						FINSI
					SINON
						DEBUT
							InitTab[x,y]<-0
						FIN
				FINPOUR
			
		FINPOUR
	cptmax<-(TAILLEMAX*TAILLEMAX)
FIN

procedure DplctD(Var xs,ys:ENTIER)
	//BUT : Procédure pour déplacer la position vers la nord-est
	//ENTREES : positions
	//SORTIES : positions

DEBUT
	xs<-xs-1
	ys<-ys+1
FIN

procedure verifdroite(Var xs,ys:ENTIER)
	//BUT : Verification de sortie du tableau lors du déplacement vers le nord-est
	//ENTREES : positions
	//SORTIES : positions

DEBUT

	SI (xs < 1) ALORS
		DEBUT
			xs<-TAILLEMAX
		FINSI
	SI (ys > TAILLEMAX) ALORS
		DEBUT
			ys<-1
		FINSI
FIN

procedure DplctG(Var xs,ys:ENTIER)
	//BUT : Procédure pour se déplacer vers le nord-ouest
	//ENTREES : positions
	//SORTIES : positions

DEBUT
	xs<-xs-1
	ys<-ys-1
FIN

procedure verifgauche(Var xs,ys:ENTIER)
	//BUT : //Verification de sortie du tableau lors du déplacement vers le nord-ouest
	//ENTREES : positions
	//SORTIES : positions

DEBUT

	SI (xs < 1) ALORS
		DEBUT
			xs<-TAILLEMAX
		FINSI
	SI (ys < 1) ALORS
		DEBUT
			ys<-TAILLEMAX
		FINSI
FIN

procedure recherchevide(Var tab:Tab2D;Var xs,ys:ENTIER)
	//BUT : Recherche position dont la valeur est différente de 0 pour pouvoir placer une valeur 
	//ENTREES : Tableau
	//SORTIES : position vide

DEBUT
	TANT QUE (tab[xs][ys] <> 0) FAIRE
		DEBUT
			DplctG(xs,ys)
			verifgauche(xs,ys)
		FIN
FIN

procedure placement(Var tab2:Tab2D;Var xs,ys:ENTIER;Var i2:ENTIER)
	//BUT : Procedure de placement à la position après vérification par les procédures précédentes
	//ENTREES : positions 
	//SORTIES : Attribution d'une valeur sur une position libre

DEBUT
	tab2[xs,ys]<-i2
FIN

procedure Affichage(Var TabAff:Tab2D)	
	//BUT : Procedure d'affichage du Carre magique remplit avec les valeurs 
	//ENTREES : Tableau et positions
	//SORTIES : Tableau (TabAff) avec les différentes valeurs

VAR
	x,y:ENTIER

DEBUT
	POUR x<-1 TO TAILLEMAX FAIRE //Lignes
		DEBUT
			POUR y<-1 TO TAILLEMAX FAIRE //Colonnes
				DEBUT
					SI (TabAff[x,y]<10) ALORS
						DEBUT	
							ECRIRE("0"&TabAff[x,y]&" ")
						FINSI
					SINON
						DEBUT
							ECRIRE(TabAff[x,y]&" ")
						FINSI
				FINPOUR
			ECRIRE("")
		FINPOUR
	LIRE
FIN



//PROGRAMME PRINCIPAL :

VAR
	Matrice1:Tableau[1..TAILLEMAX,1..TAILLEMAX] de ENTIER
	x,y,xs1,ys1:ENTIER
	i,cptmax1:ENTIER
	cpt:ENTIER

DEBUT
	ECRIRE("Carre Magique")
	Initialisation(Matrice1,xs1,ys1,cptmax1)
	i<-2
	TANT QUE (i<>cptmax1) FAIRE
		DEBUT
			cpt<-i
			DplctD(xs1,ys1)
			verifdroite(xs1,ys1)
			recherchevide(Matrice1,xs1,ys1)
			placement(Matrice1,xs1,ys1,cpt)
			i<-i+1
		FIN
	Affichage(Matrice1)
FIN}

Program Carre_magique;

uses crt,math;

CONST
	TAILLEMAX=5;

TYPE
	Tab2D=array[1..TAILLEMAX,1..TAILLEMAX] of integer;

//Initialisation du tableau avec le 1
procedure Initialisation(Var InitTab:Tab2D;Var xs,ys:integer;Var cptmax:integer);

VAR x,y:integer;

BEGIN
	FOR x:=1 TO TAILLEMAX DO //Lignes
		BEGIN
			FOR y:=1 TO TAILLEMAX DO //Colonnes
				BEGIN
					IF (x=round((TAILLEMAX-1) DIV 2)) AND (y=round((TAILLEMAX+1) DIV 2)) THEN
						BEGIN
							InitTab[x,y]:=1;
							xs:=x;
							ys:=y;
						END
					ELSE
						BEGIN
							InitTab[x,y]:=0;
						END;
				END;
			
		END;
	cptmax:=(TAILLEMAX*TAILLEMAX);
END;


//Procédure pour se déplacer vers la droite
procedure DplctD(Var xs,ys:integer);

BEGIN
			xs:=xs-1;
			ys:=ys+1;
END;

//Verification de sortie du tableau lors du déplacement vers la droite
procedure verifdroite(Var xs,ys:integer);

BEGIN

	IF (xs < 1) THEN
		BEGIN
			xs:=TAILLEMAX;
		END;
	IF (ys > TAILLEMAX) THEN
		BEGIN
			ys:=1;
		END;
END;


//Procédure pour se déplacer vers la gauche
procedure DplctG(Var xs,ys:integer);

BEGIN
			xs:=xs-1;
			ys:=ys-1;
END;

//Verification de sortie du tableau lors du déplacement vers la gauche
procedure verifgauche(Var xs,ys:integer);

BEGIN

	IF (xs < 1) THEN
		BEGIN
			xs:=TAILLEMAX;
		END;
	IF (ys < 1) THEN
		BEGIN
			ys:=TAILLEMAX;
		END;
END;

//Recherche vide
procedure recherchevide(Var tab:Tab2D;Var xs,ys:integer);

BEGIN
	WHILE (tab[xs][ys] <> 0) DO
		BEGIN
		// Deplacement différent si case non libre
		DplctG(xs,ys);
		// Verification de sortie du tableau lors du déplacement vers la gauche
		verifgauche(xs,ys);
		END;
END;

//Procedure de placement 
procedure placement(Var tab2:Tab2D;Var xs,ys:integer;Var i2:integer);

BEGIN
	tab2[xs,ys]:=i2;
END;

//Procedure d'affichage
procedure Affichage(Var TabAff:Tab2D);

VAR
	x,y:integer;

BEGIN
	FOR x:=1 TO TAILLEMAX DO //Lignes
		BEGIN
			FOR y:=1 TO TAILLEMAX DO //Colonnes
				BEGIN
					IF (TabAff[x,y]<10) THEN
						BEGIN	
							write('0',TabAff[x,y],' '); //
						END
					ELSE
						BEGIN
							write(TabAff[x,y],' ');
						END;
				END;
			writeln;
		END;

	readln;
END;



//PROGRAMME PRINCIPAL :

VAR
	Matrice1:array[1..TAILLEMAX,1..TAILLEMAX] of integer;
	x,y,xs1,ys1:integer;
	i,cptmax1:integer;
	cpt:integer;

BEGIN
	clrscr;
	writeln('Carre Magique');
	//Initialisation du tableau a 0 et placement du 1
	Initialisation(Matrice1,xs1,ys1,cptmax1);
	//Avancer dans le carre magique
	i:=2;
	WHILE (i<>cptmax1) DO
		BEGIN
			cpt:=i;
			//Déplacement de base
			DplctD(xs1,ys1);
			//Vérification de sortie du tableau lors du déplacement de base
			verifdroite(xs1,ys1);
			//Recherche vide, deplacement vers la gauche et verif sortie du tableau
			recherchevide(Matrice1,xs1,ys1);
			//Attribution de la valeur à la position libre
			placement(Matrice1,xs1,ys1,cpt);
			i:=i+1
		END;

	//Affichage
	Affichage(Matrice1);

END.
