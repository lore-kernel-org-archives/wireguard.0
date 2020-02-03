Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4767C35247
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 18:03:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D7D20721
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 18:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlPH2k4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D7D20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf0498fd;
	Mon, 3 Feb 2020 18:03:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9e5573b
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:03:02 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01686c1e
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:03:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id t23so304719wmi.1
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 10:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=c6g2TJ2MPXKobJ430cJorC9ZNY2QybJ/NAurfjUrzAY=;
 b=GlPH2k4BMLy66MsYwgecl4TRn43LFR1EPQLTTM47WL2A68TLYuHHY3a5b8knVZbkXe
 zI8pwmm7XZVC9iqCdOH4fCN1svCrG+3Ynir2ClfruwmQf6CyaraYQ7IkG7Bc2ZlOcmSm
 nuLlPh++pm9hH8qXh81opP33QJwQeRSjtojPv4EqY2Ob+TP/q64Es+J90KvcpyN3EmLv
 SnSlPGc6rJDsfRw2SQNfvwX+WZyY4sJXLNDXDIwjnxilDhGR6mZV5UMr9yJ6bvTmEm58
 6Alixz0G9/EPCv/X/ynTEUElJATURAbOB5q3mlh7LQQ4N5OkSmUat2w1MfdkL6cUlfVE
 Nm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=c6g2TJ2MPXKobJ430cJorC9ZNY2QybJ/NAurfjUrzAY=;
 b=VAu5RqZQyMjQrSpLztR1uzq+wI1QRjf4QU/1yLMktZXr2VOmiFGsPZtJSDK4qCOALt
 AOPVj1j2B6r/gSvq1xBAMHGgK7Pd0Lai2A1Ct4ORoO5BdUQvf4rywPN49BGpgEz5BRCV
 n4HTeYVyHA/Gvh8L9buWYq7uOOFJYfl+an4A/OkOfCNqyWlZ3KLUJXhOf5XywUwRCg6s
 UHijSW9hVItBuZdl8lKN6FUZo6zhvIGynr2vM4xD49rwHLRyD0YuFT5hQNFvz9inVuq4
 cKCxZakkJpRGPzPQVdxTuo/+rxxTwtPglccxoFXQ4vhP2ZF5mCLV3Aj/cBDVj/+3wt9e
 l4nQ==
X-Gm-Message-State: APjAAAV1qr6W150TFdeZTFLBhm21v6+8q8z2g00BYmfQgaawYS6ukI6L
 eHgAtxQlYab3BMT6WbZcG1z6Kjo0RRQ=
X-Google-Smtp-Source: APXvYqzO72FCZv590Xv5w3iOKwDEtkICIMCqpw7iFWxbR+X/cNXIamCtdapvvTSlB0A8KpGgXBOZ3Q==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr276083wmj.36.1580753022493;
 Mon, 03 Feb 2020 10:03:42 -0800 (PST)
Received: from [0.0.0.0] (tor-exit-12.zbau.f3netze.de. [185.220.100.251])
 by smtp.gmail.com with ESMTPSA id j5sm17227210wrb.33.2020.02.03.10.03.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Feb 2020 10:03:42 -0800 (PST)
Subject: Re: Buggy MTU with Wireguard (attached pcapng)
To: alpha_one_x86 <alpha_one_x86@first-world.info>, wireguard@lists.zx2c4.com
References: <1a0f7114-37dc-64e5-fded-03863c98add5@first-world.info>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <139c80c5-64f4-217a-f08c-e612e0591b85@gmail.com>
Date: Mon, 3 Feb 2020 21:04:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1a0f7114-37dc-64e5-fded-03863c98add5@first-world.info>
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
Content-Type: multipart/mixed; boundary="===============2244731650671647244=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============2244731650671647244==
Content-Type: multipart/alternative;
 boundary="------------CD4874B405F2577CBE0EA652"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CD4874B405F2577CBE0EA652
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The TCP connection MSS is set to 1460 bytes and also Don't fragment flag 
is set. The server selects this MSS as a frame size on its side and 
packet is dropped, probably. If you are using linux router try to use 
this command "iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j 
TCPMSS --clamp-mss-to-pmtu" or be careful to set MTU on all client 
machines adapters correctly.


On 10.01.2020 1:05, alpha_one_x86 wrote:
>
> Hi,
>
> I have wireguard interface "veth", and my real interface "eth0".
>
> No bug with openvpn, but with wireguard on IPv4 for https, I have bug, 
> see the attached file, the returned data is 3300byte, then Destination 
> unreachable (Fragmentation needed).
>
> Bug into wireguard? How fix this?
>
> The ok.pcapng it's same https download do with openvpn.
>
> Cheers,
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------CD4874B405F2577CBE0EA652
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>The TCP connection MSS is set to 1460 bytes and also Don't
      fragment flag is set. The server selects this MSS as a frame size
      on its side and packet is dropped, probably. If you are using
      linux router try to use this command "iptables -I FORWARD -p tcp
      --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu" or be
      careful to set MTU on all client machines adapters correctly.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10.01.2020 1:05, alpha_one_x86
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1a0f7114-37dc-64e5-fded-03863c98add5@first-world.info">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <p><font face="Helvetica, Arial, sans-serif">Hi,</font></p>
      <p><font face="Helvetica, Arial, sans-serif">I have wireguard
          interface "veth", and my real interface "eth0".</font></p>
      <p><font face="Helvetica, Arial, sans-serif">No bug with openvpn,
          but with wireguard on IPv4 for https, I have bug, see the
          attached file, the returned data is 3300byte, then Destination
          unreachable (Fragmentation needed).</font></p>
      <p><font face="Helvetica, Arial, sans-serif">Bug into wireguard?
          How fix this?</font></p>
      <p><font face="Helvetica, Arial, sans-serif">The ok.pcapng it's
          same https download do with openvpn.<br>
        </font></p>
      <font face="Helvetica, Arial, sans-serif">Cheers,</font> <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CD4874B405F2577CBE0EA652--

--===============2244731650671647244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2244731650671647244==--
