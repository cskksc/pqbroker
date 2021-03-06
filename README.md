# cf-postgresql-broker [![Build Status](https://travis-ci.org/cskksc/pqbroker.svg?branch=golang-migration)](https://travis-ci.org/cskksc/pqbroker)
CF PostgreSQL broker provides PostgreSQL databases as a Cloud Foundry service. This uses Service Broker API v2.4.

## Usage

1. Install the `cf` command line tool.
2. Push this broker app in the desired org + space.
3. Register the broker with CF. ([API Documentation](http://docs.cloudfoundry.org/services/managing-service-brokers.html))
4. Give users access to the service. ([API Documentation](http://docs.cloudfoundry.org/services/access-control.html#enable-access))

## PostgreSQL Service

This broker only implements a subset of the [Services API](http://docs.cloudfoundry.org/services/api.html).

API | Result |
--- | :----- |
GET /v2/catalog | Advertises the service and its plans offered in CF marketplace. |
PUT /v2/service_instances/:id | Creates a database `d-id`. |
PUT /v2/service_instances/:instance_id/service_bindings/:binding_id | Creates a user `u-binding_id` and grants him privileges on database `d-instance_id`
DELETE /v2/service_instances/:instance_id/service_bindings/:binding_id | Deletes the user `u-binding_id` and all objects owned by him.
DELETE /v2/service_instances/:instance_id | Deletes the database `d-instance_id`.

## Configuration
The file `config/settings.json` configures the catalog of services and plans available to users.

The file `config/auth.json` configures the basic auth credentials used to authenticate inbound CC (Cloud-Controller) requests. If the credentials are ever changed in the `auth.json` file, run `go-bindata config/` to update the configuration in `bindata.go` (which is a static file generated for runtime use. For more information: [go-bindata](https://github.com/jteeuwen/go-bindata.git)).

## Development
The broker is tested using cucumber features.
To test continuously:
    `$  watchr watch-tests.watchr`
