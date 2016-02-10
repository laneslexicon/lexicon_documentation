The latest version of the software can be downloaded from [here](https://github.com/laneslexicon/lexicon/releases).

Binary versions exist for Windows and OSX users.

\*BSD and Linux users should review the build instructions.

It is has been tested on the following operating systems:

| OS | Version |
|---|-------|
|Windows | 7, 8 |
|OSX     | Mountain Lion |
| FreeBSD  | 10.2 |
| Linux Mint | 17 |
| Debian     | 8.2 |
| Ubuntu     | 14 |

For those who wish to verify the downloads, a signature file is available at the download page. You should download the executable and the matching signature file to the same directory and, after importing my public key, do for example:

```
gpg --verify laneslexicon-v1.0.dmg.sig
gpg: assuming signed data in 'laneslexicon-v1.0.dmg'
gpg: Signature made Fri  5 Feb 19:43:23 2016 GMT using RSA key ID E98D7DF6
gpg: Good signature from "Graeme Andrews <laneslexicon@theunwalledcity.com>" [ultimate]
```
The public key is [here](./laneslexicon.asc)

Its gpg fingerprint is : B8DC 629D 4791 ADF1 619A  ADB8 4FC2 8F17 C4A3 7E83
