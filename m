Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05DBC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 08:37:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C332075C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 08:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C332075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=powerneth.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ef1a9e3;
	Sun, 17 Feb 2019 08:28:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99d578cf
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 08:28:44 +0000 (UTC)
Received: from mail.insteeldesign.ro (mail.crimel.ro [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 122b4752
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 08:28:43 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.88.115])
 by mail.insteeldesign.ro (Postfix) with ESMTPSA id 63DC522222CC
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 10:36:57 +0200 (EET)
Subject: Re: Load Balancing and policy routing with Wireguard
To: wireguard@lists.zx2c4.com
References: <s7r35rV6aqXJrq9tA0DjWLgyiS1fYwO_0gkBFyuyVK73vx5qN60gt2_1ZVRHnG6R3htZiBJOWZMz9wBmMLYP3Bz0SZYvNvIrhKLjkNbzTxI=@alexago.xyz>
From: Lucian Cristian <luci@powerneth.ro>
Message-ID: <c4bf6251-65b1-fe2a-ec8a-6b0eb8053cee@powerneth.ro>
Date: Sun, 17 Feb 2019 10:36:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <s7r35rV6aqXJrq9tA0DjWLgyiS1fYwO_0gkBFyuyVK73vx5qN60gt2_1ZVRHnG6R3htZiBJOWZMz9wBmMLYP3Bz0SZYvNvIrhKLjkNbzTxI=@alexago.xyz>
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
Content-Type: multipart/mixed; boundary="===============3960161583807355925=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============3960161583807355925==
Content-Type: multipart/alternative;
 boundary="------------D3B05E78930775E70D9AA757"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D3B05E78930775E70D9AA757
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.02.2019 11:20, Alexago wrote:
> Hi,
>
> actually I use on my router (OpenWRT) two OpenVPN connections and one 
> Wireguard connection (all VPN connections are client) over my WAN 
> connection (1Gbps/500Mbps) with 2 different VPN providers (Mullvad and 
> IVPN): for policy routing and load balancing, with these connections, 
> I use MWAN3 package.
>
> MWAN3 is useful to choose
>
>   * VPN connection based on source or destination address, port, for
>     example
>   * load balancing two or more VPN connections, based on source,
>     destination and port, for example
>
> Now I would like to switch my two OpenVPN connections to Wireguard, so 
> I would like to have three simultaneous Wireguard connections 
> (obviously with 3 different Wireguard servers).
>
> My problem is how to use simultaneous Wireguard connections (with 
> allowed ips =0.0.0.0/0) and to leave to external package (like MWAN3) 
> to choose routing policy and also load balancing.
>
> I tried to configure two Wireguard connections but only one of these 
> goes online, the other one is always offline: I think problem is 
> multiple "0.0.0.0/0" allowed IPs.
>
> Can you help me?
>
> Thanks
>
>
>
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

use another "server" port for the second vpn

Regards


--------------D3B05E78930775E70D9AA757
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 09.02.2019 11:20, Alexago wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:s7r35rV6aqXJrq9tA0DjWLgyiS1fYwO_0gkBFyuyVK73vx5qN60gt2_1ZVRHnG6R3htZiBJOWZMz9wBmMLYP3Bz0SZYvNvIrhKLjkNbzTxI=@alexago.xyz">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>Hi,<br>
      </div>
      <div><br>
      </div>
      <div>actually I use on my router (OpenWRT) two OpenVPN connections
        and one Wireguard connection (all VPN connections are client)
        over my WAN connection (1Gbps/500Mbps) with 2 different VPN
        providers (Mullvad and IVPN): for policy routing and load
        balancing, with these connections, I use MWAN3 package.<br>
      </div>
      <div><br>
      </div>
      <div>MWAN3 is useful to choose <br>
      </div>
      <ul>
        <li>VPN connection based on source or destination address, port,
          for example<br>
        </li>
        <li>load balancing two or more VPN connections, based on source,
          destination and port, for example<br>
        </li>
      </ul>
      <div>Now I would like to switch my two OpenVPN connections to
        Wireguard, so I would like to have three simultaneous Wireguard
        connections (obviously with 3 different Wireguard servers).<br>
      </div>
      <div><br>
      </div>
      <div>My problem is how to use simultaneous Wireguard connections
        (with allowed ips =0.0.0.0/0) and to leave to external package
        (like MWAN3) to choose routing policy and also load balancing.<br>
      </div>
      <div><br>
      </div>
      <div>I tried to configure two Wireguard connections but only one
        of these goes online, the other one is always offline: I think
        problem is multiple "0.0.0.0/0" allowed IPs.<br>
      </div>
      <div><br>
      </div>
      <div>Can you help me?<br>
      </div>
      <div><br>
      </div>
      <div>Thanks<br>
      </div>
      <div><br>
      </div>
      <div><br>
      </div>
      <div class="protonmail_signature_block">
        <div class="protonmail_signature_block-user
          protonmail_signature_block-empty"><br>
        </div>
        <div class="protonmail_signature_block-proton"><br>
        </div>
      </div>
      <div><br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>use another "server" port for the second vpn</p>
    <p>Regards<br>
    </p>
  </body>
</html>

--------------D3B05E78930775E70D9AA757--

--===============3960161583807355925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3960161583807355925==--
