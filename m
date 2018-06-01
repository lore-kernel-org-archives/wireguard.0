Return-Path: maximilian@eschenbacher.email
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 709a240d
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:36:39 +0000 (UTC)
Received: from qadesch.kajt.de (qadesch.kajt.de [IPv6:2a03:4000:6:2012::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47fbafbf
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:36:38 +0000 (UTC)
Received: from kajt.de (unknown [IPv6:2a02:8071:1e4:d500:98aa:e746:9a15:b016])
 by qadesch.kajt.de (Postfix) with ESMTPSA id 291D7161219
 for <wireguard@lists.zx2c4.com>; Fri,  1 Jun 2018 18:38:54 +0200 (CEST)
Date: Fri, 1 Jun 2018 18:38:53 +0200
From: Maximilian Eschenbacher <maximilian@eschenbacher.email>
To: wireguard@lists.zx2c4.com
Subject: Wireguard on android w/o kernel module
Message-ID: <20180601163852.bjlmnqjeqd5eidvo@kajt.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="636pkpink74ga4rh"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--636pkpink74ga4rh
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Good day to all of you,

I'm using wireguard version 0.0.20180601 from google play store on a
stock BQ Aquaris X with android version 8.1 without the wireguard kernel
module.

I am unable to start any tunnels. Every time I am trying to do so there
is a window which tells me: "Error brining up tunnel: VPN service not
authorized by user". I have been looking around the android settings
because this sounds like a configuration issue which I could be able to
solve as an end user, however, I didn't turn up anything useful.

Here's the `adb logcat` output:

06-01 18:27:03.518  6265  6906 D WireGuard/GoBackend: Changing tunnel test1 to state UP
06-01 18:27:03.519  6265  6906 I WireGuard/GoBackend: Bringing tunnel up
06-01 18:27:03.542  6265  6265 E WireGuard/b: Error bringing up tunnel: VPN service not authorized by user
06-01 18:27:03.542  6265  6265 E WireGuard/b: b.b.a.b: java.lang.Exception: VPN service not authorized by user
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at b.b.a.a.d(Unknown Source:19)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at b.b.a.a.e(Unknown Source:4)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at b.b.a.a$n.a(Unknown Source:18)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at b.b.a.a.b(Unknown Source:35)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at b.b.a.a.c(Unknown Source:15)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.e.a.a(Unknown Source:0)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.e.e.run(Unknown Source:4)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at android.os.Handler.handleCallback(Handler.java:790)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at android.os.Handler.dispatchMessage(Handler.java:99)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at android.os.Looper.loop(Looper.java:164)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at android.app.ActivityThread.main(ActivityThread.java:6518)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at java.lang.reflect.Method.invoke(Native Method)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:438)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:807)
06-01 18:27:03.542  6265  6265 E WireGuard/b: Caused by: java.lang.Exception: VPN service not authorized by user
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.backend.GoBackend.a(Unknown Source:25)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.backend.GoBackend.a(Unknown Source:74)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.d.b.b(Unknown Source:2)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.d.w.a(Unknown Source:6)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.e.a.a(Unknown Source:0)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at com.wireguard.android.e.c.run(Unknown Source:6)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at android.os.AsyncTask$SerialExecutor$1.run(AsyncTask.java:245)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
06-01 18:27:03.542  6265  6265 E WireGuard/b: 	at java.lang.Thread.run(Thread.java:764)

Am I missing something obvious?

Best regards

Max

--636pkpink74ga4rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEERYcLdcC+E/zRfMueawQJLrDVljUFAlsRdpoACgkQawQJLrDV
ljUnZw//XZnvnUb5L4YalHqhY7pYFeFYZj1IcwLlNpaW8najUKkU7q+0b44mfSao
/4/TSVOrBOkUMc9NZdJxUdFemhevrvt5pKWlhr5s8nMOW2s0GDFwBtVKPdjkLHAL
ia+EqmbSiVD7X+DRJxGm8DpmI8cL5rktQK3mQaahWDmgQA5x13Ai0VTY4M3rvERy
uyDqb2N5DgmCZjovzMFrXD3E6q/Zo7MZl6EqNvwUiNto2YfeDNMAUtva9v5hLwAz
85Z03jb3ZK+3/oHXzB1ERacmlnh7xR9R5uKmVoAHu2Rplf2Vx5PR71dI5PayZRXB
LsBPkQsbxpipTUlsFDoH4iYfHV6RE3hODRMBGdFD3M9W/Ibl7lspGp4HLauRr3lH
MoJtZb+XfAB+RwqLy5W7wczO93ZDzq7JcQVeX05aJlNULWbx6F7YrOxdqyB6Wpgs
M+iUzO+P5QZpkoCER8hkBr1v7pDqKmFU3VsS8K5taNPwKHQB8h2lgmJmD6/G5hAW
dPbGPdJXqUjk+nbzTvECg9KM01nYdTp0GBSLF9+9tQ94uBRs0BdXi3MHqihkA7kC
Hm0xL4TrsH1mHUksJJ6AqFB6u9VkXnPqkCswGTG7XDmOa0c3vecXVmgRylD4/j0P
a+ji54skz63JJwm6lWOibjiW3iA9hl7TO33UGtz66leBsJqbwEs=
=uPEc
-----END PGP SIGNATURE-----

--636pkpink74ga4rh--
