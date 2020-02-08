Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103DFC35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:29:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B8E22522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B8E22522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pineview.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baa4792c;
	Sat, 8 Feb 2020 21:24:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d89206c
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 10:28:56 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d9799f8
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 10:28:55 +0000 (UTC)
Received: from HigherTime.local (HigherTime.pineview.net [203.33.246.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 9F298801A7;
 Sat,  8 Feb 2020 21:00:12 +1030 (ACDT)
Subject: Re: BGP over multiple wireguard vpn link
To: Roberto 007 <mikit77777@gmail.com>, wireguard@lists.zx2c4.com
References: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
From: Mike O'Connor <mike@pineview.net>
Autocrypt: addr=mike@pineview.net; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fdaeb8d6-4986-8997-db86-b8a2cd818188@pineview.net>
Date: Sat, 8 Feb 2020 21:00:12 +1030
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:24:08 +0100
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
Content-Type: multipart/mixed; boundary="===============4124487699343886565=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============4124487699343886565==
Content-Type: multipart/alternative;
 boundary="------------BAC928E214BC12BB1449D27E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BAC928E214BC12BB1449D27E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Miki

I'm doing basically what your talking about but with OSPF.

I do not use wg-quick, instead I configure the Wireguard in the network
interface file like /etc/network/interface on all the machines.

iface wg-p2p inet static
            address xxx.xxx.xxx/xxx
            pre-up ip link add $IFACE mtu 1500 type wireguard
            pre-up wg setconf $IFACE /etc/wireguard/$IFACE.conf
            post-down ip link del $IFACE

Central machines I'll list the allowed ip addresses from the individual
peers.

On the peers I'll have an allow all like
AllowedIPs = 0.0.0.0/0, ::/0

The allow all ip's on each peer does not add a route but does allow any
traffic to be sent to the central system.

From that point you can configure any dynamic routing system you want.

Mike


On 17/1/20 9:23 pm, Roberto 007 wrote:
> Hello Wireguard team,
>
> I would like to test multiple VPN links with BGP which is for
> controlling traffic.
> I have no problem to make BGP over multiple links but once I tried to
> ping then I found a problem because I cannot set Allowed-IPs 0.0.0.0/0
> <http://0.0.0.0/0> to all the wireguard links.
>
> My question is that this kind of configuration is not supported
> wireguard? 
>
> I could make it with IPSec without any issues.
>
> If you could give us some advice, it would be greatly appreciated.
>
> Thanks and best regards,
> Miki
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--------------BAC928E214BC12BB1449D27E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Miki</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I'm doing basically what your talking
      about but with OSPF.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I do not use wg-quick, instead I
      configure the Wireguard in the network interface file like
      /etc/network/interface on all the machines.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">iface wg-p2p inet static<br>
                  address xxx.xxx.xxx/xxx<br>
                  pre-up ip link add $IFACE mtu 1500 type wireguard<br>
                  pre-up wg setconf $IFACE /etc/wireguard/$IFACE.conf<br>
                  post-down ip link del $IFACE</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Central machines I'll list the allowed
      ip addresses from the individual peers.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On the peers I'll have an allow all
      like</div>
    <div class="moz-cite-prefix">AllowedIPs = 0.0.0.0/0, ::/0<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">The allow all ip's on each peer does
      not add a route but does allow any traffic to be sent to the
      central system.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">From that point you can configure any
      dynamic routing system you want.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Mike<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 17/1/20 9:23 pm, Roberto 007 wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hello Wireguard team,
        <div><br>
        </div>
        <div>I would like to test multiple VPN links with BGP which is
          for controlling traffic.</div>
        <div>I have no problem to make BGP over multiple links but once
          I tried to ping then I found a problem because I cannot set
          Allowed-IPs <a href="http://0.0.0.0/0" moz-do-not-send="true">0.0.0.0/0</a>
          to all the wireguard links.</div>
        <div><br>
        </div>
        <div>My question is that this kind of configuration is not
          supported wireguard? </div>
        <div><br>
        </div>
        <div>I could make it with IPSec without any issues.</div>
        <div><br>
        </div>
        <div>If you could give us some advice, it would be greatly
          appreciated.</div>
        <div><br>
        </div>
        <div>Thanks and best regards,</div>
        <div>Miki</div>
        <div><br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------BAC928E214BC12BB1449D27E--

--===============4124487699343886565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4124487699343886565==--
