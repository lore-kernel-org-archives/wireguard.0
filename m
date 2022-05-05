Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B56C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 May 2022 20:20:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 128cf155;
	Thu, 5 May 2022 20:17:42 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b2ef1662
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 May 2022 20:17:41 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 70FC32058C
 for <wireguard@lists.zx2c4.com>; Thu,  5 May 2022 22:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1651781856;
 bh=sp7g5rei3ncTI2NcDfKwi7VaB98e2wAl9Qa080Di0Jo=;
 h=From:To:Subject:Date:From;
 b=oGD3Tr5fCC35h/8Mh4WdjMaDZK9LyBQqVD4jna5/SRlSa5lH5cNuqXMNjGr1xsKHb
 IwF2ls9U5oHIzUBkbQuWs0frrqGUTxaBgDJME3OT1YVBxLNsYXlzJ1+6vwMWCXRAmw
 L7Wr/GDV0jiv4uFAN15bwNlCFBgd3JWbanaunU5XjHvHgrGiAbNcXPgTxcHSvYI3iB
 jBgki1oPGfsF9yaxqnDiAB6dAex/25Tcw9huj+lsKA+TAutRh/9CcAqHj/D7gGA7Hp
 Xbm/4KwLrWge58Jv7cD3dyRABddAZqeaJv4ff/o3a5PIpZ/pZcdnPW8N4HGTVazzwz
 I0QlWpTIIQF3Q==
Received: by blind.localdomain (Postfix, from userid 1000)
 id DD29A13A0C80; Thu,  5 May 2022 22:17:40 +0200 (CEST)
User-agent: mu4e 1.7.13; emacs 28.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Why is the src_valid_mark needed and not allowed (in kubernetes)?
Date: Thu, 05 May 2022 22:01:24 +0200
Message-ID: <87o80b7mzf.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Hello again,

while debugging wireguard in Kubernetes, we noticed that adding a
default route for IPv4 is not possible/allowed, wg-quick fails with:

        sysctl: error setting key 'net.ipv4.conf.all.src_valid_mark': Read-only file system

Which can be traced back to:

        [[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1

inside the

       add_default() {

function of wg-quick. If one tries to escape this using a pod
specification to set the sysctl using

    spec:
       securityContext:
         sysctls:
           - name: net.ipv4.conf.all.src_valid_mark
             value: "1"

Kubernetes by default disallows it and returns a "SysctlForbidden"
error.

Now, one can easily "fool" wg-quick using

    AllowedIPs = 0.0.0.0/1, 128.0.0.0/1

instead of

    AllowedIPs = 0.0.0.0/0

which makes the container work w/o the sysctl, as the add_default()
function is not called. Running it like this in kubernetes results in:

+ wg show
interface: ipv4
  public key: HV9IgFLPSHJgG4jbDzaJg97Uch3eebrV5we4wUkAcUg=
  private key: (hidden)
  listening port: 51828

peer: 6BRnQ+dmeFzVCH9RbM1pbJ7u3y3qrl+zUzzYCmC88kE=
  endpoint: [2a0a:e5c0:2:2:0:84ff:fe41:f265]:51820
  allowed ips: 0.0.0.0/1, 128.0.0.0/1

And allows outside IPv4 communication within an IPv6 only kubernetes
cluster, which was the objective in the first place.

My questions:

   - Why is net.ipv4.conf.all.src_valid_mark needed?
   - And why does working around using 0.0.0.0/1, 128.0.0.0/1 works /
     what is the drawback of this?

Best regards and a good evening from container land,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
