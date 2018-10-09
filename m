Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5974EECDE48
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 16:29:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C86E214C5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 16:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="Co/RyF9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C86E214C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8d425e8;
	Tue, 9 Oct 2018 16:28:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a277cf7
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 16:28:35 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6944faf
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=IbejHylG/Y61WEmioNEDvdv+slqIb4hWyyhIdPlP47w=; 
 b=Co/RyF9PGt+JDAdb5LaTn12xYgo18FNoEf69HMU94DBdc8oixOBhEZ3AJ8HSFdOtfrXXewxaxoGOUq+6LuBiZlKTvyZkv8DTUOmvogV6FoxOaN2fH4pHCxvekahzRsAdE/gmTJoPnm/AqDnx0mX1GYUwHzr5CwPbYLp+/Egl/dA=;
Subject: Re: Wireguard not coming up on DD-wrt
To: wireguard@lists.zx2c4.com, dennis_20@yahoo.com
References: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
Date: Tue, 9 Oct 2018 18:29:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
X-Received: from [212.111.244.1] (helo=[172.29.0.186])
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1g9usy-0003MX-KD; Tue, 09 Oct 2018 18:29:28 +0200
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
Content-Type: multipart/mixed; boundary="===============4145848720555345614=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============4145848720555345614==
Content-Type: multipart/alternative;
 boundary="------------1CFF7A43704DE736B7FCBBEE"

This is a multi-part message in MIME format.
--------------1CFF7A43704DE736B7FCBBEE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

just to make sure. since i'm updating wireguard in dd-wrt very often to 
the latest state of art code from git. which dd-wrt version did you use 
for establishing the connection?

did you also take care about usual firewall problems? by default the the 
firewall is closed on wan, so no inbound connection is possible


Sebastian

Am 09.10.2018 um 17:06 schrieb Dennis van J.:
>
> Hi all,
>
> I have setup Wireguard on a Gentoo box, compiled it into the kernel 
> using instructions on the wireguard website. Got my mobile to connect 
> using 4G to this box fine, so I wanted to test further with a friend 
> of mine who has a DD-wrt installation on his router. Wireguard is 
> integrated into the DD-wrt build, we set it up, but the tunnel does 
> not come up. On the server I only see this:
>
> Oct  9 16:45:34 omega kernel: [178809.449718] wireguard: wg0: 
> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
> Oct  9 16:45:34 omega kernel: [178809.449721] wireguard: wg0: Sending 
> handshake response to peer 10 (x.169.86.x:22300)
> Oct  9 16:45:34 omega kernel: [178809.450130] wireguard: wg0: Keypair 
> 32179 destroyed for peer 10
> Oct  9 16:45:34 omega kernel: [178809.450131] wireguard: wg0: Keypair 
> 32180 created for peer 10
> Oct  9 16:45:39 omega kernel: [178814.519668] wireguard: wg0: 
> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
> Oct  9 16:45:39 omega kernel: [178814.519671] wireguard: wg0: Sending 
> handshake response to peer 10 (x.169.86.x:22300)
> Oct  9 16:45:39 omega kernel: [178814.520062] wireguard: wg0: Keypair 
> 32180 destroyed for peer 10
> Oct  9 16:45:39 omega kernel: [178814.520063] wireguard: wg0: Keypair 
> 32181 created for peer 10
> Oct  9 16:45:44 omega kernel: [178819.579701] wireguard: wg0: 
> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
> Oct  9 16:45:44 omega kernel: [178819.579704] wireguard: wg0: Sending 
> handshake response to peer 10 (x.169.86.x:22300)
> Oct  9 16:45:44 omega kernel: [178819.580094] wireguard: wg0: Keypair 
> 32181 destroyed for peer 10
> Oct  9 16:45:44 omega kernel: [178819.580095] wireguard: wg0: Keypair 
> 32182 created for peer 10
> Oct  9 16:45:50 omega kernel: [178824.910142] wireguard: wg0: 
> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
> Oct  9 16:45:50 omega kernel: [178824.910145] wireguard: wg0: Sending 
> handshake response to peer 10 (x.169.86.x:22300)
> Oct  9 16:45:50 omega kernel: [178824.910535] wireguard: wg0: Keypair 
> 32182 destroyed for peer 10
> Oct  9 16:45:50 omega kernel: [178824.910536] wireguard: wg0: Keypair 
> 32183 created for peer 10
> Oct  9 16:45:55 omega kernel: [178829.950001] wireguard: wg0: 
> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
> Oct  9 16:45:55 omega kernel: [178829.950003] wireguard: wg0: Sending 
> handshake response to peer 10 (x.169.86.x:22300)
> Oct  9 16:45:55 omega kernel: [178829.950406] wireguard: wg0: Keypair 
> 32183 destroyed for peer 10
> Oct  9 16:45:55 omega kernel: [178829.950407] wireguard: wg0: Keypair 
> 32184 created for peer 10
>
> Port on the server is open (since the 4G test works). We can reach the 
> 22300 port on his side. Checked the pub/private keys as well.
>
> wg show on server:
>
> interface: wg0
>   public key: <pubkey server>
>   private key: (hidden)
>   listening port: 51820
>
> peer: <pubkey of mobile>
>   endpoint: x.200.39.x:8971
>   allowed ips: 0.0.0.0/0
>   latest handshake: 8 hours, 1 minute, 43 seconds ago
>   transfer: 384.24 KiB received, 2.74 MiB sent
>
> peer: <pubkey of dd-wrt>
>   endpoint: x.169.86.x:22300
>   allowed ips: 192.168.1.0/24, 10.100.0.3/32
>   transfer: 2.00 MiB received, 1.24 MiB sent
>
> On DD-wrt router:
>
> interface: oet1
>   public key: <pubkey dd-wrt>
>   private key: (hidden)
>   listening port: 22300
>
> peer: <pubkey of server>
>   endpoint: x.197.199.x:51820
>   allowed ips: 0.0.0.0/0
>   transfer: 0 B received, 777.43 KiB sent
>   persistent keepalive: every 25 seconds
>
> We are trying to get logging to work on that DD-wrt box, that should 
> contain some more clues but maybe any of you have an idea?
>
> Cheers,
>
> Dennis
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------1CFF7A43704DE736B7FCBBEE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>just to make sure. since i'm updating wireguard in dd-wrt very
      often to the latest state of art code from git. which dd-wrt
      version did you use for establishing the connection?</p>
    <p>did you also take care about usual firewall problems? by default
      the the firewall is closed on wan, so no inbound connection is
      possible</p>
    <p><br>
    </p>
    <p>Sebastian<br>
    </p>
    <div class="moz-cite-prefix">Am 09.10.2018 um 17:06 schrieb Dennis
      van J.:<br>
    </div>
    <blockquote type="cite"
      cite="mid:163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p><font face="Verdana">Hi all,</font></p>
      <p><font face="Verdana">I have setup Wireguard on a Gentoo box,
          compiled it into the kernel using instructions on the
          wireguard website. Got my mobile to connect using 4G to this
          box fine, so I wanted to test further with a friend of mine
          who has a DD-wrt installation on his router. Wireguard is
          integrated into the DD-wrt build, we set it up, but the tunnel
          does not come up. On the server I only see this:</font></p>
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
      <p><font face="Verdana">We are trying to get logging to work on
          that DD-wrt box, that should contain some more clues but maybe
          any of you have an idea?</font></p>
      <p><font face="Verdana">Cheers,</font></p>
      <p><font face="Verdana">Dennis<br>
        </font></p>
      <p><font face="Verdana"><br>
        </font></p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
  </body>
</html>

--------------1CFF7A43704DE736B7FCBBEE--

--===============4145848720555345614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4145848720555345614==--
