# Déverrouillage automatique des volumes LUKS à l'aide d'une puce TPM2


Le chiffrement des données au repos est un élément clé de la sécurité.  LUKS permet de chiffrer les volumes Linux, y compris les volumes de données et le volume racine contenant l'OS. L'OS peut fournir les clés cryptographiques pour les volumes de données, mais quelque chose doit fournir la clé du volume racine pour permettre au système de démarrer.

Le moyen le plus courant de fournir la clé cryptographique pour déverrouiller un volume LUKS est d'avoir un type d'utilisateur dans une phase de passe LUKS pendant le démarrage. Cela fonctionne bien pour les ordinateurs portables et de bureau, mais n'est pas bien adapté pour les serveurs ou les machines virtuelles car c'est un obstacle à l'automatisation.

La première fonctionnalité TPM que nous voulons ajouter à Ubuntu (et probablement l'un des cas d'utilisation les plus courants pour un TPM) est la possibilité de lier une clé LUKS un TPM2. De cette façon, le volume peut être automatiquement déverrouillé (sans taper une phrase de passe) en utilisant le TPM2 pour obtenir la clé principale.

Un point clé ici est que la clé principale LUKS réelle n'est pas présente sous forme de texte brut sur le système, elle est protégée par le cryptage TPM.


Prérequis:

    * ubuntu/Debian
    * Puce TPM 2.0

