# posthog-proxy Caddy Module @Render

This is a Caddy v2 plugin for proxying PostHog events using web service @render.com<br>

Render Web Services <br>
https://render.com/docs/web-services <br>
Deploy Render services to Frankfurt, Germany.

How to do cookieless tracking with PostHog <br>
https://posthog.com/tutorials/cookieless-tracking

Deploying a reverse proxy to PostHog Cloud <br>
https://posthog.com/docs/advanced/proxy

## Usage with xcaddy
Replace YOUR_WEBSITE_DOMAIN, YOUR_GITHUB_USERNAME, YOUR_TRACKING_DOMAIN

```sh
xcaddy build --with github.com/YOUR_GITHUB_USERNAME/posthog-proxy/caddy/posthogproxy
