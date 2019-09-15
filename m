Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58347C432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:56:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C7F205F4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="I44zhoJm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0C7F205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f85d3243;
	Tue, 24 Sep 2019 08:55:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bea3bc5e
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Sep 2019 18:32:54 +0000 (UTC)
Received: from sonic304-21.consmr.mail.ne1.yahoo.com
 (sonic304-21.consmr.mail.ne1.yahoo.com [66.163.191.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2efed8a
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Sep 2019 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1568572374; bh=cF5JPi3vIV7KWOjfMUj97/iJVwq6qr600VajRu/qoIc=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=I44zhoJmU1SobK8wBXZEwncBxS3/kdfAYWCOEkQmPf9GDHUUYIsIJ3QmUGf4aWYOkYRx9G7yRWCFxZ6VKULB4Y74GGC+XHZ3UlL9OMBOTaZIeDs8WBdEd9QdpozE92K+lqQTrBveD752xE0lTQmuupK3R2Iw5qu3gtf4PY6E/a2spy4owLJB7UZ9NREbhgYEzJMou2HGfk0YbhIMk8HF4jW/ezUQ4xRKEHYM+tpOwznXyB7bebfL9hvMgPBeXssS1RPwKHMXU7rokpTKCEz13Cek2NMjh7kIVlTOijSgLYxzBDi0oD5S4bvCkZ1fa4Dw9n/TpTVqlAVJaDzaknjPig==
X-YMail-OSG: AMQR2VMVM1mqT5H0.rI4zEniJ4SGBDqqkcmvX9RjUvD6th.IHyC65ETtRIrWSmK
 ueQrdbeIFkgrM9LZd38k6IKvsdU4LfFrUvTpHokl5mhZT2PsuT07rmNXYMZTePaqDkr2_KLnf86f
 LEP1OllNSImQbEwyNmBkrQa.UizkqTLZzGCt4cJlzX0uUgtbrL0s13Bvwg1N78zKF9g2pQR1zZ6Z
 .1qZ8YvZS9Z7MsvMaWCeGUrCMDoYiQjEyJ32GWh4zHw6RDtZDobcc78ZhU3vleiix3QjkiczXPuV
 .DNkJgmGrOIwZ0OmrA7DmaHrCsXNM5WWQpUuazx.jma8Zi.zPgaTDyql3pFtdrV9jHadpyFC9w7h
 uFqVBFmUf5_KrSvtflZeZdg6JSgBq.S93VKOrVnkwy3dy_Pu.O2pMDuE9SxenLi8d8NlF_hPNLR.
 hooeMxdw2ceTHSB9yrwBtdM42Ihci84S8wEEnpYgbU_0yRso2wVlu6FccPw1yJiMyddN8SU7Q3F0
 OjN1VQsMIhiM26OXtlff.DC686FpRyR.wzXU463iOgq1DC6GhoY0p3_rW4fCCKVlHRFS7xk.Yn5K
 tFDE2CqqGVKAdjgUXkWd0q8_hmb_bJgGtgBz5la8f3Zt_OJ6cBv0MpXQv.zFq526agtnzRpjpT1Y
 ukQ188OrflO6taMbbZEooax3XozrQNAsciUcfIpneJG0D3f6R1VDOjTKAnprT5VDi5QlwwieDmwJ
 xqxEJFbwaPLadYyR8iVnGFdw4Ou9qXPPWEbkdsxNhUIQSqmsrmkJwWlhAUa_yoheSCIzmPjnKIDP
 5_ObLuM7YIxabBpoCKx0mMy2PcipUcSV5LBX5K2li01OvovlRYCJLUvZZABzVfDYVp_msJsTkqK_
 7cwwEy3TBwwT7Z8gPdejcPrCy4Vr0zRjb1USR3oL1sDoVxWTWI7eNrrFulll_cjR0gXh97EbWVAH
 N7jAUCxdw0O9R30E9cHcfrzWyeoYam3eVmUdKgPa0On3m8bBHM.8bWvVnkYMvv.7.BOt0QspclNV
 mKtUgweGPGUT.65mc1u8AUKWw4NUi7blBtPa7NXvWXA8YFbNUsiDHTFWTvaSFVekTAE6GbTPBvSL
 DB250AXShUzTQY8sdKlhepjDlVptpZfcWIDC9JxvieVjUHNOJPOazsWKsrx211MVPIjZmYsmc5Qz
 MOogypIW9oT0hHwD8sgTMMAm_IfSbTd1AdedTIkOpVx_hphTAFiFs.Wlt4sbVEA2spmRGbvJnsmg
 _8YU5MEIojusoYkzhQCZ96ZgZe4V_mvt1dled06KuAaLOYFzlLLer5tSk7gEeRNkXGA4Gvoo_FL5
 q7GzQNPqmMZaIiSnsVLTcSWvc0iliuLuVJ8QgBpFsFDNictM24VuXBkK8hZap
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Sun, 15 Sep 2019 18:32:54 +0000
Received: by smtp410.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 9420521aef259bd5bb0ff83ad15fd45c; 
 Sun, 15 Sep 2019 18:32:51 +0000 (UTC)
X-YMail-OSG: i64_qb8VM1lnSwoKeFjzC9ahizUI30arxrx_ioLtC1JvOVRTvjL_.q4bW_MxrBL
 8n2vzH8ImGKUyUoqRmQGYbM9SPw1oy1I6drhLEsJaLM6mZStMTsbqEcCiaAUS5fFvXBH4uz8jOYI
 09y.hhOrl_USToM2EVrJZ__M9B5UpwoiB3NVlQ3EtV9Zgc6flY5f4N0KeSecesGNiZJAr1klgCMB
 2qN6vdHTsfdFCgw3oaqLyD6YgOmDbW6OnZpQUHbPSwD3dOFBsgfhG_HI7CrmLhewEObPEkEn0x1e
 iiE4FE0Vbw4ujdXz5PwXx9YL.RDg2sT3EnulHsCfLpMMtO.3IMSG0Mi8SXtAzy.o5rixMoKKGpmx
 N1mSQGRVE.7YDxxcseKl_1BdJqQ07ocQhNnxXBwTkIFOzAea7JH30g3Rhva6gRC3Krn.40KCFfbN
 6.vqwWwHzLI4UR3AwIOpGBss71q6oxhVio9NEqNEDuyHqY4qgnZRtTP6WqFyRlFBAUbyaCjiUFpr
 xrnPVV.oh3kxc9REumMucAbldzd9SJIO8KJYcp.EyuPCBuLH4ytAlqK8xmPVuEkTRUVaGyLQAQjw
 HsNQetSUvDXx_HUFbCA7M5gp2UP1iHAJiwfkIzotTMQtyQmhJIaFyy_uiZu9IzYtaU0eizDtTmGP
 CVIyLWzzvcwM9T7RvQ9FGfRjs_kGgr_j7WHRU2yLyVmnP5bIrTNYv.4.3oNsZ7L1zfvMf2kCXacj
 y06_Jp2TRvVyyvNp04KUv46EVhFfsmvd7TeplVBw72T.62iW4BiumDq0GcCkmt.tgYAtoFhjOCOq
 yGAfDJ5zFdJaJZW5AITpyF.YpG7XhalOgcqSVt3RLP4nSNnSExg99mpBNruW2u6eOAkxp5M0MDpE
 hjjmsZMnIoaLNAO1VYrdeY5tJRweQo7YL3DDiRVkIx1Ao_7viRPOgDCc7sHnSFgaiT6lAHV.2svG
 oZQlfSLCLOCmGxIE3EZvhGTBuv9MTuVboCK6I8KcXl3dKRqoBHp5ySr6PXwQghOspUhofJgf7NxE
 9tKPcmY1Y4eVXC9gty6_wT1TfAt.LMZ6HaOAfHi_l.IOtZJFEh5vng6UuLQ6NKvv6.02aeU5FBnV
 ZOEsy02Hlng.GEeFOL6icYKVbYSzDlgumI5YGujxlLSO_a_meTEa0CbFXKvUjFJk7ERWkDFobZ4A
 u775DAdVX3068rgLIIeTWAiM508Pl5nnvBCAhE8SCNX908iY_5f5MWS10kfsSjEIuOW9_44G2W4h
 L7YHYuok55b1.JHUobL9gcwnqURMg2g--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.bf2.yahoo.com with HTTP; Sun, 15 Sep 2019 18:32:50 +0000
Date: Sun, 15 Sep 2019 18:32:41 +0000 (UTC)
From: George Lucan <boss_geo2005@yahoo.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <1429556426.5086611.1568572361543@mail.yahoo.com>
Subject: Centos 7.6 wg-quick not working properly
MIME-Version: 1.0
References: <1429556426.5086611.1568572361543.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14303 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/12.1.2 Safari/605.1.15
X-Mailman-Approved-At: Tue, 24 Sep 2019 10:55:40 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: George Lucan <boss_geo2005@yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1589677928798716273=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1589677928798716273==
Content-Type: multipart/alternative; 
	boundary="----=_Part_5086610_1756516880.1568572361542"
Content-Length: 8544

------=_Part_5086610_1756516880.1568572361542
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,
I have been trying for several days to setup a wireguard vpn and send all the traffic from a VM to another site (redirect gateway scenario).
Site AOS is Centos 7.6 installed with docker and wireguard installed
Site BOS is a Opensense 19.7.4 with wireguard installed from the plugin and a bunch of other things on it
I believe the issue is within Ip route on Centos 7.6 but I am reaching out for maybe different opinions.On the Centos VM I am using wireguard installed from the repos on the website and using systemd to bring up the tunnel. Everything seem to be brought up correctly except that the traffic does not go through the tunnel.
Further investigating I noticed something unusual (in my opinion).
Before the tunnel is up:#ip rule show
0:      from all lookup local 
32766:  from all lookup main 
32767:  from all lookup default After the tunnel is up:#ip rule show
0:      from all lookup local 
32764:  from all lookup main 
32765:  not from all fwmark 0xca6c lookup 51820 
32766:  from all lookup main 
32767:  from all lookup default To me is seems like somehow there are 2 tables named "main" one after the new table created by wg-quick (looking at the priority it seems it is the same one that was present previously) and another one that gets create out of thin air before the wireguard created one named 51820.Ping works through the tunnel for IP to the other end of the tunnel#wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds# ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=1 ttl=64 time=89.2 ms
64 bytes from 192.168.249.1: icmp_seq=2 ttl=64 time=89.5 msIs there any step that I might have missed or any kernel feature that would explain the behaviour?Worth mentioning it is a home env so I can test whatever is needed to get to the bottom of it.
Thanks
George
------=_Part_5086610_1756516880.1568572361542
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpceb13acfyahoo-style-wrap" style=
=3D"font-size: 13px;"><div dir=3D"ltr" data-setdir=3D"false" style=3D"font-=
family: Helvetica Neue, Helvetica, Arial, sans-serif;">Hello,</div><div dir=
=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif;"><br></div><div dir=3D"ltr" data-setdir=3D"false" s=
tyle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">I have =
been trying for several days to setup a wireguard vpn and send all the traf=
fic from a VM to another site (redirect gateway scenario).</div><div dir=3D=
"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue, Helvetica=
, Arial, sans-serif;"><br></div><div dir=3D"ltr" data-setdir=3D"false" styl=
e=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">Site A</di=
v><div dir=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif;">OS is Centos 7.6 installed with docker a=
nd wireguard installed</div><div dir=3D"ltr" data-setdir=3D"false" style=3D=
"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div><div=
 dir=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif;">Site B</div><div dir=3D"ltr" data-setdir=3D"fa=
lse" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">O=
S is a Opensense 19.7.4 with wireguard installed from the plugin and a bunc=
h of other things on it</div><div dir=3D"ltr" data-setdir=3D"false" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div><=
div dir=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue,=
 Helvetica, Arial, sans-serif;">I believe the issue is within Ip route on C=
entos 7.6 but I am reaching out for maybe different opinions.</div><div dir=
=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif;">On the Centos VM I am using wireguard installed fr=
om the repos on the website and using systemd to bring up the tunnel. Every=
thing seem to be brought up correctly except that the traffic does not go t=
hrough the tunnel.</div><div dir=3D"ltr" data-setdir=3D"false" style=3D"fon=
t-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=
=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif;">Further investigating I noticed something unusual =
(in my opinion).</div><div dir=3D"ltr" data-setdir=3D"false" style=3D"font-=
family: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=
=3D"ltr" data-setdir=3D"false" style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif;">Before the tunnel is up:</div><div dir=3D"ltr" dat=
a-setdir=3D"false" style=3D"font-family: Helvetica Neue, Helvetica, Arial, =
sans-serif;"><div dir=3D"ltr" data-setdir=3D"false"><pre style=3D"orphans: =
2; widows: 2;">#ip rule show
0:      from all lookup local=20
32766:  from all lookup main=20
32767:  from all lookup default </pre></div></div><div dir=3D"ltr" data-set=
dir=3D"false" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif;">After the tunnel is up:</div><div dir=3D"ltr" data-setdir=3D"false"=
><div dir=3D"ltr" data-setdir=3D"false"><pre style=3D"font-family: Helvetic=
a Neue, Helvetica, Arial, sans-serif; orphans: 2; widows: 2;">#ip rule show
0:      from all lookup local=20
32764:  from all lookup main=20
32765:  not from all fwmark 0xca6c lookup 51820=20
32766:  from all lookup main=20
32767:  from all lookup default </pre><pre style=3D"font-family: Helvetica =
Neue, Helvetica, Arial, sans-serif; orphans: 2; widows: 2;"><span><span sty=
le=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">To me is =
seems like somehow there are 2 tables named "main" one after the new table =
created by wg-quick (looking at the priority it seems it is the same one th=
at was present previously) and another one that gets create out of thin air=
 before the wireguard created one named 51820.</span></span></pre><pre styl=
e=3D"orphans: 2; widows: 2;"><span style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif;">Ping works through the tunnel for IP to the ot=
her end of the tunnel</span></pre><pre style=3D"orphans: 2; widows: 2;"><di=
v dir=3D"ltr" data-setdir=3D"false"><pre>#wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=3D
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=3D
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds</pre><pre><div dir=3D"ltr" data-se=
tdir=3D"false"><pre># ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=3D1 ttl=3D64 time=3D89.2 ms
64 bytes from 192.168.249.1: icmp_seq=3D2 ttl=3D64 time=3D89.5 ms</pre></di=
v></pre></div></pre></div></div><div dir=3D"ltr" data-setdir=3D"false" styl=
e=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><span><pre=
 style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; orphan=
s: 2; widows: 2;">Is there any step that I might have missed or any kernel =
feature that would explain the behaviour?</pre><pre style=3D"font-family: H=
elvetica Neue, Helvetica, Arial, sans-serif; orphans: 2; widows: 2;">Worth =
mentioning it is a home env so I can test whatever is needed to get to the =
bottom of it.</pre><pre style=3D"font-family: Helvetica Neue, Helvetica, Ar=
ial, sans-serif; orphans: 2; widows: 2;"><br></pre><pre style=3D"font-famil=
y: Helvetica Neue, Helvetica, Arial, sans-serif; orphans: 2; widows: 2;">Th=
anks</pre><pre style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans=
-serif; orphans: 2; widows: 2;"><br></pre><pre style=3D"font-family: Helvet=
ica Neue, Helvetica, Arial, sans-serif; orphans: 2; widows: 2;">George</pre=
></span></div></div></body></html>
------=_Part_5086610_1756516880.1568572361542--

--===============1589677928798716273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1589677928798716273==--
