# PUBG Stats for Tidbyt

[Pixlet](https://github.com/tidbyt/pixlet) app to see your PUBG statistics on your [Tidbyt](https://tidbyt.com/)

## Serve the app for local development

`pixlet serve pubg.star username=WackyJacky101 mode=solo_fpp platform=steam pubg_api_key=yourPUBGAPIKey`

## Rendering the app for deployment

Render like this:

`pixlet render pubg.star username=heelsfan23r mode=duo platform=xbox pubg_api_key=yourPUBGAPIKey`

## Deploy to Tidbyt

Authenticate to Tidbyt using pixlet:

`pixlet auth`

Push to device like this using the device ID found in your Tidbyt application:

`pixlet push device-id-to-push-to pubg.webp -i pubg`
