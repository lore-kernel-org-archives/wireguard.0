Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59ECC28CF5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Jan 2022 15:02:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 93cc3b0c;
	Wed, 26 Jan 2022 15:02:52 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3e919521
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jan 2022 15:02:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=NwEQwggsnHWiBMz+hetrTfqswXZFTMa1IqMKPG4/fphEkOEIC75ZyY8eBAkoyPE8UjYBMfyJPipSEZxpKMJtGaCMgNEBNACIJglby3nvPv4jICEzj3OCzRucH+myf5VvCL7GP9VPVbFCYg86qKiDpNVi1bSvOmR2MphlC9fkKOcSuvf3x9SFLEGyYrxTHpBtsbVr2zxkS/VveXFkgHNcamxxL5ml3mkpJafTPI/JSEXOhr0Mbt6RuSnlq6rP+N8fEHKq8bLR+Yr8xDVcVMmRpBQjuXJ/4IXJF4o8++y5xKUCAl8C5ph+xEaydlqpxqvZa0VUEbHs2YKk0WHli9OZ1A==;
 s=purelymail3; d=msfjarvis.dev; v=1;
 bh=y4NUd2ujISuvqSwQgwVvukb5rvNOY/24GoZeFSvGGTw=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=QozrPhVRJY41oLTiOyozPWpl1vnX6smi9NaZp6bBdYphvSxAW0P9pHqYAMjgccHpuJkOPXwaByKCRyuafzxOgX5sXEc72KL8K9ei8eVqwNlks+916fn/d2k66EueTgQRoDW5oo9EHVK0aJ4lT6MGhoiaYtmQo0o3zH/tgtxU3xtA/qLoAy8+YeFX27TaKjqEFp+d7uMi6xtSwIux4oHOyddKug2ZlaGwYcWXWslvIU7V/nXRfzbiAftyvOIH51VH1zPe4qMdpwdWb+3qJAz5kJvmgRSSGed6CniJZzfvRaM5akWLqUdkHIAKdhobguif67B2s35sMFfSn2tEPGKiNw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=y4NUd2ujISuvqSwQgwVvukb5rvNOY/24GoZeFSvGGTw=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-141.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -176838933; Wed, 26 Jan 2022 15:02:36 +0000 (UTC)
Date: Wed, 26 Jan 2022 20:32:32 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Michal Murin <michal.murin@jamf.com>
Cc: "=?utf-8?Q?wireguard=40lists.zx2c4.com?=" <wireguard@lists.zx2c4.com>
Message-ID: <EDD252CD-C22D-4712-B891-E057026A6AA1@getmailspring.com>
In-Reply-To: <20220119082857.64215-1-michal.murin@jamf.com>
References: <20220119082857.64215-1-michal.murin@jamf.com>
Subject: Re: [PATCH] Fixed the failing BadConfigExceptionTest unit test
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


Hey Michal,

On Jan 19 2022, at 1:58 pm, Michal Murin <michal.murin@jamf.com> wrote:

> Fixed the test by changing the DNS to a string with an invalid char in
> the `invalid-value.conf` test configuration file. Also removed the
> `getParsingClass()` condition from the `parseDnsServers()` method as
> the condition can be never met - the `InetAddresses.parse(dnsServer)`
> method always throws the `ParseException` with the `parsingClass` set
> to `InetAddress.class`.
> ---
> tunnel/src/main/java/com/wireguard/config/Interface.java | 2 +-
> tunnel/src/test/resources/invalid-value.conf             | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tunnel/src/main/java/com/wireguard/config/Interface.java b/tunnel/src/main/java/com/wireguard/config/Interface.java
> index 694f313..5bd4da7 100644
> --- a/tunnel/src/main/java/com/wireguard/config/Interface.java
> +++ b/tunnel/src/main/java/com/wireguard/config/Interface.java
> @@ -356,7 +356,7 @@ public final class Interface {
>                     try {
>                         addDnsServer(InetAddresses.parse(dnsServer));
>                     } catch (final ParseException e) {
> -                        if (e.getParsingClass() != InetAddress.class
> || !InetAddresses.isHostname(dnsServer))
> +                        if (!InetAddresses.isHostname(dnsServer))
>                             throw e;
>                         addDnsSearchDomain(dnsServer);
>                     }
> diff --git a/tunnel/src/test/resources/invalid-value.conf b/tunnel/src/test/resources/invalid-value.conf
> index 2889111..6a1e3b6 100644
> --- a/tunnel/src/test/resources/invalid-value.conf
> +++ b/tunnel/src/test/resources/invalid-value.conf
> @@ -1,6 +1,6 @@
> [Interface]
> Address = 192.0.2.2/32,2001:db8:ffff:ffff:ffff:ffff:ffff:ffff/128
> -DNS = 192.0.2.0,yes
> +DNS = 192.0.2.0,invalid_value
> PrivateKey = TFlmmEUC7V7VtiDYLKsbP5rySTKLIZq1yn8lMqK83wo=
> [Peer]
> AllowedIPs = 0.0.0.0/0, ::0/0
> -- 
> 2.30.1 (Apple Git-130)
> 
> 

Thanks! The patch looks good, if you can send a v2 with a Signed-off-by
line I'd be happy to apply this.

Cheers,
Harsh Shandilya
