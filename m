Return-Path: <SRS0=JYHX=XY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2A1C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 20:47:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD4ED20863
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 20:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="daoEgc7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD4ED20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d02efd3;
	Sun, 29 Sep 2019 20:46:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c08c9ab5
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 20:46:48 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59888686
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 20:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=MIME-Version:Date:Message-ID:From:To:Subject
 :content-disposition:content-transfer-encoding;
 bh=5bilebTslrQDtl6GDg+IBGkuM/N8mDmO9zNBkl0Yu70=; b=daoEgc7Df7aagT5Gj7077k1FUY
 /shDtSrXWGHKyg9ANToed4VGqep/P6kJFncjRgkOz1bZfGI8XnN9u+kIzBU87hnjnjaHed4KsYdN9
 l6dMrguKXAQHlychEqnUpcya6dd4IeZ7N1CUVvb2uG88vO8hU8LJMDUE35/Vk9IoG4q9MbMn0ylE2
 pqaD4/ukbtHVSCjKlDN8WeLIACii7Jto42TxCKhusSwaDeOCKBA68sOyejR1rF8FV8gQf32ggOvpk
 dva9MS74NIQufmE5PSvZMf2Ef5LBf+f4iE2oIJjwDhmiWs4ErWnxGibMDNFSHOj0Qo6RoRy4vujEk
 k/gchYwoDjPtv8wmUJiu6llpOTvNWZHn4damP+cwACfoRSITQrSTJu/P93VC27Jv+bqVUbgTVsZWg
 lDfVjoNccyLpAug5CNpeUm02xTZfY5WE65HvYNSqVDDO79DbjtebfjFl2r/8UWgauwYWlY1IziH6D
 I+KVznEgkYv1QgH7nt9uqXpQ/Q2qUAoYWedrokCswDl2prkPKCtuH3/FIGg/kRx+sojMvsfaNpTlc
 lYiJs8WbGQkhoRridbZ+RDfE/OQaPHITgUKqJRIbMIwTD4IUnaRZMuow7VfmOAm7TI+Q6qcwFWti+
 aYAY3AKhUCAf10/RBtk21G0Bxkl6ElarGnPXL4TDY=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1iEg5b-0003u8-Bg
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Sun, 29 Sep 2019 22:46:45 +0200
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
To: wireguard@lists.zx2c4.com
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
 <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
 <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <38ff6ee6-a78d-24d7-d338-48bc932ff4d0@bartschnet.de>
Date: Sun, 29 Sep 2019 22:46:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
Content-Language: en-US
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
Content-Type: multipart/mixed; boundary="===============3609756869220906085=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============3609756869220906085==
Content-Type: multipart/alternative;
 boundary="------------0967D898E15FCD4581ACC80D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0967D898E15FCD4581ACC80D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

What happens if the DNS-lookup fails (e.g broken or manipulated DNS)?
In my opinion it should be possible to work with static IPv6 addresses 
and fall back to static IPv4 addresses.

Regards,

Renne


Am 29.09.19 um 21:31 schrieb Henning Reich:
> Should a DNS entry Wirth one
> AAAA record and one A record solve thus problem? So the OS decide the 
> best way to connect?
>
> Ulrich Kalloch <ulli@noc23.de <mailto:ulli@noc23.de>> schrieb am So., 
> 29. Sep. 2019, 16:29:
>
>     Hello @ all
>
>     i am interested in this too.
>
>     Regards
>
>     Ulli
>
>     Am 27.05.19 um 20:10 schrieb Rene 'Renne' Bartsch, B.Sc. Informatics:
>     > Hi,
>     >
>     > is it meanwhile possible to define an IPv6 endpoint AND and an IPv4
>     > endpoint as fallback
>     > in case a road warrior does not get IPv6 connectivity when switching
>     > internet sockets?
>     >
>     > Regards,
>     >
>     > Renne
>     > _______________________________________________
>     > WireGuard mailing list
>     > WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>     _______________________________________________
>     WireGuard mailing list
>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------0967D898E15FCD4581ACC80D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    What happens if the DNS-lookup fails (e.g broken or manipulated
    DNS)?<br>
    In my opinion it should be possible to work with static IPv6
    addresses and fall back to static IPv4 addresses.<br>
    <br>
    Regards,<br>
    <br>
    Renne
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 29.09.19 um 21:31 schrieb Henning
      Reich:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Should a DNS entry Wirth one
        <div dir="auto">AAAA record and one A record solve thus problem?
          So the OS decide the best way to connect?</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">Ulrich Kalloch &lt;<a
            href="mailto:ulli@noc23.de" moz-do-not-send="true">ulli@noc23.de</a>&gt;
          schrieb am So., 29. Sep. 2019, 16:29:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello @ all<br>
          <br>
          i am interested in this too.<br>
          <br>
          Regards<br>
          <br>
          Ulli<br>
          <br>
          Am 27.05.19 um 20:10 schrieb Rene 'Renne' Bartsch, B.Sc.
          Informatics:<br>
          &gt; Hi,<br>
          &gt;<br>
          &gt; is it meanwhile possible to define an IPv6 endpoint AND
          and an IPv4<br>
          &gt; endpoint as fallback<br>
          &gt; in case a road warrior does not get IPv6 connectivity
          when switching<br>
          &gt; internet sockets?<br>
          &gt;<br>
          &gt; Regards,<br>
          &gt;<br>
          &gt; Renne<br>
          &gt; _______________________________________________<br>
          &gt; WireGuard mailing list<br>
          &gt; <a href="mailto:WireGuard@lists.zx2c4.com"
            target="_blank" rel="noreferrer" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
          &gt; <a
            href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
            rel="noreferrer noreferrer" target="_blank"
            moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
          <br>
          <br>
          _______________________________________________<br>
          WireGuard mailing list<br>
          <a href="mailto:WireGuard@lists.zx2c4.com" target="_blank"
            rel="noreferrer" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
          <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
            rel="noreferrer noreferrer" target="_blank"
            moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
        </blockquote>
      </div>
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

--------------0967D898E15FCD4581ACC80D--

--===============3609756869220906085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3609756869220906085==--
