# <center><b>⚠️ <u>ATTENTION LIRE AVANT DE COMMENCER</u> ⚠️</b></center>

<br />

### Pour vous accompagnez durant la mise en place de notre installation veuillez suivre les étapes ci-dessous :
### Vous pourrez retrouver sur le github une image png de notre montage réseau qui se nomme : **Schema_SAE21.png**

<br />

## 1️⃣ | Branchement Mikrotik :

<br />

* Prendre le routeur qui est au nom de Ndeye Codou Touré
* Le brancher à l'ordinateur et à internet
* Faire un dhclient

<br />

⚠️ Si vous rencontrez des difficultés avec le routeur sur le montage par exemple une machine administrative n'arrive pas à un ping internet, joindre le web externe, si vous n'arrivez pas à trouver d'où provient le problème de la config enlever le du montage, le routeur sur gns3 dispose de NAT permettant de joindre internet et le web externe sans le mikrotik.

<br />

## 2️⃣ | Web externe + DNS :

<br />

* Lancer sur l'ordinateur le script bash nommé : **apache2conf.sh**

<br />

Vous vous attendiez peut-être à récupérer des fichiers conf pour les deux services mais grâce à un technicien de notre entreprise tout ceci devient autonome.

<br />

⚠️ En cas de problème avec un des services ou même les deux vous pourrez retrouver les fichiers conf originals dans le dossier **DNSetApache.zip**