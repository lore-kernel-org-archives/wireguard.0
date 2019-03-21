Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99ACC10F03
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:00:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6990C213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=anatoli.ws header.i=@anatoli.ws header.b="qk0lrXkA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6990C213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f8863e9;
	Fri, 22 Mar 2019 23:59:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 212cd015
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 06:07:29 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98506c7e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 06:07:29 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id D31A21E0016A
 for <wireguard@lists.zx2c4.com>; Thu, 21 Mar 2019 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=5s7aopj1ad; t=1553148471;
 bh=HPuHZS2AJnrOPxq664XCVjtKAOuYa8vhni2lfsEQ+PM=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=qk0lrXkAe3qI74NURLm1L620iiku33zzTZWz8N7fnMEiYur6yD3krtJhRRpCVMMJU
 Os8TLyjaa4FYPfg1+hgwaK+Oujv/d3mNy2///aIIxaRUb4UXTpAWmHt7qySNeel/xW
 dxdWCMCqaQtoiXMiD2I8Cik1ocJTG/XeMltGOoOzU2axn7CKfliwOjxGvA2EDXeETQ
 UDwgnA//Y41lvuMe8KGyQ+revMVDWlWsDPH6BxornUlAq3N4RJvZOpxlKqXQjJyh1P
 uV/dJfjUPlTul8hpO5ex7Lf8Rh7eXtFO8DMJu+nOldGhDDKn1laxVhgn/8E3o7AI1u
 qRNIMmArvk71Q==
Subject: Re: VPN - excluding local IPs
To: wireguard@lists.zx2c4.com
References: <18914224.dsVBvaN9Bx@bot>
From: Anatoli <me@anatoli.ws>
Message-ID: <0e8f7579-de29-e847-0431-3c6fb32b05bb@anatoli.ws>
Date: Thu, 21 Mar 2019 03:07:49 -0300
Mime-Version: 1.0
In-Reply-To: <18914224.dsVBvaN9Bx@bot>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 Mar 2019 00:59:46 +0100
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
Content-Type: multipart/mixed; boundary="===============7520632225990841494=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============7520632225990841494==
Content-Type: multipart/alternative;
 boundary="------------11CD60B0B7BBAD20F68AC567"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------11CD60B0B7BBAD20F68AC567
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Andreas,

Check the Table option here: 
https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8.

wg-quick adds some routes and rules, you can see them with: ip rule show 
(check the line containing fwmark, it ends with the routing table 
number) and then check the routes in the corresponding table with: ip 
route show table xxx. Basically, if you omit the Table option, wg-quick 
will add the necessary routes to send all traffic via the tunnel when 
you specify AllowedIPs = 0.0.0.0/0. You can add routes to your local 
networks/devices for connections to them to go outside the tunnel in the 
PostUp option in the wg-quick config.

Regards,
Anatoli

*From:* Andreas Hatzl <andreas@hatzl.org>
*Sent:* Thursday, February 21, 2019 12:08
*To:* Wireguard Mailing List <wireguard@lists.zx2c4.com>
*Subject:* VPN - excluding local IPs

Hi,

I have successfully set up a wireguard VPN between my notebook (Manjaro behind
NAT) and my virtual server (ubuntu 18.04). The only "issue" left is that I
can't connect to local devices on the client while using wireguard. Is there a
way to exclude an IP range from using wireguard?

my client config:
[Interface]
Address = 10.x.y.z/32
PrivateKey = xyz

[Peer]
PublicKey =xyz
Endpoint = xyz:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 21

I am aware that the solution for this has most likely been posted a lot of
times but I can't find anything on the Wireguard page or Google.

It would be great if somebody could help me with this.

Thanks

Andreas


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard



--------------11CD60B0B7BBAD20F68AC567
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body smarttemplateinserted="true">
    <div id="smartTemplate4-quoteHeader">
      <div style="font-size:10.0pt;font-family:Verdana,Arial">Andreas,<br>
        <br>
        Check the <font face="Courier New">Table</font> option here:
        <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8">https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8</a>.<br>
        <br>
        wg-quick adds some routes and rules, you can see them with: <font
          face="Courier New">ip rule show</font> (check the line
        containing <font face="Courier New">fwmark</font>, it ends with
        the routing table number) and then check the routes in the
        corresponding table with: <font face="Courier New">ip route
          show table xxx</font>. Basically, if you omit the <font
          face="Courier New">Table</font> option, wg-quick will add the
        necessary routes to send all traffic via the tunnel when you
        specify <font face="Courier New">AllowedIPs = 0.0.0.0/0</font>.
        You can add routes to your local networks/devices for
        connections to them to go outside the tunnel in the <font
          face="Courier New">PostUp</font> option in the wg-quick
        config.<br>
        <br>
        Regards,<br>
        Anatoli<br>
        <br>
      </div>
      <div style="border:none;border-top:solid #B5C4DF
        1.0pt;padding:3.0pt 0cm 0cm
0cm;font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"><b>From:</b>
        Andreas Hatzl <a class="moz-txt-link-rfc2396E" href="mailto:andreas@hatzl.org">&lt;andreas@hatzl.org&gt;</a><br>
        <b>Sent:</b> Thursday, February 21, 2019 12:08<br>
        <b>To:</b> Wireguard Mailing List
        <a class="moz-txt-link-rfc2396E" href="mailto:wireguard@lists.zx2c4.com">&lt;wireguard@lists.zx2c4.com&gt;</a><br>
        <b>Subject:</b> VPN - excluding local IPs<br>
      </div>
      <br>
    </div>
    <div class="replaced-blockquote" cite="mid:18914224.dsVBvaN9Bx@bot"
      type="cite">
      <pre class="moz-quote-pre" wrap="">Hi,

I have successfully set up a wireguard VPN between my notebook (Manjaro behind 
NAT) and my virtual server (ubuntu 18.04). The only "issue" left is that I 
can't connect to local devices on the client while using wireguard. Is there a 
way to exclude an IP range from using wireguard? 

my client config:
[Interface]
Address = 10.x.y.z/32
PrivateKey = xyz

[Peer]
PublicKey =xyz
Endpoint = xyz:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 21

I am aware that the solution for this has most likely been posted a lot of 
times but I can't find anything on the Wireguard page or Google.

It would be great if somebody could help me with this.

Thanks

Andreas


_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </div>
    <br>
  </body>
</html>

--------------11CD60B0B7BBAD20F68AC567--

--===============7520632225990841494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7520632225990841494==--
