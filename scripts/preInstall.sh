#set env vars
#set -o allexport; source .env; set +o allexport;

if [ -e "./entrypoint.sh" ]; then
   exit 0;
fi

cat <<EOT > entrypoint.sh
yarn add @strapi/provider-email-nodemailer

EOT

chmod +x ./entrypoint.sh
