up:
	docker-compose up -d

down:
	docker-compose down

do:
	docker-compose exec nginx_certbot ${CMD}

show_certificates:
	docker-compose exec nginx_certbot certbot certificates

create_certificate:
	docker-compose exec nginx_certbot certbot --renew-by-default --nginx --deploy-hook "nginx -s reload"

test_renewal_certificates:
	docker-compose exec nginx_certbot certbot renew --dry-run

build_image:
	docker build . --no-cache --tag mr-dxdy/nginx-certbot:${VERSION}

publish_image:
	docker push mr-dxdy/nginx-certbot:${VERSION}
