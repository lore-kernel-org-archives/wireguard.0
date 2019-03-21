Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6B0C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:05:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AA2218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=demfloro.ru header.i=@demfloro.ru header.b="FKUqvGgB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AA2218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=demfloro.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3fca9d7;
	Sat, 23 Mar 2019 00:03:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b2758f0
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 18:49:54 +0000 (UTC)
Received: from mx.demfloro.ru (demfloro.ru [IPv6:2a00:d880:5:aad::7682])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61b0b377
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 18:49:54 +0000 (UTC)
Received: from fire.localdomain (unknown [IPv6:2001:470:28:88::100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: demfloro)
 by mx.demfloro.ru (Postfix) with ESMTPSA id 44QG7b496dz9ky4;
 Thu, 21 Mar 2019 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=demfloro.ru; s=032019; 
 t=1553194219;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JKiTBs4ZeFQYcq801C2q+TgfAvwd5YaRqrpxT3xMk4=;
 b=FKUqvGgBU6q8/yHWSS3ePIYYhGcrmxPAop4uq8m5ABeFIcXDYC9HJGQRe9f+RzvV0spH0S
 vSO0zB3YHRUWrlvaLA95vHXXrOv2LwmY3Vo5vizuyIOsHiPKp02tG71a887K2E5vCy+J0w
 uD8GM7dvOlsY+r4dTwyHk+37aYh+TwmmhlfcisB0IXxdp189rUfZ4oW+efPzySzuruh/co
 QpbhvAKFtTUFzPOkXA6VwuDFY0qbUs11dkfeh9sTF4NheCp9tDbEsXDnHJlgZE9apzFMFK
 fthuE72y6vDJXNLt3S9OVjN4tA4hwPrleQCx2opqBlM5/m4nv8zj+z3TqBCUgQ==
Date: Thu, 21 Mar 2019 21:50:09 +0300
From: Dmitrii Tcvetkov <demfloro@demfloro.ru>
To: Andreas Hatzl <andreas@hatzl.org>
Subject: Re: VPN - excluding local IPs
Message-ID: <20190321215009.6f70500c@fire.localdomain>
In-Reply-To: <18914224.dsVBvaN9Bx@bot>
References: <18914224.dsVBvaN9Bx@bot>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=demfloro.ru;
 s=arc032019; t=1553194219;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JKiTBs4ZeFQYcq801C2q+TgfAvwd5YaRqrpxT3xMk4=;
 b=UWG4SsNeTzCYfQ3eZPa9tid1SsXfoLMVgHcYK+gBlvEjRCFqNr33dI3Lu/lYAH3Mem2sb0
 UAqKXRfzrXFxk6PajAuFRC1I4u6OW0IV+1XfP37jIDIz5HK7I610KuW+Ryn0D/V6UkBpu8
 gD6Jj9Z/yJdGoktaJ4B4aph+QWWg0+lMj/ByjkLLeH2rmAKucHPwJMbnGCC7C5L9MTMKiy
 fbnhFfbFGAf8Og1W8DuUcSke49sISZYJnjvOoWI9trV1tk2HYQfriHmsM2D9kVP9SQWR7s
 BCU1hIBUYor1YpgqAbmKvmvwfyGQ2GxEIc4aecNIXqJV/iAIEZ+DNqgKdnja/Q==
ARC-Seal: i=1; s=arc032019; d=demfloro.ru; t=1553194219; a=rsa-sha256; cv=none;
 b=bpKFgCbj3smRLsFq4gN4GJA8uYmCY0gJSW7XIbp5AO9FU2frXd3O3iZRVjO13fYnyhJ3Ob
 eBKrI2mwVXrfM8Gu1cd9Yz3J7nGCIA9Zt9jjossmtSCGcyvf0IyKbJpADPMO/VAwI6zuLe
 Cd3p4yjs0MQioMOlVkrIUYGwfYmMuRU4u2DTWOFgrFPWreWmuCMCyqMgvegB9ulfy19BVx
 g/3KZH+QGwsIAbcxgxcQV/P7vjB3kIqUd7KWfxVDAobE8Jbgn5et73K61cFSbzsOi3t/xw
 ZBWIQPr1qEFySYPSn7E+a3d8qnt1ICFjQGUvD9vKIj02G+K6mKtnFQuM4Jf0pw==
ARC-Authentication-Results: i=1; mx.demfloro.ru;
 auth=pass smtp.auth=demfloro smtp.mailfrom=demfloro@demfloro.ru
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:03:40 +0100
Cc: wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, 21 Feb 2019 16:08:50 +0100
Andreas Hatzl <andreas@hatzl.org> wrote:

> Hi,
> 
> I have successfully set up a wireguard VPN between my notebook
> (Manjaro behind NAT) and my virtual server (ubuntu 18.04). The only
> "issue" left is that I can't connect to local devices on the client
> while using wireguard. Is there a way to exclude an IP range from
> using wireguard? 
> 
> my client config:
> [Interface]
> Address = 10.x.y.z/32
> PrivateKey = xyz
> 
> [Peer]
> PublicKey =xyz
> Endpoint = xyz:51820
> AllowedIPs = 0.0.0.0/0
> PersistentKeepalive = 21
> 
> I am aware that the solution for this has most likely been posted a
> lot of times but I can't find anything on the Wireguard page or
> Google.
> 
> It would be great if somebody could help me with this.
> 
> Thanks
> 
> Andreas

That's odd, if I understood correctly, your setup looks kinda this, if
not, please correct me:

|---------|
|notebook |
|---------|
172.16.0.2/24 private
10.0.0.0.2/24 inside tunnel


-------------------|
Example LAN device |
-------------------|
172.16.0.3/24 private


        private 172.16.0.1/24
     |--------------------|
-----|   router with NAT  |-------------
     |--------------------|
          2.3.4.5 public


1.2.3.4 public
10.0.0.1/24 inside tunnel
-----------------|
WireGuard server |
-----------------|

So in this example before connecting to VPN notebook would have:
direct route to 172.16.0.0/24
default route via 172.16.0.1

After connecting to VPN, assuming that VPN setup overrides default
route:
direct route to 172.16.0.0/24
direct route to 10.0.0.0/24
static route to 1.2.3.4 via 172.16.0.1 (for encrypted WG traffic)
default route via 10.0.0.1

In that case there would not be any problem for notebook to communicate
with "example LAN device" unless firewall on the notebook or the "LAN
device" interferes.

As far as I know there is no straightforward way to exclude networks
from AllowedIPs, but you can enumerate all public IPv4 prefixes, like
Android WireGuard client does:

200.0.0.0/5,172.64.0.0/10,172.128.0.0/9,12.0.0.0/6,16.0.0.0/4,11.0.0.0/8,
32.0.0.0/3,128.0.0.0/3,196.0.0.0/6,64.0.0.0/2,172.0.0.0/12,194.0.0.0/7,
192.160.0.0/13,192.0.0.0/9,192.170.0.0/15,160.0.0.0/5,192.128.0.0/11,
193.0.0.0/8,208.0.0.0/4,192.172.0.0/14,176.0.0.0/4,192.169.0.0/16,
0.0.0.0/5,174.0.0.0/7,192.176.0.0/12,192.192.0.0/10,8.0.0.0/7,
172.32.0.0/11,173.0.0.0/8,168.0.0.0/6

But if you just replace 0.0.0.0/0 with this in AllowedIPs line without
fixing routing then WireGuard will just reject packets which don't
belong to these prefixes. Network stack of the notebook should route
packets to the LAN, AllowedIPs is more of a precaution in this case.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
