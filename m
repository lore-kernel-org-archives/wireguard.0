Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C23C64EAD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 15:16:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C4AA214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 15:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="BTIYq3+i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C4AA214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45b4f1a1;
	Tue, 9 Oct 2018 15:15:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6f84049
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 15:05:56 +0000 (UTC)
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
 (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5f95e29
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1539097610; bh=7yfpV55lk7hwPDQewn8Nt1vGyjhNqSXQSWlLfWOSng8=;
 h=To:From:Subject:Date:From:Subject;
 b=BTIYq3+itKUlcpzAWudjLL9NFChf8wIC87kTuHaU4tc5z/P7nJNd3MrraoVnaj2usf06JNbF/Okl0sEXKhJEHg3RKbvOYQ7JSKSJQ1q+eYUHMt/VsyIgpGFr7e1dcSpV9ZBHNYLu84MSU+PIhraDYe7i6CXzdsACNsVIkAhWkcLtXKG6UWzNjBNneK6uIibc7P21/dr0TI5QmY0V9l52JLg6nBmS1nFQ4iEjB80fa+9Qx3NmkdAXn7F3oZbGiU+vRNnAv82B9g8HwaAzFbHw4GTCFQ0IqR0OTF3CUbzlMN/VmG6eSwUtm5r7mAuuWzEthem96IwExE9k4EVQiPn3Rw==
X-YMail-OSG: K2ueF48VM1mWn.6hBtoDj0H4OIG2BE17io9Ya2biqdA2LgXA61vexJ.v3Bi5dJN
 XAzl8rm3CvrQ16_wanBKM2wBsd_sJXrj0Cm5vh5TLjKiySOPTYq13mzrWiYlO2bgGIyyYf3p0QZZ
 4ODrPeL8s40JCQmLoDjSE.PziIU.CrmHGj50q6OICGVmz3vAnnlWWEp_8ss40UP2q3Zj0GZHIip5
 yGmbRKoMpmojcirg1K.aYvmdaECO0NngtfGJPP9AVQXsDjj30lR0nUcc9PplJ9e2mJPjjoD3CpaK
 EdXLW.Pr7GJeDDw6o_iGadRdtSSoMF3WNQ07rwvWwwze_pHUGiOfCotWBYxTZabaqpKVstb6U6BV
 G4w3v3x0UDYLZpT7wiLW0EjaAH1ICxY4lZsXsGmfhNuUfdF.XATXX1hzjL9yeA3m3a9X3DA3ELtm
 QEZwu8UtA4.2SBT.5nEd8vRTtXiKIyQIUAI5E9RHJ._DHk2qZ2f3EacJYZNa5pE93SEqhHbMMgOS
 cUo0oiJDxzLD8J2Rta_1aheBOg1qEg9kkhVDfF7QygsLQqwChWpEBc3xeO89SLWNMxkX_dGGhUS0
 plC0neF0GbfVYhkLvfWEI2NYlRHR5CjmAusD8xVd2CkAFk9iRr9GnK7E2jwx.YVKVOqEy2nJHVh9
 eTioBH2vUi2HtaWq4eaMRpchg36JMErxaDEsayP4dCj3GI4fNQKutYIkjSyLy.QIr_T7HEsw70qT
 JpnnXgEPA0m2ancvEt4xRJwlak_lptgWaNZsCcaMoRV.9az6OobDp71JQO2fGJukJoI2r67nLVNW
 rsW4A9gU6e9fOo_CXdHmOD8XgAcinfaIoKm2s_YU10r9uJcdrmepupwqES58NiMr.QVNCcMupq0l
 sKZU1SJ_gNq2oqNm6BfV6JM_DFT9e0YYwi1nNjyOGzIfa00pHRLQkaDQtncCEx53t.8phUUxeI25
 z4MAabCAXAaI1JEwy6l6P6JuPMsleaA6uSfEjqmLTwLwvRuAXJsPOes_RetuJKuEiZoWQL7ue
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 9 Oct 2018 15:06:50 +0000
Received: from 82-197-199-141.dsl.cambrium.nl (EHLO [192.168.20.251])
 ([82.197.199.141])
 by smtp422.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 b379909a8237baed7e393284fb51bbb5 for <wireguard@lists.zx2c4.com>;
 Tue, 09 Oct 2018 15:06:47 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: "Dennis van J." <dennis_20@yahoo.com>
Subject: Wireguard not coming up on DD-wrt
Message-ID: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
Date: Tue, 9 Oct 2018 17:06:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: nl
X-Mailman-Approved-At: Tue, 09 Oct 2018 17:15:31 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3339068130613336475=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============3339068130613336475==
Content-Type: multipart/alternative;
 boundary="------------8FB80E47AD56FA148F497362"
Content-Language: nl

This is a multi-part message in MIME format.
--------------8FB80E47AD56FA148F497362
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi all,

I have setup Wireguard on a Gentoo box, compiled it into the kernel
using instructions on the wireguard website. Got my mobile to connect
using 4G to this box fine, so I wanted to test further with a friend of
mine who has a DD-wrt installation on his router. Wireguard is
integrated into the DD-wrt build, we set it up, but the tunnel does not
come up. On the server I only see this:

Oct  9 16:45:34 omega kernel: [178809.449718] wireguard: wg0: Receiving
handshake initiation from peer 10 (x.169.86.x:22300)
Oct  9 16:45:34 omega kernel: [178809.449721] wireguard: wg0: Sending
handshake response to peer 10 (x.169.86.x:22300)
Oct  9 16:45:34 omega kernel: [178809.450130] wireguard: wg0: Keypair
32179 destroyed for peer 10
Oct  9 16:45:34 omega kernel: [178809.450131] wireguard: wg0: Keypair
32180 created for peer 10
Oct  9 16:45:39 omega kernel: [178814.519668] wireguard: wg0: Receiving
handshake initiation from peer 10 (x.169.86.x:22300)
Oct  9 16:45:39 omega kernel: [178814.519671] wireguard: wg0: Sending
handshake response to peer 10 (x.169.86.x:22300)
Oct  9 16:45:39 omega kernel: [178814.520062] wireguard: wg0: Keypair
32180 destroyed for peer 10
Oct  9 16:45:39 omega kernel: [178814.520063] wireguard: wg0: Keypair
32181 created for peer 10
Oct  9 16:45:44 omega kernel: [178819.579701] wireguard: wg0: Receiving
handshake initiation from peer 10 (x.169.86.x:22300)
Oct  9 16:45:44 omega kernel: [178819.579704] wireguard: wg0: Sending
handshake response to peer 10 (x.169.86.x:22300)
Oct  9 16:45:44 omega kernel: [178819.580094] wireguard: wg0: Keypair
32181 destroyed for peer 10
Oct  9 16:45:44 omega kernel: [178819.580095] wireguard: wg0: Keypair
32182 created for peer 10
Oct  9 16:45:50 omega kernel: [178824.910142] wireguard: wg0: Receiving
handshake initiation from peer 10 (x.169.86.x:22300)
Oct  9 16:45:50 omega kernel: [178824.910145] wireguard: wg0: Sending
handshake response to peer 10 (x.169.86.x:22300)
Oct  9 16:45:50 omega kernel: [178824.910535] wireguard: wg0: Keypair
32182 destroyed for peer 10
Oct  9 16:45:50 omega kernel: [178824.910536] wireguard: wg0: Keypair
32183 created for peer 10
Oct  9 16:45:55 omega kernel: [178829.950001] wireguard: wg0: Receiving
handshake initiation from peer 10 (x.169.86.x:22300)
Oct  9 16:45:55 omega kernel: [178829.950003] wireguard: wg0: Sending
handshake response to peer 10 (x.169.86.x:22300)
Oct  9 16:45:55 omega kernel: [178829.950406] wireguard: wg0: Keypair
32183 destroyed for peer 10
Oct  9 16:45:55 omega kernel: [178829.950407] wireguard: wg0: Keypair
32184 created for peer 10

Port on the server is open (since the 4G test works). We can reach the
22300 port on his side. Checked the pub/private keys as well.

wg show on server:

interface: wg0
  public key: <pubkey server>
  private key: (hidden)
  listening port: 51820

peer: <pubkey of mobile>
  endpoint: x.200.39.x:8971
  allowed ips: 0.0.0.0/0
  latest handshake: 8 hours, 1 minute, 43 seconds ago
  transfer: 384.24 KiB received, 2.74 MiB sent

peer: <pubkey of dd-wrt>
  endpoint: x.169.86.x:22300
  allowed ips: 192.168.1.0/24, 10.100.0.3/32
  transfer: 2.00 MiB received, 1.24 MiB sent

On DD-wrt router:

interface: oet1
  public key: <pubkey dd-wrt>
  private key: (hidden)
  listening port: 22300

peer: <pubkey of server>
  endpoint: x.197.199.x:51820
  allowed ips: 0.0.0.0/0
  transfer: 0 B received, 777.43 KiB sent
  persistent keepalive: every 25 seconds

We are trying to get logging to work on that DD-wrt box, that should
contain some more clues but maybe any of you have an idea?

Cheers,

Dennis



--------------8FB80E47AD56FA148F497362
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Verdana">Hi all,</font></p>
    <p><font face="Verdana">I have setup Wireguard on a Gentoo box,
        compiled it into the kernel using instructions on the wireguard
        website. Got my mobile to connect using 4G to this box fine, so
        I wanted to test further with a friend of mine who has a DD-wrt
        installation on his router. Wireguard is integrated into the
        DD-wrt build, we set it up, but the tunnel does not come up. On
        the server I only see this:</font></p>
    <p><font face="Verdana">Oct  9 16:45:34 omega kernel:
        [178809.449718] wireguard: wg0: Receiving handshake initiation
        from peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:34 omega kernel: [178809.449721] wireguard: wg0:
        Sending handshake response to peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:34 omega kernel: [178809.450130] wireguard: wg0:
        Keypair 32179 destroyed for peer 10<br>
        Oct  9 16:45:34 omega kernel: [178809.450131] wireguard: wg0:
        Keypair 32180 created for peer 10<br>
        Oct  9 16:45:39 omega kernel: [178814.519668] wireguard: wg0:
        Receiving handshake initiation from peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:39 omega kernel: [178814.519671] wireguard: wg0:
        Sending handshake response to peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:39 omega kernel: [178814.520062] wireguard: wg0:
        Keypair 32180 destroyed for peer 10<br>
        Oct  9 16:45:39 omega kernel: [178814.520063] wireguard: wg0:
        Keypair 32181 created for peer 10<br>
        Oct  9 16:45:44 omega kernel: [178819.579701] wireguard: wg0:
        Receiving handshake initiation from peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:44 omega kernel: [178819.579704] wireguard: wg0:
        Sending handshake response to peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:44 omega kernel: [178819.580094] wireguard: wg0:
        Keypair 32181 destroyed for peer 10<br>
        Oct  9 16:45:44 omega kernel: [178819.580095] wireguard: wg0:
        Keypair 32182 created for peer 10<br>
        Oct  9 16:45:50 omega kernel: [178824.910142] wireguard: wg0:
        Receiving handshake initiation from peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:50 omega kernel: [178824.910145] wireguard: wg0:
        Sending handshake response to peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:50 omega kernel: [178824.910535] wireguard: wg0:
        Keypair 32182 destroyed for peer 10<br>
        Oct  9 16:45:50 omega kernel: [178824.910536] wireguard: wg0:
        Keypair 32183 created for peer 10<br>
        Oct  9 16:45:55 omega kernel: [178829.950001] wireguard: wg0:
        Receiving handshake initiation from peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:55 omega kernel: [178829.950003] wireguard: wg0:
        Sending handshake response to peer 10 (x.169.86.x:22300)<br>
        Oct  9 16:45:55 omega kernel: [178829.950406] wireguard: wg0:
        Keypair 32183 destroyed for peer 10<br>
        Oct  9 16:45:55 omega kernel: [178829.950407] wireguard: wg0:
        Keypair 32184 created for peer 10<br>
      </font></p>
    <p><font face="Verdana">Port on the server is open (since the 4G
        test works). We can reach the 22300 port on his side. Checked
        the pub/private keys as well.</font></p>
    <p><font face="Verdana">wg show on server:</font></p>
    <p><font face="Verdana">interface: wg0<br>
          public key: &lt;pubkey server&gt;<br>
          private key: (hidden)<br>
          listening port: 51820<br>
        <br>
        peer: &lt;pubkey of mobile&gt;<br>
          endpoint: x.200.39.x:8971<br>
          allowed ips: 0.0.0.0/0<br>
          latest handshake: 8 hours, 1 minute, 43 seconds ago<br>
          transfer: 384.24 KiB received, 2.74 MiB sent<br>
        <br>
        peer: &lt;pubkey of dd-wrt&gt;<br>
          endpoint: x.169.86.x:22300<br>
          allowed ips: 192.168.1.0/24, 10.100.0.3/32<br>
          transfer: 2.00 MiB received, 1.24 MiB sent</font></p>
    <p><font face="Verdana">On DD-wrt router:</font></p>
    <p><font face="Verdana">interface: oet1<br>
          public key: &lt;pubkey dd-wrt&gt;<br>
          private key: (hidden)<br>
          listening port: 22300<br>
        <br>
        peer: &lt;pubkey of server&gt;<br>
          endpoint: x.197.199.x:51820<br>
          allowed ips: 0.0.0.0/0<br>
          transfer: 0 B received, 777.43 KiB sent<br>
          persistent keepalive: every 25 seconds<br>
      </font></p>
    <p><font face="Verdana">We are trying to get logging to work on that
        DD-wrt box, that should contain some more clues but maybe any of
        you have an idea?</font></p>
    <p><font face="Verdana">Cheers,</font></p>
    <p><font face="Verdana">Dennis<br>
      </font></p>
    <p><font face="Verdana"><br>
      </font></p>
  </body>
</html>

--------------8FB80E47AD56FA148F497362--

--===============3339068130613336475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3339068130613336475==--
