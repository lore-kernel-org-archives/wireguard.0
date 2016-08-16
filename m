Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c75db3de
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 23:09:29 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Matthias Schiffer <mschiffer@universe-factory.net>, n3ph <n3ph@terminal21.de>
References: <101056cc-e944-a049-f194-c61567a1dcf1@viisauksena.de>
 <CAHmME9qaxVFdhNXtkPHgLPqR1_F_+DLsmircQX5O7OAG5YWcJg@mail.gmail.com>
 <382aed3a-349c-d518-16ae-3fdd8b1127f8@viisauksena.de>
 <CAHmME9oi=gbw67aVhW-UXNe0uBpth1EG9ekoKv9M9GTke4UaFw@mail.gmail.com>
 <CAHmME9ooEnf4ZsyciTQShzN2S6+0btpnW61FBTQzfJHZjCVLcw@mail.gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <dc238a09-041c-cd86-ed81-f7db1f1ec684@viisauksena.de>
Date: Wed, 17 Aug 2016 01:10:44 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9ooEnf4ZsyciTQShzN2S6+0btpnW61FBTQzfJHZjCVLcw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A5CB16F10FF530C7416BAB43"
Subject: Re: [WireGuard] wireguard comparing to fastd - tests
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------A5CB16F10FF530C7416BAB43
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 16.08.2016 14:17, Jason A. Donenfeld wrote:
>> ---------- Forwarded message ----------
>> From: jens <jens@viisauksena.de>
>>
>> thx, thats true ... we were mostly interested in comparing speed in
>> similar setups that we would deploy.
>> But you ' re right - reducing workload from 20 to 12 in cypher make
>> them not directly comparable
> Alternatively, you could pretty easily tweak wireguard to use
> chacha20/12 by changing "for (i =3D 0; i < 20; i +=3D 2) {" to "for (i =
=3D
> 0; i < 12; i +=3D 2) {" in src/crypto/chacha20poly1305.c.
>
> Would be interested in fair side-by-side benchmarks of the two.

here some more tests with fastd directly, i dont see any big difference
between salsa20 and salsa2012, but i big difference in direction ...
which is somehow new for me.

i will not do the different wireguard testings with different ciphers,
as i am still struggling in building valid reproducable kmod..ipk
packages for LEDE

so i think fastd testing is finished by this (which at all only was to
compare to our existing setup) - a small notice : OpenWRT Wiki was wrong
with CPU speed of TPlink841v11 - it is not 560MHz, it is 650Mhz - if
somebody ever want to compare another embedded device

greetz Jens

2016-08-16 06:36:42 +0000 --- Verbose: new session with <foo>
established using method `salsa20+umac'.

TCP
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  18.3 MBytes  15.3 Mbits/sec    0             sen=
der
[  4]   0.00-10.00  sec  16.6 MBytes  14.0 Mbits/sec                =20
receiver
TCP - other direction
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  13.6 MBytes  11.4 Mbits/sec   28             sen=
der
[  4]   0.00-10.00  sec  13.5 MBytes  11.3 Mbits/sec                =20
receiver

UDP (pushed 200M udp - somthing up to 30 is fine with many jitter and los=
s)
[  5] local 192.168.2.23 port 5201 connected to 192.168.1.23 port 44727
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-1.00   sec  1.15 MBytes  9.63 Mbits/sec  5.144 ms  0/147 (0%=
)=20
[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  5.144 ms  0/0 (-nan%)=
=20
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  5.144 ms  0/0 (-nan%)=
=20
=2E.. killed/crashed




again
2016-08-16 07:22:41 +0000 --- Verbose: new session with <foo>
established using method `salsa2012+umac'.
TCP direction -> peer - server
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  18.4 MBytes  15.4 Mbits/sec   12             sen=
der
[  4]   0.00-10.00  sec  16.7 MBytes  14.0 Mbits/sec                =20
receiver
TCP direction -> server - peer
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  5]   0.00-10.04  sec  13.8 MBytes  11.5 Mbits/sec   25             sen=
der
[  5]   0.00-10.04  sec  13.7 MBytes  11.4 Mbits/sec                =20
receiver

--=20
make the world nicer, please use PGP encryption


--------------A5CB16F10FF530C7416BAB43
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16.08.2016 14:17, Jason A. Donenfeld
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHmME9ooEnf4ZsyciTQShzN2S6+0btpnW61FBTQzfJHZjCVLcw@mail.gmail.com"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">---------- Forwarded message ----------
From: jens <a class="moz-txt-link-rfc2396E" href="mailto:jens@viisauksena.de">&lt;jens@viisauksena.de&gt;</a>

thx, thats true ... we were mostly interested in comparing speed in
similar setups that we would deploy.
But you ' re right - reducing workload from 20 to 12 in cypher make
them not directly comparable
</pre>
      </blockquote>
      <pre wrap="">
Alternatively, you could pretty easily tweak wireguard to use
chacha20/12 by changing "for (i = 0; i &lt; 20; i += 2) {" to "for (i =
0; i &lt; 12; i += 2) {" in src/crypto/chacha20poly1305.c.

Would be interested in fair side-by-side benchmarks of the two.
</pre>
    </blockquote>
    <p>here some more tests with fastd directly, i dont see any big
      difference between salsa20 and salsa2012, but i big difference in
      direction ... which is somehow new for me.</p>
    <p>i will not do the different wireguard testings with different
      ciphers, as i am still struggling in building valid reproducable
      kmod..ipk packages for LEDE</p>
    <p>so i think fastd testing is finished by this (which at all only
      was to compare to our existing setup) - a small notice : OpenWRT
      Wiki was wrong with CPU speed of TPlink841v11 - it is not 560MHz,
      it is 650Mhz - if somebody ever want to compare another embedded
      device<br>
    </p>
    <p>greetz Jens<br>
      <br>
    </p>
    <p>2016-08-16 06:36:42 +0000 --- Verbose: new session with
      &lt;foo&gt; established using method `salsa20+umac'.<br>
    </p>
    <p>TCP <br>
      - - - - - - - - - - - - - - - - - - - - - - - - -<br>
      [ ID] Interval           Transfer     Bandwidth       Retr<br>
      [  4]   0.00-10.00  sec  18.3 MBytes  15.3 Mbits/sec   
      0             sender<br>
      [  4]   0.00-10.00  sec  16.6 MBytes  14.0
      Mbits/sec                  receiver<br>
      TCP - other direction<br>
      - - - - - - - - - - - - - - - - - - - - - - - - -<br>
      [ ID] Interval           Transfer     Bandwidth       Retr<br>
      [  4]   0.00-10.00  sec  13.6 MBytes  11.4 Mbits/sec  
      28             sender<br>
      [  4]   0.00-10.00  sec  13.5 MBytes  11.3
      Mbits/sec                  receiver<br>
    </p>
    <p>UDP (pushed 200M udp - somthing up to 30 is fine with many jitter
      and loss)<br>
      [  5] local 192.168.2.23 port 5201 connected to 192.168.1.23 port
      44727<br>
      [ ID] Interval           Transfer     Bandwidth       Jitter   
      Lost/Total Datagrams<br>
      [  5]   0.00-1.00   sec  1.15 MBytes  9.63 Mbits/sec  5.144 ms 
      0/147 (0%)  <br>
      [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  5.144 ms  0/0
      (-nan%)  <br>
      [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  5.144 ms  0/0
      (-nan%)  <br>
      ... killed/crashed<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
      again<br>
      2016-08-16 07:22:41 +0000 --- Verbose: new session with
      &lt;foo&gt; established using method `salsa2012+umac'.<br>
      TCP direction -&gt; peer - server<br>
      - - - - - - - - - - - - - - - - - - - - - - - - -<br>
      [ ID] Interval           Transfer     Bandwidth       Retr<br>
      [  4]   0.00-10.00  sec  18.4 MBytes  15.4 Mbits/sec  
      12             sender<br>
      [  4]   0.00-10.00  sec  16.7 MBytes  14.0
      Mbits/sec                  receiver<br>
      TCP direction -&gt; server - peer<br>
      - - - - - - - - - - - - - - - - - - - - - - - - -<br>
      [ ID] Interval           Transfer     Bandwidth       Retr<br>
      [  5]   0.00-10.04  sec  13.8 MBytes  11.5 Mbits/sec  
      25             sender<br>
      [  5]   0.00-10.04  sec  13.7 MBytes  11.4
      Mbits/sec                  receiver<br>
      <br>
    </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------A5CB16F10FF530C7416BAB43--
