Before you begin
================

**This setup downloads all the mail to your computer!** Do not use this method if you have limited disk space!

I have this setup on my server at home and I ssh into it from a tmux session from my desktop and laptop to check and send mail. This makes handeling attachments very difficult. I am currently testing different methods of sending attachments back and forth without having to manually scp everything.

I also assume you only have one address book/CardDav account that you use for all your contacts

Required Programs
----------------

- mutt - the MUA
- offlineIMAP - To sync all your messages with the mail servers
- msmtp - To sent the mail using smtp
- python-pycard - To syncronize contacts with a CardDav server
- links - To view HTML formatted emails

Directions
----------

- Copy the following files/folders into your home directory

   - ``.config/pycard``
   - ``.mutt``
   - ``.muttrc``
   - ``.mailcap``
   - ``.msmtprc``
   - ``.offlineimaprc``

- Edit ``.offlineimaprc``

  - Replace ``ACCOUNT_#`` with whatever names you want
  - Replace ``imap.domain.com``, ``user@domain.com``, ``email@domain.com``, and ``****`` with the correct information

    - (NOTE: Unless you are setting up aliases, ``user@domain.com`` and ``email@domain.com`` are usually the same thing

  - Run ``offlineimap`` to create the folders and do an initial mail sync (This may take a very long time)

- Edit ``.msmtprc``

  - Replace ``ACCOUNT_#`` with the same names you used in ``.offlineimaprc``
  - Replace ``smtp.domain.com``, ``user@domain.com``, ``email@domain.com``, and ``****`` with the correct information

- Edit ``.muttrc``

  - Replace ``ACCOUNT_#`` with the same names you used in ``.offlineimaprc``
  - Replace ``KEY_ID`` with the key you want to use for signing

- Edit ``.mutt/ACCOUNT_#``

  - Rename ``.mutt/ACCOUNT_#`` with the same names you used in ``.offlineimaprc`` 
  - Replace ``ACCOUNT_#`` in each of the files with the same names you used in ``.offlineimaprc``

- Edit ``.mutt/macros``

  - Replace ``ACCOUNT_#`` with the same names you used in ``.offlineimaprc``

- Edit ``.mutt/sigs/ACCOUNT_#``

  - Rename ``.mutt/sigs/ACCOUNT_#`` with the same names you used in ``.offlineimaprc``
  - Replace the contents of each with your signature

- Edit ``.config/pycard/pycard.conf``

  - Replace ``userneme``, ``****``, and ``https://carddavurl.com`` with the proper information
  - Run ``pycardsyncer`` to so an initial addressbook sync

- Add a cron job to run offlineimap and pycardsyncer regularly

  - (NOTE: Instead of syncing every account's whole mailbox every minute, you might want to just sync the INBOX forlders every minute with ``offlineimap -f INBOX`` and do a full sync once or twice a day)

TODO
-----

- Find a good way to handle attachments (Reverse port forwards and scp?)
- Find a good way to not store the passwords in plain text
- Create a auto-setup script
