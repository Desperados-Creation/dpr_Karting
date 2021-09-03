--------------------------------------------------------------------------------------------------
-- Script par Desperados#0001                                                                   -- 
-- Lien du discord pour toute mes créations: https://discord.gg/dkHFBkBBPZ                      --
-- Lien du github pour télécharger le script: https://github.com/Desperados-Creation/dpr_Karting --
--------------------------------------------------------------------------------------------------

Config = {
    blip = true, -- Affichage du blip (true = oui, false = non)

    BlipName = 'Karting', -- Nom du blip
    BlipId = 117, -- Id du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipTaille = 0.7, -- Taille du blip
    BlipCouleur = 17, -- Couleur du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipRange = true, -- Garder le blip sur la map (true = désactiver, false = activé)

    MarkerType = 5, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.8, -- Largeur du marker
    MarkerSizeEpaisseur = 0.8, -- Épaisseur du marker
    MarkerSizeHauteur = 0.8, -- Hauteur du marker
    MarkerDistance = 10.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 179, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 255, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    Kart = {
        {Label = "Kartings pour enfant", Value = "kart20", Price = 500},
        {Label = "Kartings pour adulte", Value = "kart3", Price = 750},
        {Label = "Kartings de compétition", Value = "shifter_kart", Price = 1000},
    },
    
    Text = "Appuyer sur ~o~[E] ~s~pour louer un ~o~Kart ~s~!", -- Text écris lors de l'approche du blip voir: https://discord.gg/dkHFBkBBPZ Channel couleur pour changer la couleur du texte 

    positionKarting = { -- Position du menu astuce sur la map
        LocationKart = {
            vector3(-162.34, -2131.90, 16.7),
        },
        RendreKart = {
            vector3(-152.68, -2140.25, 15.0),
        }
    }
}