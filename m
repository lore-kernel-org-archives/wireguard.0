Return-Path: tim@sedlmeyer.us
Return-Path: <tim@sedlmeyer.us>
From: Tim Sedlmeyer <tim@sedlmeyer.us>
MIME-Version: 1.0
Date: Sat, 27 Jan 2018 07:23:12 +0000
Message-ID: <CAK_h9uFz5fFZH6HZQtCG1+Lph0BY5AALZoSa+Xm_wDu5HQnUzQ@mail.gmail.com>
Subject: [PATCH] tools: fix removing preshared keys on some platforms
To: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c1fb6c8582ac70563bce374"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1fb6c8582ac70563bce374
Content-Type: text/plain; charset="UTF-8"

errno is checked following fread of the preshared key file. fread doesn't
set errno, so it shouldn't be checked. On the EdgeRouter ER-X when wg uses
glibc instead of musl libc this incorrect check causes removal of preshared
keys to fail. This patch removes the check of errno.

---
 src/tools/config.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/src/tools/config.c b/src/tools/config.c
index 5ab6ece..0407b36 100644
--- a/src/tools/config.c
+++ b/src/tools/config.c
@@ -128,10 +128,6 @@ static bool parse_keyfile(uint8_t key[static
WG_KEY_LEN], const char *path)
        }

        if (fread(dst, WG_KEY_LEN_BASE64 - 1, 1, f) != 1) {
-               if (errno) {
-                       perror("fread");
-                       goto out;
-               }
                /* If we're at the end and we didn't read anything, we're
/dev/null or an empty file. */
                if (!ferror(f) && feof(f) && !ftell(f)) {
                        memset(key, 0, WG_KEY_LEN);
--
2.16.1

--94eb2c1fb6c8582ac70563bce374
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">errno is checked following fread of the preshared key file=
. fread doesn&#39;t set errno, so it shouldn&#39;t be checked. On the EdgeR=
outer ER-X when wg uses glibc instead of musl libc this incorrect check cau=
ses removal of preshared keys to fail. This patch removes the check of errn=
o.<div>=C2=A0=C2=A0<div><div><div>---</div><div>=C2=A0src/tools/config.c | =
4 ----</div><div>=C2=A01 file changed, 4 deletions(-)</div><div><br></div><=
div>diff --git a/src/tools/config.c b/src/tools/config.c</div><div>index 5a=
b6ece..0407b36 100644</div><div>--- a/src/tools/config.c</div><div>+++ b/sr=
c/tools/config.c</div><div>@@ -128,10 +128,6 @@ static bool parse_keyfile(u=
int8_t key[static WG_KEY_LEN], const char *path)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fr=
ead(dst, WG_KEY_LEN_BASE64 - 1, 1, f) !=3D 1) {</div><div>-=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno) {</div><div>-=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pe=
rror(&quot;fread&quot;);</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;</div><div>-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we&#39;re at the end and we=
 didn&#39;t read anything, we&#39;re /dev/null or an empty file. */</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ferror(f) &=
amp;&amp; feof(f) &amp;&amp; !ftell(f)) {</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(key, =
0, WG_KEY_LEN);</div><div>--</div><div>2.16.1</div></div></div></div></div>

--94eb2c1fb6c8582ac70563bce374--
