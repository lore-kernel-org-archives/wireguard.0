Return-Path: tim@sedlmeyer.us
Return-Path: <tim@sedlmeyer.us>
From: Tim Sedlmeyer <tim@sedlmeyer.us>
MIME-Version: 1.0
Date: Wed, 22 Nov 2017 23:53:43 +0000
Message-ID: <CAK_h9uHiudc2d_qOJgQeQd7+8oB-Kgr8nN_S5Y1hsBUu==Zd1w@mail.gmail.com>
Subject: Removing pre-shared key from peer using wg set fails
To: WireGuard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c0551c6355ccd055e9b088e"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0551c6355ccd055e9b088e
Content-Type: text/plain; charset="UTF-8"

Removal of the preshared-key from a peer using the 'wg set' command and
providing /dev/null or an empty file as the preshared-key filename does not
result in the key being removed from the peer. The command doesn't return
an error, but it also doesn't remove the key. I have attempted it using
0.0.20171111 and 0.0.20171122.

Supplying /dev/null or an empty file as the filename does work properly for
removing the interface private-key.

--94eb2c0551c6355ccd055e9b088e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Removal of the preshared-key from a peer using the &#39;wg=
 set&#39; command and providing /dev/null or an empty file as the preshared=
-key filename does not result in the key being removed from the peer. The c=
ommand doesn&#39;t return an error, but it also doesn&#39;t remove the key.=
 I have attempted it using 0.0.20171111 and 0.0.20171122.<div><br><div>Supp=
lying /dev/null or an empty file as the filename does work properly for rem=
oving the interface private-key.</div></div></div>

--94eb2c0551c6355ccd055e9b088e--
