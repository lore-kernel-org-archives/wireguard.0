Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa5ee009
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 04:40:13 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6259aac5
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 04:40:12 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fWDw3-000K83-ML
 for wireguard@lists.zx2c4.com; Fri, 22 Jun 2018 06:44:36 +0200
Subject: Re: Future changes in crypto algorithms
To: wireguard@lists.zx2c4.com
References: <CAEP1ZN=6aqe3B1sJNhDfB5c86emK+Gk2YJ9d-GaVVYuRzeXYGA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <04238df1-db3d-66b3-32ca-c2ca7cb655ec@urlichs.de>
Date: Fri, 22 Jun 2018 06:44:34 +0200
MIME-Version: 1.0
In-Reply-To: <CAEP1ZN=6aqe3B1sJNhDfB5c86emK+Gk2YJ9d-GaVVYuRzeXYGA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------72AF8F21982B2E05E1B7EB65"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------72AF8F21982B2E05E1B7EB65
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 18.06.2018 14:08, Vivien Malerba wrote:
> However, for any organization which will use WireGuard, even if admins
> are very effective at applying updates, updating all the endpoint
> systems simultaneously is not realistic. At the same time, it may be
> the case that the organization can't afford the downtime, in which
> case using WireGuard will simply not be an option, which is too bad.

Fixing any crypto weakness will require kernel updates and configuration
changes. A very easy config change, compared to all the other work you'd
have to do if a flaw is discovered that forces a different crypto
algorithm, is "use a second WG instance with a different UDP port".

A script that monitors connections to the new WG instance and
auto-disables the associated peer keys in the old instance is easy
enough to write.

Problem solved, no downgrade attack possible.

-- 
-- Matthias Urlichs


--------------72AF8F21982B2E05E1B7EB65
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 18.06.2018 14:08, Vivien Malerba
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEP1ZN=6aqe3B1sJNhDfB5c86emK+Gk2YJ9d-GaVVYuRzeXYGA@mail.gmail.com">
      <div class="gmail_default"
        style="font-family:arial,helvetica,sans-serif">However, for any
        organization which will use WireGuard, even if admins are very
        effective at applying updates, updating all the endpoint systems
        simultaneously is not realistic. At the same time, it may be the
        case that the organization can't afford the downtime, in which
        case using WireGuard will simply not be an option, which is too
        bad.</div>
    </blockquote>
    <p>Fixing any crypto weakness will require kernel updates and
      configuration changes. A very easy config change, compared to all
      the other work you'd have to do if a flaw is discovered that
      forces a different crypto algorithm, is "use a second WG instance
      with a different UDP port".</p>
    <p>A script that monitors connections to the new WG instance and
      auto-disables the associated peer keys in the old instance is easy
      enough to write.</p>
    <p>Problem solved, no downgrade attack possible.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
-- Matthias Urlichs</pre>
  </body>
</html>

--------------72AF8F21982B2E05E1B7EB65--
