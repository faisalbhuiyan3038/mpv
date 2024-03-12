install mpv via flatpak

`sudo apt install flatpak`
`sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`
`flatpak install flathub io.mpv.Mpv -y`

list mpv options:
`mpv --list-options`

`flatpak run io.mpv.Mpv`

config file located in:
`/home/faisal/.var/app/io.mpv.Mpv/config`

if not there run:
`nano ~/.config/mpv/mpv.conf`

cloning command:
`gh repo clone faisalbhuiyan3038/mpv -- --branch ubuntu --depth 1`
