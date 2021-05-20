
firefox:
  pkg.installed:
    - pkgs:
      - curl
      - firefox
      - tree
      - git

/etc/firefox/syspref.js:
  file.managed:
    - source: salt://projekti/syspref.js

Discord:
  cmd.run:
    - name: curl -L -o /home/discord.deb https://discord.com/api/download?platform=linux&format=deb
    - creates: /home/discord.deb
  pkg.installed:
    - sources:
      - discord: /home/discord.deb


blender:
  pkg.installed

/etc/skel/userpref.blend:
  file.managed:
    - source: salt://projekti/userpref.blend

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg:
  file.managed:
    - source: salt://projekti/ubuntu-keyring-2012-archive.gpg

/etc/apt/sources.list.d/spotify.list:
  file.managed:
    - source: salt://projekti/spotify.list

spotify:
  pkg.installed:
    - name: spotify-client
    - refresh: True  
