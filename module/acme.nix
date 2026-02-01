{ acme, ... }:

{
   security.acme = {
       acceptTerms = true;
       defaults.email = "example@gmaildummy.work"
       certs."" = {
           dnsProvider = "cloudflare";
           credentialsFile = "/etc/secrets/cf.env";
           dnsPropagationCheck = true;
       };
   };
}
