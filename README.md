# VulnShop — formation DevSecOps & sécurisation des pipelines CI/CD

VulnShop est une petite boutique en ligne **volontairement vulnérable**, à usage pédagogique
uniquement. C'est l'application de démo de la formation : on l'analyse, on la scanne, puis on lui
construit un pipeline sécurisé.

## 1. Créer votre copie
1. En haut à droite de cette page : bouton **Fork → Create fork** (gardez le dépôt **public**).
   Le fork copie **tout l'historique** du dépôt — indispensable pour le lab de chasse aux secrets.
2. Sur **votre** fork : **Code → Codespaces → Create codespace**.
3. Attendez la fin de l'installation (quelques minutes) : Gitleaks, Syft, Grype, cosign et pre-commit sont prêts.

## 2. Contenu
| Fichier | Rôle |
| --- | --- |
| `app.py` | Application VulnShop (Flask) |
| `requirements.txt` | Dépendances, volontairement anciennes |
| `Dockerfile` | Image de l'application, à améliorer |
| `.github/workflows/devsecops.yml` | Pipeline à compléter pendant l'atelier 2 |
| `.pre-commit-config.yaml` | Hook Gitleaks pour le lab 3 |

## 3. Burp Suite Community
1. Téléchargez Burp Suite Community Edition : https://portswigger.net/burp/communitydownload
2. Installez-le, lancez-le : **Temporary project** → **Next** → **Use Burp defaults** → **Start Burp**.
3. Onglet **Proxy** → **Intercept** → **Open browser** : ce navigateur passe déjà par Burp,
   aucune configuration de proxy ni de certificat n'est nécessaire.
4. Laissez **Intercept is off** pour naviguer normalement. Toutes les requêtes apparaissent dans
   **Proxy → HTTP history**.
5. Pour rejouer une requête en la modifiant : clic droit → **Send to Repeater**, modifiez-la
   dans l'onglet **Repeater**, puis **Send**.

## 4. Labs PortSwigger de la formation
Connectez-vous à votre compte sur https://portswigger.net/web-security, ouvrez le lab,
puis cliquez sur **Access the lab** : vous obtenez une instance qui n'appartient qu'à vous.

| Jour | Lab | Lien |
| --- | --- | --- |
| 1 | SQL injection vulnerability allowing login bypass | https://portswigger.net/web-security/sql-injection/lab-login-bypass |
| 1 | Reflected XSS into HTML context with nothing encoded | https://portswigger.net/web-security/cross-site-scripting/reflected/lab-html-context-nothing-encoded |
| 1 | Stored XSS into HTML context with nothing encoded | https://portswigger.net/web-security/cross-site-scripting/stored/lab-html-context-nothing-encoded |
| 1 | User ID controlled by request parameter | https://portswigger.net/web-security/access-control/lab-user-id-controlled-by-request-parameter |
| 1 | Unprotected admin functionality | https://portswigger.net/web-security/access-control/lab-unprotected-admin-functionality |
| 1 | Information disclosure in error messages | https://portswigger.net/web-security/information-disclosure/exploiting/lab-infoleak-in-error-messages |
| 2 | Exploiting an API endpoint using documentation | https://portswigger.net/web-security/api-testing (section des labs) |
| 2 | Exploiting a mass assignment vulnerability | https://portswigger.net/web-security/api-testing (section des labs) |
| 2 | Basic SSRF against the local server | https://portswigger.net/web-security/ssrf/lab-basic-ssrf-against-localhost |

## Règles
- Attaquez uniquement les labs PortSwigger listés ci-dessus et votre propre instance de VulnShop.
- Aucun vrai secret, aucun code client dans ce dépôt.
- Après la formation, supprimez votre Codespace : https://github.com/codespaces
