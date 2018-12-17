Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE09C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 14:52:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B47206A2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 14:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uR8mWe0f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B47206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f5e16f2;
	Mon, 17 Dec 2018 14:51:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75747820
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 14:51:50 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5f59bfc
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 14:51:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a62so12629599wmh.4
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+k+dh+lCF2+B5J6I44hdfSZTfuLRzPcm6E6vY9/oVd8=;
 b=uR8mWe0feY/uP53sTe7LczR47YYk9YptCC07CYxUFPYPWSPZ+NcyOY6C7he4cJ31lT
 JK0uNnuUNLa2L7KgH4oiDA26uDFeNqDoxuMlox4OKbf4n+GITiJg7lrzCvv05qGJnP9h
 7OIJ2xY3UAG3cbDbcXzQyjNAgoYBrfMeyDX7IdTG18ICbHBYM8wOffg3VNm43lY/IXbp
 bh7aJ+AC4oPJAvCzIgJ5opS+F9uH3W3BsY6fBf1rPfBfjSxt+U5N/3Vl7cU61cHpDpwB
 R7mSs3Qt1gr+mRAJfChHOtlaPIJOMjwAyxvFzu145a4yR0S3wF7wdZG8oM99G9VcvrIe
 9JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+k+dh+lCF2+B5J6I44hdfSZTfuLRzPcm6E6vY9/oVd8=;
 b=Ba7S/MVxBAjaLkmPKT8jjFNbg5t66dHMZA5oFbDQtP3+zofe+8t2IsRJYe/SiPLXUY
 hKkgVi97dQ0gru6JWJeNIHrhOxyOgYW5lW1EJgMNC599/aCvde4aeRgaX0AAUqoSM1iu
 Wx8aIHEX2QB0sXPijDOilp3iyU2bN4Cgmn0KXOxTRARiZkRfYHLFMmx+Dp0132gi/ff0
 zSEfZ4qioQsta202Hr/3fDSBE6rKUmI+ZlWC/H57ei9kYZSolCyzQ3XPYqS9r473TsJE
 2kwZ2t8vbIivASmvM6N90eKRcgZEzxdWUraG1iJkTDhBVOtweZfsLTTjjlbszwN+O4+b
 wddQ==
X-Gm-Message-State: AA+aEWZ+SPVW/nDGgJ0gOgDiNbIBYXLs+vFdsyUZ7Fxy4pute1E+H8d4
 h5LzEWSSNYX0eqkGgUVptKgmnUNg
X-Google-Smtp-Source: AFSGD/X9gLdYZn0KkG398kwIN7OUAKOC45XABoNega2xjhLxUoaDcMktBjz9/dcRWcTvM+BP3JG0dA==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr12515067wmj.0.1545058328166; 
 Mon, 17 Dec 2018 06:52:08 -0800 (PST)
Received: from ?IPv6:2003:c5:5f2a:9600:2289:84ff:fe70:d494?
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.googlemail.com with ESMTPSA id x3sm656089wrd.19.2018.12.17.06.52.06
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Dec 2018 06:52:07 -0800 (PST)
Subject: Re: [PATCH v5 07/11] netlink: allow modification of transit net
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
 <20181215165613.5486-8-ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <88c5a857-187b-54b8-d15b-30d3be981085@gmail.com>
Date: Mon, 17 Dec 2018 15:52:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181215165613.5486-8-ju.orth@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 12/15/18 5:56 PM, Julian Orth wrote:
> +	ret = test_socket_net_capable(net ? : wg->transit_net);
I forgot to include the fix mentioned in [1]. I have fixed the commit in the
repository and I'll include the diff below.

diff --git a/src/netlink.c b/src/netlink.c
index f5c3a9e..90ff936 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -350,14 +350,20 @@ static int wg_get_device_done(struct netlink_callback *cb)

 static int set_socket(struct wg_device *wg, struct nlattr **attrs)
 {
-	struct wg_peer *peer;
-	struct nlattr *port_attr = attrs[WGDEVICE_A_LISTEN_PORT];
-	u16 port;
+	struct nlattr *netns_pid_attr, *netns_fd_attr, *port_attr;
 	struct net *net = NULL;
+	struct wg_peer *peer;
 	int ret = 0;
+	u16 port;
+
+	netns_pid_attr = attrs[WGDEVICE_A_TRANSIT_NETNS_PID];
+	netns_fd_attr = attrs[WGDEVICE_A_TRANSIT_NETNS_FD];
+	port_attr = attrs[WGDEVICE_A_LISTEN_PORT];
+
+	if (!netns_pid_attr && !netns_fd_attr && !port_attr)
+		return 0;

-	net = get_attr_net(attrs[WGDEVICE_A_TRANSIT_NETNS_PID],
-			attrs[WGDEVICE_A_TRANSIT_NETNS_FD]);
+	net = get_attr_net(netns_pid_attr, netns_fd_attr);
 	if (IS_ERR(net))
 		return PTR_ERR(net);
 	if (port_attr)

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-October/003459.html
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
